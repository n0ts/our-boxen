class projects::td_agent {
  notify { 'class project::td_agent declared': }

  define install_plugin() {
    $td_agent_root = '/opt/td-agent'
    $gem = "${td_agent_root}/usr/sbin/td-agent-gem"
    $unless = "${gem} list | grep \"fluent-plugin-${name}\""
    exec { "install-pluguin-${name}":
      command => "${gem} install fluent-plugin-${name}",
      cwd => $td_agent_root,
      environment =>
        [
          'BUNDLE_GEMFILE=${td_agent_root}',
         ],
      user    => 'root',
      unless  => $unless,
      require => [ Package['td-agent'], Sudoers['td-agent-gem'] ],
    }
  }


  include brewcask
  package { 'td-agent':
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }

  # Require for td-agent-gem
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
