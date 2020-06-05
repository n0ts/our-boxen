# Public: fonts
class people::n0ts::fonts {
  notify { 'class people::n0ts::fonts declared': }

  # Homebrew-cask
  include brewcask

  # Homebrew-cask fonts
  homebrew::tap { 'homebrew/cask-fonts': }
  package {
    [
     'font-dejavu',
     'font-inconsolata',
     'font-noto-color-emoji',
     'font-noto-emoji',
     'font-noto-sans',
     'font-noto-sans-cjk-jp',
     'font-noto-sans-cjk-kr',
     'font-noto-sans-gothic',
     'font-noto-serif',
     'font-source-code-pro',
     ]:
       provider => 'brewcask',
       require  => [ Homebrew::Tap['homebrew/cask-fonts'], Package['subversion'] ],
  }

  # Ricty font
  homebrew::tap { 'sanemat/font': }
  package { 'ricty':
    # --dz: Use Inconsolata-dz instead of Inconsolata
    install_options => [
                        '--with--powerline',
                        ],
    require => Homebrew::Tap["sanemat/font"],
  }
  exec { 'Install Ricty fonts':
    command => "cp -f ${homebrew::config::installdir}/share/fonts/Ricty*.ttf ~/Library/Fonts/ && fc-cache -vf",
    require => Package['ricty'],
    unless  => 'test -f ~/Library/Fonts/Ricty-Regular.ttf',
  }
}
