class people::n0ts::boxen {
  notify { 'class people::n0ts::boxen declared': }

  require boxen::config

  $dir = "${boxen::config::srcdir}/boxen"

  file { $dir:
    ensure => link,
    target => '/Users/Shared/prj/github',
    require => File['/Users/Shared/prj/github'],
  }
}
