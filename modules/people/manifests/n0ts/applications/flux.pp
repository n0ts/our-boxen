class people::n0ts::applications::flux {
  notify { 'class people::n0ts::applications::flux declared': }

  boxen::osx_defaults { 'Flux - location':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'location',
    value  => 0,
  }

  boxen::osx_defaults { 'Flux - locationTextfield':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'locationTextField',
    value  => 'Tokyo',
  }

  boxen::osx_defaults { 'Flux - steptime':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'steptime',
    value  => 24,
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
    value  => '4155.590160472973',
  }

  boxen::osx_defaults { 'Flux - lateColorTemp':
    user   => $::boxen_user,
    domain => 'org.herf.Flux',
    key    => 'lateColorTemp',
    value  => '3371.062077702702',
  }
}
