class projects::postgresql {
  notify { 'class project::postgresql declared': }

  package { 'postgresql':
    ensure => '9.5.4',
  }

  file { "${boxen::config::homebrewdir}/var/postgres/postgresql.conf":
    content => template('projects/shared/postgresql.conf.erb'),
    require => Package['postgresql'],
  }

  file { "${boxen::config::homebrewdir}/var/log/postgres":
    ensure  => directory,
    require => Package['postgresql'],
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist":
    ensure  => link,
    target  => "${boxen::config::homebrewdir}/opt/postgresql/homebrew.mxcl.postgresql.plist",
    require => File["${boxen::config::homebrewdir}/var/postgres/postgresql.conf"],
    notify  => Exec['load-postgresql'],
  }

  exec { 'load-postgresql':
    command     => "launchctl load /Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist",
    require     => File["${boxen::config::homebrewdir}/var/postgres/postgresql.conf"],
    refreshonly => true,
  }

  boxen::env_script { 'postgresql':
    priority => 'normal',
    content  => template('projects/shared/postgresql.sh.erb'),
  }
}
