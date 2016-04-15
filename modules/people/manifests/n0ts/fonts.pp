class people::n0ts::fonts {
  notify { 'class people::n0ts::fonts declared': }

  # Homebrew-cask
  include brewcask

  # Homebrew-cask fonts
  homebrew::tap { 'caskroom/fonts': }
  package {
    [
     'font-dejavu-sans',
     'font-inconsolata',
     'font-noto-color-emoji.rb',
     'font-noto-emoji.rb',
     'font-noto-sans',
     'font-noto-sans-cjk-jp',
     'font-noto-sans-cjk-kr',
     'font-noto-sans-gothic',
     'font-noto-serif',
     'font-source-code-pro',
     ]:
       provider => 'brewcask',
       require  => Homebrew::Tap['caskroom/fonts'],
  }

  # Ricty font
  homebrew::tap { 'sanemat/font': }
  package { 'ricty':
    # --dz: Use Inconsolata-dz instead of Inconsolata
    install_options => [
                        '--dz',
                        '--powerline',
                        '--vim-powerline'
                        ],
    require => Homebrew::Tap["sanemat/font"],
  }
  exec { 'Install Ricty fonts':
    command => "cp -f ${homebrew::config::installdir}/share/fonts/Ricty*.ttf ~/Library/Fonts/ && fc-cache -vf",
    require => Package['ricty'],
    unless  => 'test -f ~/Library/Fonts/Ricty-Regular.ttf',
  }
}
