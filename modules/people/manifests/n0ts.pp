# Public: n0ts
class people::n0ts {
  notify { "class people::n0ts declared - ${::macosx_productversion_major}": }

  if $::boxen_projects == '' {
    include people::n0ts::base
    include people::n0ts::boxen
    include people::n0ts::config
    include people::n0ts::git
    include people::n0ts::ssh
    include people::n0ts::sudo
    include people::n0ts::home

    include people::n0ts::fonts

    include people::n0ts::applications
    include people::n0ts::applications::one_password
    include people::n0ts::applications::caffeine
    include people::n0ts::applications::evernote
    include people::n0ts::applications::karabiner
    include people::n0ts::applications::flux
    include people::n0ts::applications::hammerspoon
    include people::n0ts::applications::iterm2
    include people::n0ts::applications::totalfinder
    include people::n0ts::applications::totalspaces

    include people::n0ts::shell
  }
}
