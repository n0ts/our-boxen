# Public: iterm2
class people::n0ts::applications::iterm2 {
  notify { 'class people::n0ts::applications::iterm2 declared': }

  file { "${::boxen_home}/cache/iterm2":
    ensure => directory,
  }

  people::n0ts::applications::iterm2::theme {
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
      url => 'https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes';
  }
}
