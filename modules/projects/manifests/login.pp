# Public: login
class projects::login {
  notify { 'class projects::login declared': }

  projects::login::item {
      [
       'Alfred 3',
       'Bartender 3',
       'BetterTouchTool',
       'Box Sync',
       'Caffeine',
       'Display Menu',
       'Dropbox',
       'Flux',
       'Growl',
       'Hammerspoon',
       'HyperSwitch',
       'Plain Text - Remove Text Format',
       'Resilio Sync',
       'TotalFinder',
       ]:
  }

  if versioncmp($::macosx_productversion_major, '10.11') <= 0 {
    projects::login::item { 'BetterSnapTool': }
  } else {
    projects::login::item { 'Karabiner-Elements':
      hidden => true,
    }
  }

  $is_macbook = $sp_machine_name ? {
    /^MacBook.*/ => true,
    default      => false,
  }

  if $is_macbook {
    osx_login_item { 'iTunesHelper':
      ensure  => 'absent',
    }
  }
}
