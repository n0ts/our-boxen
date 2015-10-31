class people::n0ts::home {
  notify { 'class people::n0ts::home declared': }

  file { "/Users/${::boxen_user}/.bin.local":
    ensure => directory,
    mode   => 755,
    owner  => $::boxen_user,
  }
}
