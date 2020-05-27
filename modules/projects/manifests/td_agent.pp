# Public: td-agent
class projects::td_agent {
  notify { 'class projects::td_agent declared': }

  include brewcask
  package { 'td-agent':
    provider => 'brewcask',
  }

  $td_agent_root = '/opt/td-agent'
  file { "${td_agent_root}/Gemfile":
    content => template('projects/shared/td-agent-gemfile.erb'),
    require => Package['td-agent'],
  }

  sudoers { 'td-agent-gem':
    users    => root,
    hosts    => 'ALL',
    commands => [
      '(ALL) NOPASSWD : /opt/td-agent/usr/sbin/td-agent-gem',
    ],
    type     => 'user_spec',
  }

  projects::td_agent::plugin {
    [
      'elasticsearch',
      'datadog_event',
      'dogstatsd',
      'file-alternative',
      'filter_typecast',
      'flowcounter',
      'forest',
      'grep',
      'map',
      'record-modifier',
      'record-reformer',
      'typecast',
    ]: ;
  }

  file { "${boxen::config::home}/bin/td-agent-gems-update":
    content => "#!/bin/bash
GEM=/opt/td-agent/usr/sbin/td-agent-gem
for i in \$(\$GEM list | cut -d ' ' -f 1 | grep fluent); do
  \$GEM install --no-document \$i
done
",
    mode    => '0755',
  }
}
