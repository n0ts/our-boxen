# Public: boxen
class people::n0ts::boxen {
  notify { 'class people::n0ts::boxen declared': }

  require boxen::config

  file { "${boxen::config::srcdir}/boxen":
    ensure => link,
    target => '/Users/Shared/prj/github',
    require => File['/Users/Shared/prj/github'],
  }
}
