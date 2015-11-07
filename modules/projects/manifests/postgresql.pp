class projects::postgresql {
  notify { 'class project::postgresql declared': }

  package { 'postgresql': }

  file { "/Users/${::boxen_user}/Library/LaunchAgents":
    ensure => directory,
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist":
    ensure  => link,
    target  => "${::boxen_home}/homebrew/opt/postgresql/homebrew.mxcl.postgresql.plist",
    require => [ File["/Users/${::boxen_user}/Library/LaunchAgents"], Package['postgresql'] ],
    notify  => Exec['load-postgresql'],
  }

  exec { 'load-postgresql':
    command     => 'launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist',
    refreshonly => true,
  }

  $var_run_dir = "${boxen::config::home}/homebrew/var/run"
  boxen::env_script { 'postgresql':
    priority => 'normal',
    content  => template('projects/shared/postgresql.sh.erb'),
  }
}
