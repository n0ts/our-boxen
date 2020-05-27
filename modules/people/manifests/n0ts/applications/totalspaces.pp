# Public: totalspaces
class people::n0ts::applications::totalspaces {
  notify { 'class people::n0ts::applications::totalspaces declared': }

  boxen::osx_defaults { 'TotalSpaces - transitionEffect':
    user   => $::boxen_user,
    domain => 'com.binaryage.TotalSpaces2',
    key    => 'transitionEffect',
    value  => 'Fade',
  }

  boxen::osx_defaults { 'TotalSpaces - transitionSpeed':
    user   => $::boxen_user,
    domain => 'com.binaryage.TotalSpaces2',
    key    => 'transitionSpeed',
    value  => 110,
  }
}
