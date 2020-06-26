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
     'font-ricty-diminished',
     'font-source-code-pro',
     ]:
       provider => 'brewcask',
       require  => [ Homebrew::Tap['homebrew/cask-fonts'], Package['subversion'] ],
  }
}
