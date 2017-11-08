class people::n0ts::applications::login_items {
  notify { 'class people::n0ts::applications::login_items declared': }

  define login_item($hidden = false) {
    $global_application = "/Applications/${name}.app"
    $user_application = "/Users/${::boxen_user}/Applications/${name}.app"
    if file_exists($global_application) {
      $application = $global_application
    }
    elsif file_exists($user_application) {
      $application = $user_application
    }
    else {
      $application = $name
    }

    if file_exists($application) {
      osx_login_item { $name:
        ensure  => 'present',
        path    => $application,
        hidden  => $hidden,
      }
    }
    else {
      notify { "${application} is not exists.": }
    }
  }

  login_item {
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
       'TotalSpaces2',
       ]:
  }

  if versioncmp($::macosx_productversion_major, '10.11') < 0 {
    login_item { 'BetterSnapTool': }
  } else {
    login_item { 'Karabiner-Elements':
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
