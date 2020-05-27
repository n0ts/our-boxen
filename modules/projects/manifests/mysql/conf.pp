# Public: mysql::conf
define projects::mysql::conf() {
  $confdir = "${boxen::config::homebrewdir}/etc/my.cnf.d"
  file { "${confdir}/${name}.cnf":
    content => template("projects/shared/mysql-${name}.cnf.erb"),
    require => File["${boxen::config::homebrewdir}/etc/my.cnf.d"],
  }
}
