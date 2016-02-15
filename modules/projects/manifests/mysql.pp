class projects::mysql {
  notify { 'class project::mysql declared': }

  define install_conf() {
    $confdir = '/opt/boxen/homebrew/etc/my.cnf.d'
    file { "${confdir}/${name}.cnf":
      content => template("projects/shared/mysql-${name}.cnf.erb"),
      require => Package['mysql'],
    }
  }


  # mysqld --defaults-file=${boxen::config::homebrewdir}/etc/my.cnf --initialize --log-error-verbosity=3
  # ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
  package { 'mysql':
    ensure => '5.7.11';
  }

  file { "${boxen::config::homebrewdir}/var/log/mysql":
    ensure  => directory,
    require => Package['mysql'],
  }

  install_conf {
    [
     'client',
     'mysqld',
     'mysqld_safe'
     ]: ;
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.mysql.plist":
    ensure  => link,
    target  => "${boxen::config::homebrewdir}/opt/mysql/homebrew.mxcl.mysql.plist",
    require => File["${boxen::config::homebrewdir}/etc/my.cnf.d/mysqld.cnf"],
    notify  => Exec['load-mysql'],
  }

  exec { 'load-mysql':
    command     => "launchctl load /Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.mysql.plist",
    require     => File["${boxen::config::homebrewdir}/etc/my.cnf.d/mysqld.cnf"],
    refreshonly => true,
  }
}
