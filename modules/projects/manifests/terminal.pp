# Public: terminal
class projects::terminal {
  notify { 'class projects::terminal declared': }

  $shell = "${boxen::config::homebrewdir}/bin/zsh"

  package { 'zsh':
    ensure => latest,
  }

  class { 'osx::terminal::shell':
    shell   => $shell,
    require => Package['zsh'],
  }

  file { "/Users/${::boxen_user}/.iterm2":
    ensure => directory,
  }

  file { "${::boxen_home}/cache/terminal":
    ensure => directory,
  }

  # Shell integration
  projects::terminal::integration {
    [
     "bash",
     "fish",
     "tsch",
     "zsh",
     ]: ;
  }

  # Startup Windows Settings
  boxen::osx_defaults { 'Startup Window Settings':
    user    => $::boxen_user,
    domain  => 'com.apple.Terminal',
    key     => 'Startup Window Settings',
    value   => 'n0ts',
    require => Exec['install-theme-n0ts'],
  }

  boxen::osx_defaults { 'Default Window Settings':
    user    => $::boxen_user,
    domain  => 'com.apple.Terminal',
    key     => 'Default Window Settings',
    value   => 'n0ts',
    require => Exec['install-theme-n0ts'],
  }

  # Code
  projects::terminal::code {
    [
       "imgls", "imgcat", "divider",
     ]: ;
  }

  # Themes
  projects::terminal::theme {
    [
      'n0ts',
      'n0ts-solarized',
     ]:
      url => 'https://raw.githubusercontent.com/n0ts/osx-terminal.app-n0ts/master';
    [
      '3024 Day',
      '3024 Night',
      'AdventureTime',
      'Afterglow',
      'AlienBlood',
      'Argonaut',
      'Arthur',
      'AtelierSulphurpool',
      'Atom',
      'AtomOneLight',
      'Batman',
      'Belafonte Day',
      'Belafonte Night',
      'BirdsOfParadise',
      'Blazer',
      'Borland',
      'Broadcast',
      'Brogrammer',
      'C64',
      'CLRS',
      'Chalk',
      'Chalkboard',
      'Ciapre',
      'Cobalt Neon',
      'Cobalt2',
      'CrayonPonyFish',
      'Dark Pastel',
      'Darkside',
      'Desert',
      'DimmedMonokai',
      'Dracula',
      'ENCOM',
      'Earthsong',
      'Elemental',
      'Espresso Libre',
      'Espresso',
      'Fideloper',
      'FishTank',
      'Flat',
      'Flatland',
      'Floraverse',
      'FrontEndDelight',
      'FunForrest',
      'Galaxy',
      'Github',
      'Grape',
      'Grass',
      'Hardcore',
      'Harper',
      'Highway',
      'Hipster Green',
      'Homebrew',
      'Hurtado',
      'Hybrid',
      'IC_Green_PPL',
      'IC_Orange_PPL',
      'IR_Black',
      'Jackie Brown',
      'Japanesque',
      'Jellybeans',
      'Kibble',
      'Later This Evening',
      'Lavandula',
      'LiquidCarbon',
      'LiquidCarbonTransparent',
      'LiquidCarbonTransparentInverse',
      'Man Page',
      'Material',
      'MaterialDark',
      'Mathias',
      'Medallion',
      'Misterioso',
      'Molokai',
      'MonaLisa',
      'Monokai Soda',
      'N0tch2k',
      'Neopolitan',
      'Neutron',
      'NightLion v1',
      'NightLion v2',
      'Novel',
      'Obsidian',
      'Ocean',
      'OceanicMaterial',
      'Ollie',
      'Parasio Dark',
      'PaulMillr',
      'PencilDark',
      'PencilLight',
      'Piatto Light',
      'Pnevma',
      'Pro',
      'Red Alert',
      'Red Sands',
      'Rippedcasts',
      'Royal',
      'SeaShells',
      'Seafoam Pastel',
      'Seti',
      'Shaman',
      'Slate',
      'Smyck',
      'SoftServer',
      'Solarized Darcula',
      'Solarized Dark Higher Contrast',
      'Solarized Dark',
      'Solarized Light',
      'SpaceGray Eighties Dull',
      'SpaceGray Eighties',
      'SpaceGray',
      'Spacedust',
      'Spiderman',
      'Spring',
      'Square',
      'Sundried',
      'Symfonic',
      'Teerb',
      'Terminal Basic',
      'Thayer Bright',
      'The Hulk',
      'Tomorrow Night Blue',
      'Tomorrow Night Bright',
      'Tomorrow Night Eighties',
      'Tomorrow Night',
      'Tomorrow',
      'ToyChest',
      'Treehouse',
      'Twilight',
      'Urple',
      'Vaughn',
      'VibrantInk',
      'WarmNeon',
      'Wez',
      'WildCherry',
      'Wombat',
      'Wryan',
      'Zenburn',
      'idleToes',
     ]:
      url => 'https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/terminal';
  }

  # Encodings
  $encodings = [
                '4',          # Unicode (UTF-8)
                '2147485224', # Japanese (Shift JIS X0213)
                '21',         # Japannse (ISO 2022-JP)
                '3',          # Japanese (EUC)
                '2147486209', # Japanese (Shift JIS)
                ]
  boxen::osx_defaults { 'Terminal - Encodings':
    user    => $::boxen_user,
    domain  => 'com.apple.Terminal',
    key     => 'StringEncodings',
    type    => 'array',
    value   => $encodings,
  }


  # TotalTerminal is no longer support
  if versioncmp($::macosx_productversion_major, '10.11') <= 0 {
    include brewcask

      package { 'totalterminal':
      provider => 'brewcask',
    }

    osx_login_item { 'TotalTerminal':
      ensure  => 'present',
      path    => '/Applications/TotalTerminal.app',
      require => Package['totalterminal'],
    }

    boxen::osx_defaults { 'TotalTerminalVisorHideOnEscape':
      user    => $::boxen_user,
      domain  => 'com.apple.Terminal',
      key     => 'TotalTerminalVisorHideOnEscape',
      value   => 0,
    }

    boxen::osx_defaults { 'TotalTerminalVisorAnimationSpeed':
      user    => $::boxen_user,
      domain  => 'com.apple.Terminal',
      key     => 'TotalTerminalVisorAnimationSpeed',
      value   => '0.1',
    }

    boxen::osx_defaults { 'TotalTerminalCopyOnSelect':
      user    => $::boxen_user,
      domain  => 'com.apple.Terminal',
      key     => 'TotalTerminalCopyOnSelect',
      value   => 1,
    }

    boxen::osx_defaults { 'TotalTerminalPasteOnRightClick':
      user    => $::boxen_user,
      domain  => 'com.apple.Terminal',
      key     => 'TotalTerminalPasteOnRightClick',
      value   => 1,
    }
  }
}
