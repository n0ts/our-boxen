# Public: caffeine
class people::n0ts::applications::caffeine {
  notify { 'class people::n0ts::applications::caffeine declared': }

  boxen::osx_defaults { 'Caffeine - Disable active on launch':
    user    => $::boxen_user,
    domain  => 'com.lightheadsw.caffeine',
    key     => 'ActivateOnLaunch',
    value   => 0,
  }
}
