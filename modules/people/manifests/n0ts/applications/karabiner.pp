class people::n0ts::applications::karabiner {
  notify { 'class people::n0ts::applications::karabiner declared': }

  define myset($value) {
    karabiner::set { $name:
      value   => $value,
      profile => $::boxen_user
    }
  }


  # Now, Karabiner is not support Sierra 10.12
  if versioncmp($::macosx_productversion_major, '10.11') <= 0 {
    include karabiner

    karabiner::profile { $::boxen_user: }

    myset {
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
    class { '::karabiner':
      launch_on_login => false,
    }

    include brewcask

    package { 'karabiner-elements':
       provider => 'brewcask',
    }
  }
}
