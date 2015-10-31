class people::n0ts::applications::karabiner {
  notify { 'class people::n0ts::applications::karabiner declared': }

  include karabiner

  karabiner::profile { $::boxen_user: }

  define myset($value) {
    karabiner::set { $name:
      value   => $value,
      profile => $::boxen_user
    }
  }

  # in future, profile $::boxen_user
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
}
