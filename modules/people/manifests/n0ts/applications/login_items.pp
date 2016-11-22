class people::n0ts::applications::login_items {

  define login_item() {
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
      exec { "n0ts-applications-login_items-open-${name}":
        command   => "open '${application}'",
        refreshonly => true,
      }

      osx_login_item { $name:
        ensure  => 'present',
        path    => $application,
        notify  => Exec["n0ts-applications-login_items-open-${name}"],
      }

    }
    else {
      notify { "${application} is not exists.": }
    }
  }

  notify { 'class people::n0ts::applications::login_items declared': }

  login_item {
      [
       'Alfred 2',
       'Bartender 2',
       'BetterTouchTool',
       'BitTorrent Sync',
       'Caffeine',
       'Display Menu',
       'Dropbox',
       'Flux',
       'Growl',
       'HyperSwitch',
       'Plain Text - Remove Text Format',
       'TotalFinder',
       'TotalSpaces2',
       ]:
  }

  if versioncmp($::macosx_productversion_major, '10.11') < 0 {
    login_item { 'BetterSnapTool': }
  } else {
    login_item { 'Karabiner-Elements': }
  }
}
