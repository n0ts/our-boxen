class projects::mysql {
  notify { 'class projects::mysql declared': }

  define install_conf() {
    $confdir = "${boxen::config::homebrewdir}/etc/my.cnf.d"
    file { "${confdir}/${name}.cnf":
      content => template("projects/shared/mysql-${name}.cnf.erb"),
      require => File["${boxen::config::homebrewdir}/etc/my.cnf.d"],
    }
  }


  package { 'mysql':
    ensure => '5.7.13';
  }

  file { "${boxen::config::homebrewdir}/etc/my.cnf":
    content => template("projects/shared/my.cnf.erb"),
    require => Package["mysql"],
  }

  file { "${boxen::config::homebrewdir}/etc/my.cnf.d":
    ensure  => directory,
    require => File["${boxen::config::homebrewdir}/etc/my.cnf"],
  }

  install_conf {
    [
     'client',
     'mysqld',
     'mysqld_safe',
     ]: ;
  }

  file { "${boxen::config::homebrewdir}/var/log/mysql":
    ensure  => directory,
    require => File["${boxen::config::homebrewdir}/etc/my.cnf.d/mysqld.cnf"],
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents/homebrew.mxcl.mysql.plist":
    ensure  => link,
    target  => "${boxen::config::homebrewdir}/opt/mysql/homebrew.mxcl.mysql.plist",
    require => File["${boxen::config::homebrewdir}/etc/my.cnf.d/mysqld.cnf"],
    notify  => Exec['mysql'],
  }

  file { "${boxen::config::homebrewdir}/opt/mysql/bin/mysql.sh":
    content => template("projects/shared/mysql.sh.erb"),
    mode    => 0775,
    require => Package["mysql"],
  }

  file { "${boxen::config::homebrewdir}/opt/mysql/bin/mysql.sql":
    content => template("projects/shared/mysql.sql.erb"),
    require => Package["mysql"],
  }

  exec { 'mysql':
    command     => "${boxen::config::homebrewdir}/opt/mysql/bin/mysql.sh",
    require     => Package["mysql"],
    refreshonly => true,
  }
}
