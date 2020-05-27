# Public: flux
class people::n0ts::applications::flux {
  notify { 'class people::n0ts::applications::flux declared': }

  boxen::osx_defaults { 'Flux - location':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'location',
    value  => '35.658100,139.701742',
  }

  boxen::osx_defaults { 'Flux - locationTextfield':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'locationTextField',
    value  => 'Tokyo Station',
  }

  boxen::osx_defaults { 'Flux - locationType':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'locationType',
    value  => 'L',
  }

  boxen::osx_defaults { 'Flux - steptime':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'steptime',
    value  => 24,
  }

  boxen::osx_defaults { 'Flux - darkTheme':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'darkTheme',
    value  => 0,
  }

  boxen::osx_defaults { 'Flux - wakeNotifyDisable':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'wakeNotifyDisable',
    value  => "-1",
  }

  boxen::osx_defaults { 'Flux - wakeTime':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'wakeTime',
    value  => 360,
  }

  boxen::osx_defaults { 'Flux - dayColorTemp':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'dayColorTemp',
    value  => 4200,
  }

  boxen::osx_defaults { 'Flux - lateColorTemp':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'lateColorTemp',
    value  => 2700,
  }
}
