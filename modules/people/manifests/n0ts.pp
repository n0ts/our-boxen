class people::n0ts {
  notify { "class people::n0ts declared - ${::macosx_productversion_major}": }

  #
  # This manifest support only OS X 10.9(Mavericks) or later
  #
  if versioncmp($::macosx_productversion_major, '10.9') < 0 {
    fail("This manifest support only OS X 10.9 or later - ${::macosx_productversion}")
  }

  if $::boxen_projects == '1' {
    include people::n0ts::base
    include people::n0ts::boxen
    include people::n0ts::config
    include people::n0ts::git
    include people::n0ts::ssh
    include people::n0ts::sudo
    include people::n0ts::home

    include people::n0ts::fonts

    include people::n0ts::applications
    include people::n0ts::applications::1password
    include people::n0ts::applications::caffeine
    include people::n0ts::applications::evernote
    include people::n0ts::applications::karabiner
    include people::n0ts::applications::flux
    include people::n0ts::applications::divvy
    include people::n0ts::applications::jumpcut
    include people::n0ts::applications::hammerspoon
    include people::n0ts::applications::iterm2
    include people::n0ts::applications::totalfinder
    include people::n0ts::applications::totalspaces
    include people::n0ts::applications::login_items
    include people::n0ts::applications::widgets

    include people::n0ts::shell
  }
}
