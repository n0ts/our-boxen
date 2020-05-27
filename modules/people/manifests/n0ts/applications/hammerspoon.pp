# Public: hammerspoon
class people::n0ts::applications::hammerspoon {
  notify { 'class people::n0ts::applications::hammerspoon declared': }

  package { 'hammerspoon':
    provider => 'brewcask',
  }

  repository {  "/Users/${::boxen_user}/.hammerspoon":
    source => 'n0ts/hammerspoon-init',
    extra  => [ '-b', 'my-dev' ],
    notify => Exec['open hammerspoon.app'],
  }

  exec { 'open hammerspoon.app':
    command     => 'open /Applications/Hammerspoon.app',
    require     => Package['hammerspoon'],
    refreshonly => true,
  }
}
