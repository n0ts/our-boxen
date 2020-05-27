# Public: divvy
class people::n0ts::applications::divvy {
  if file_exists("/Applications/Divvy.app") == false {
    notify { 'Divvy is available at AppStore': }
  }

  boxen::osx_defaults { 'Divvy - Column Count':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'defaultColumnCount',
    value   => 10,
  }

  boxen::osx_defaults { 'Divvy - Row Count':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'defaultRowCount',
    value   => 10,
  }

  boxen::osx_defaults { 'Divvy - WindowMarginWidth':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'defaultWindowMarginWidth',
    value   => 10,
  }

  boxen::osx_defaults { 'Divvy - Monitor Cycyling':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'useMonitorCycling',
    value   => true,
  }

  boxen::osx_defaults { 'Divvy - Use Global Hotkey':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'useGlobalHotkey',
    value   => 1,
  }

  $hotkey = { 'keyCode' => 2, 'modifiers' => 2048 }
  boxen::osx_defaults { 'Divvy - Global Hotkey':
    user    => $::boxen_user,
    domain  => 'com.mizage.divvy',
    key     => 'globalHotkey',
    type    => 'dict',
    value   => $hotkey,
  }
}
