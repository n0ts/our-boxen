class people::n0ts::applications::hammerspoon {
  notify { 'class people::n0ts::applications::hammerspoon declared': }

  define install_init() {
    exec { "get-hammerspoon-${name}.lua":
      command => "curl -L https://raw.githubusercontent.com/n0ts/hammerspoon-init/my-dev/${name}.lua > /Users/${::boxen_user}/.hammerspoon/${name}.lua",
      creates => "/Users/${::boxen_user}/.hammerspoon/${name}.lua",
      require => Package["hammerspoon"],
    }
  }

  install_init {
    [
     'init',
     'watcher',
    ]: ;
  }
}
