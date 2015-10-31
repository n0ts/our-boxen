class people::n0ts::applications::jumpcut {
  notify { 'class people::n0ts::applications::jumpcut declared': }

  # command + option + v
  $hot_key = { 'keyCode' => 9, 'modifierFlags' => 1572864 }
  boxen::osx_defaults { 'Jumpcut - Hot Key':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'ShortcutRecorder mainHotkey',
    type    => 'dict',
    value   => $hot_key,
  }

  boxen::osx_defaults { 'Jumpcut - Number of remember':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'displayNum',
    value   => 50,
  }

  boxen::osx_defaults { 'Jumpcut - Number of display':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'rememberNum',
    value   => 50,
  }

  boxen::osx_defaults { 'Jumpcut - Startup':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'SUCheckAtStartup',
    value   => 1,
  }

  boxen::osx_defaults { 'Jumpcut - Load on startup':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'loadOnStartup',
    value   => 1,
  }

  boxen::osx_defaults { 'Jumpcut - Sticky bezel':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'stickyBezel',
    value   => 1,
  }

  boxen::osx_defaults { 'Jumpcut - Wraparound bezel':
    user    => $::boxen_user,
    domain  => 'net.sf.Jumpcut',
    key     => 'wraparoundBezel',
    value   => 1,
  }

}
