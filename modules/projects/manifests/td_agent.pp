class projects::td_agent {
  notify { 'class project::td_agent declared': }

  define install_plugin() {
    $td_agent_root = '/opt/td-agent'
    $td_agent_gems = "${td_agent_root}/embedded/lib/ruby/gems/2.1.0/gems"
    $gem = "${td_agent_root}/usr/sbin/td-agent-gem"
    $unless = "ls ${td_agent_gems}/fluent-plugin-${name}-*"
    exec { "install-pluguin-${name}":
      command => "${gem} install --no-document fluent-plugin-${name}",
      cwd => $td_agent_root,
      environment =>
        [
         "BUNDLE_GEMFILE=${td_agent_root}/Gemfile"
         ],
      user    => 'root',
      unless  => "${unless} >/dev/null 2>&1",
      require => [ Package['td-agent'], Sudoers['td-agent-gem'], File["${td_agent_root}/Gemfile"] ],
    }
  }

  include brewcask
  package { 'td-agent':
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }

  $td_agent_root = '/opt/td-agent'
  file { "${td_agent_root}/Gemfile":
    content => template('projects/shared/td-agent-gemfile.erb'),
    require => Package['td-agent'],
  }

  sudoers { 'td-agent-gem':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      '(ALL) SETENV:NOPASSWD: /opt/td-agent/usr/sbin/td-agent-gem',
    ],
    type     => 'user_spec',
  }

  install_plugin {
    [
      'elasticsearch',
      'dogstatsd',
      'file-alternative',
      'filter_typecast',
      'flowcounter',
      'forest',
      'record-reformer',
      's3',
      'typecast',
    ]: ;
  }
}
