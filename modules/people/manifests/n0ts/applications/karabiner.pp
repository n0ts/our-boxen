# Public: karabiner
class people::n0ts::applications::karabiner {
  notify { 'class people::n0ts::applications::karabiner declared': }

  #  Karabiner is not support 10.12 or later...
  if versioncmp($::macosx_productversion_major, '10.11') <= 0 {
    include karabiner

    karabiner::profile { $::boxen_user: }

    include karabiner_myset

    people::n0ts::applications::karabiner::myset {
      'notsave.automatically_enable_keyboard_device':
        value => 1;
      'repeat.initial_wait':
        value => 177;
      'repeat.wait':
        value => 16;
      'notsave.automatically_enable_pointing_device':
        value => 1;
      'option.emacsmode_controlLeftbracket':
        value => 1;
      'option.emacsmode_controlD':
        value => 1;
      'option.emacsmode_controlH':
        value => 1;
      'option.emacsmode_controlI':
        value => 1;
      'option.emacsmode_controlV':
        value => 1;
      'option.emacsmode_controlM':
        value => 1;
      'option.emacsmode_controlPNBF':
        value => 1;
      'option.emacsmode_optionV':
        value => 1;
    }
  } else {
    include brewcask

    # Karabiner-Elements
    # https://github.com/tekezo/Karabiner-Elements
    package { 'karabiner-elements':
      provider => 'brewcask',
    }

    file { "/Users/${::boxen_user}/.config":
      ensure => directory,
    }

    repository { "/Users/${::boxen_user}/.config/karabiner":
      source => 'n0ts/karabiner-config',
      notify => Exec['open karabiner-elements.app'],
    }

    exec { 'open karabiner-elements.app':
      command     => 'open /Applications/Karabiner-Elements.app',
      require     => Package['karabiner-elements'],
      refreshonly => true,
    }
  }
}
