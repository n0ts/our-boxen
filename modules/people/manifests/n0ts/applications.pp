class people::n0ts::applications {
  notify { 'class people::n0ts::applications declared': }

  # move to /Applications
  define move_to_applications($app_name) {
    $cask_room = "brew cask info ${name} | grep \"^${brewcask::config::cask_room}\" | cut -d \" \" -f 1"
    exec { "move ${name} ${app_name} to /Applications":
      command     => "rm -f \"/Applications/${app_name}.app\" && mv \"`${cask_room}`/${app_name}.app\" /Applications/",
      environment =>
        [
         "HOME=/Users/${boxen::config::boxen_user}",
         "HOMEBREW_CASK_OPTS=\"--caskroom=${brewcask::config::cask_room}\"",
         ],
      refreshonly => true,
      require     => Package[$name],
      subscribe   => Package[$name],
    }
  }

  # xquartz
  include xquartz

  # java
  class { 'java':
    update_version => '92',
    minor_version  => 'b14',
  }

  # Homebrew packages
  package {
    [
     # Search tool like grep, but optimized for programmers
     # http://beyondgrep.com/
     'ack',
     # Shell extension to jump to frequently used directories
     # https://github.com/wting/autojump
     'autojump',
     # Automatically restart SSH sessions and tunnels
     # http://www.harding.motd.ca/autossh/
     'autossh',
     # Human-friendly source code management (or 'version control')
     # http://bazaar.canonical.com/
     'bazaar',
     # Bash (Bourne-again SHell) is a UNIX command interpreter
     # https://www.gnu.org/software/bash/
     'bash',
     # Programmable bash completion
     # https://bash-completion.alioth.debian.org/
     'bash-completion',
     # Code converter on tty
     # http://vmi.jp/software/cygwin/cocot.html
     'cocot',
     # GNU File, Shell, and Text utilities
     # https://www.gnu.org/software/coreutils
     'coreutils',
     # Cluster ssh tool for Terminal.app
     # https://github.com/brockgr/csshx
     'csshx',
     # Get a file from an HTTP, HTTPS or FTP server
     # http://curl.haxx.se/
     'curl',
     # Secure your credentials in environment variables
     # https://github.com/sorah/envchain
     'envchain',
     # Infamous electronic fortune-cookie generator
     # http://ftp.ibiblio.org/pub/linux/games/amusements/fortune/!INDEX.html
     'fortune',
     # Fuzzy finder for your shell
     # https://github.com/junegunn/fzf
     'fzf',
     # GeoIP databases in a number of formats
     # https://github.com/maxmind/geoip-api-c
     'geoip',
     # GNU internationalization (i18n) and localization (l10n) library
     # https://www.gnu.org/software/gettext/
     'gettext',
     # Access GitHub's .gitignore boilerplates
     # https://github.com/simonwhitaker/gibo
     'gibo',
     # Remote repository management made easy
     # https://github.com/motemen/ghq
     'ghq',
     # Command-line utility for uploading Gists
     # https://github.com/defunkt/gist
     'gist',
     # Git extension for versioning large files
     # https://github.com/github/git-lfs
     'git-lfs',
     # Source code tag system
     # https://www.gnu.org/software/global/
     'global',
     # GNU version of the tar archiving utility
     # https://www.gnu.org/software/tar/
     'gnu-tar',
     # Multi-threaded malloc() and performance analysis tools
     # https://code.google.com/p/gperftools/
     'gperftools',
     # git-secrets
     # https://github.com/awslabs/git-secrets
     'git-secrets',
     # The grep
     # https://www.gnu.org/software/grep/
     'grep',
     # GNU Privacy Guard: a free PGP replacement
     # https://www.gnupg.org/
     'gpg2',
     # HTTP/2 C Library h2load
     # https://nghttp2.org/
     'nghttp2',
     # Improved top (interactive process viewer) for OS X
     # https://github.com/max-horvath/htop-osx
     'htop-osx',
     # Tool to measure maximum TCP and UDP bandwidth
     # http://iperf.sourceforge.net/
     'iperf',
     # Utility for IPMI control with kernel driver or LAN interface
     # http://ipmitool.sourceforge.net/
     'ipmitool',
     # Like awk, but for JSON, using JavaScript objects and arrays
     # https://github.com/micha/jsawk
     'jsawk',
     # Lightweight and flexible command-line JSON processor
     # https://stedolan.github.io/jq/
     'jq',
     # User-friendly front-end to ssh-agent(1)
     # http://www.funtoo.org/Keychain
     'keychain',
     # Powerful multi-lingual file viewer/grep
     # http://www.ff.iij4u.or.jp/~nrt/lv/
     'lv',
     # Text-to-HTML conversion tool
     # https://daringfireball.net/projects/markdown/
     'markdown',
     # mercurial
     # http://mercurial.selenic.com/
     'mercurial',
     # Remote terminal application
     # https://mosh.mit.edu/
     'mobile-shell',
     # Network Kanji code conversion Filter (NKF)
     # https://osdn.jp/projects/nkf/
     'nkf',
     # Port scanning utility for large networks
     # https://nmap.org/
     'nmap',
     # GNU parallel shell command
     # https://savannah.gnu.org/projects/parallel/
     'parallel',
     # Efficient rsh-like utility, for using hosts in parallel
     # https://code.google.com/p/pdsh/
     'pdsh',
     # Display the PID number for a given process name
     # http://www.nightproductions.net/cli.htm
     'pidof',
     # Password manager
     # http://www.passwordstore.org/
     'pass',
     # Simplistic interactive filtering tool
     # https://github.com/peco/peco
     'peco',
     # Show ps output as a tree
     # http://www.thp.uni-duisburg.de/pstree/
     'pstree',
     # x86 and PowerPC Emulator
     # http://wiki.qemu.org
     'qemu',
     # Library for command-line editing
     # https://tiswww.case.edu/php/chet/readline/rltop.html
     'readline',
     # Reattach process (e.g., tmux) to background
     # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
     'reattach-to-user-namespace',
     # Perl-powered file rename script with many helpful built-ins
     # http://plasmasturm.org/code/rename
     'rename',
     # Readline wrapper: adds readline support to tools that lack it
     # http://utopia.knoware.nl/~hlub/rlwrap/
     'rlwrap',
     # TCP flow recorder
     # https://github.com/simsong/tcpflow
     'tcpflow',
     # Code-search similar to ack
     # https://github.com/ggreer/the_silver_searcher
     'the_silver_searcher',
     # Text interface for Git repositories
     # http://jonas.nitro.dk/tig/
     'tig',
     # Terminal multiplexer
     # https://tmux.github.io/
     'tmux',
     # TMUX with a "ClusterSSH"-like behavior
     # https://github.com/dennishafemann/tmux-cssh
     'tmux-cssh',
     # Display directories as trees (with optional color/HTML output)
     # http://mama.indstate.edu/users/ice/tree/
     'tree',
     # Executes a program periodically, showing output fullscreen
     # http://sourceforge.net/projects/procps-ng/
     'watch',
     # HTTP benchmarking tool
     # https://github.com/wg/wrk
     'wrk',
     # General-purpose data compression with high compression ratio
     # http://tukaani.org/xz/
     'xz',
     # Tracks most-used directories to make cd smarter
     # https://github.com/rupa/z
     'z',
     # UNIX shell (command interpreter)
     # http://www.zsh.org/
     'zsh',
     # Additional completion definitions for zsh
     # https://github.com/zsh-users/zsh-completions
     'zsh-completions',
    ]:
    ensure => latest,
  }

  # Homebrew-dupes packages
  homebrew::tap { 'homebrew/dupes': }
  package {
    [
     # Utility that provides fast incremental file transfer
     # https://rsync.samba.org/
     'rsync',
     # OpenBSD freely-licensed SSH connectivity tools
     # http://www.openssh.com/
     'openssh',
     # GNU screen
     # https://www.gnu.org/software/screen
     'screen',
     ]:
       require => Homebrew::Tap['homebrew/dupes'],
  }

  # Homebrew/completions
  homebrew::tap { 'homebrew/completions': }
  package {
    [
     # Bash & Fish completion for brew-cask
     # https://github.com/xyb/homebrew-cask-completion
     'homebrew/completions/brew-cask-completion',
     ]:
       require => Homebrew::Tap['homebrew/completions'],
  }

  exec { 'unload built-in ssh-agent':
    command => 'launchctl unload -w /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist',
    unless  => 'test `launchctl list | grep org.openbsd.ssh-agent | cut -f 1` = "-"',
    require => Package['openssh'],
  }

  # Homebrew-cask packages
  include brewcask

  package {
    [
     # AppCleaner
     # http://www.freemacsoft.net/appcleaner/
     'appcleaner',
     # Alfred
     # http://www.alfredapp.com/
     'alfred',
     # Archiver
     # http://archiverapp.com/
     'archiver',
     # Atom
     # https://atom.io/
     'atom',
     # Bartender
     # http://www.macbartender.com/
     'bartender',
     # BathyScaphe
     # http://bathyscaphe.bitbucket.org/
     'bathyscaphe',
     # BetterTouchTool
     # http://boastr.net/
     'bettertouchtool',
     # BitTorrent Sync
     # https://www.getsync.com/
     'bittorrent-sync',
     # Box Sync
     # https://sites.box.com/sync4/
     # sync4 is not working 10.11, so download from https://app.box.com/settings/sync
     #'box-sync',
     # CheatSheet
     # http://www.cheatsheetapp.com/CheatSheet/
     'cheatsheet',
     # CloudApp
     # https://getcloudapp.com/
     'cloud',
     # Dropbox
     # https://www.dropbox.com/
     'dropbox',
     # Adobe Flash Player
     # https://www.adobe.com/products/flashplayer/distribution3.html
     'flash',
     # Flickr Uploadr
     # https://www.flickr.com/tools/
     'flickr-uploadr',
     # Firefox, Mozilla Firefox
     # https://www.mozilla.org/en-US/firefox/
     'firefox',
     # firefoxdeveloperedition
     # https://www.mozilla.org/en-US/firefox/developer/
     'firefoxdeveloperedition',
     # Fluid
     # http://fluidapp.com/
     'fluid',
     # f.lux
     # https://justgetflux.com/
     'flux',
     # GitHub Desktop
     # https://desktop.github.com/
     'github-desktop',
     # Genymotion
     # https://www.genymotion.com/
     'genymotion',
     # Google Chrome
     # https://www.google.com/chrome/
     'google-chrome',
     # google-chrome-canary
     # https://www.google.com/chrome/browser/canary.html?platform=mac
     'google-chrome-canary',
     # Google Drive
     # https://drive.google.com/
     'google-drive',
     # Google Earth
     # https://www.google.com/earth/
     'google-earth',
     # GrowlNotify
     # http://growl.info/downloads
     'growlnotify',
     # Keyboard Cleaner
     # http://jan.prima.de/~jan/plok/archives/48-Keyboard-Cleaner.html
     'keyboard-cleaner',
     # kindle-jp
     # http://www.amazon.co.jp/gp/feature.html/?ie=UTF8&docId=3077089416
     'kindle-jp',
     # HandBrake
     # https://handbrake.fr
     'handbrake',
     # HipChat
     # https://www.hipchat.com/
     'hipchat',
     # HyperDock
     # http://hyperdock.bahoom.com/
     'hyperdock',
     # HyperSwitch
     # http://bahoom.com/hyperswitch
     'hyperswitch',
     # iExplorer
     # https://www.macroplant.com/iexplorer/
     'iexplorer',
     # iStats Menus
     # http://bjango.com/mac/istatmenus/
     'istat-menus',
     # iTerm2
     # https://www.iterm2.com/
     'iterm2',
     # Jumpcut
     # http://jumpcut.sourceforge.net/
     'jumpcut',
     # LICEcap
     # http://www.cockos.com/licecap/
     'licecap',
     # LibreOffice
     # https://www.libreoffice.org/
     'libreoffice',
     # MacZip4Win
     # http://ynomura.com/home/?page_id=116
     'maczip4win',
     # MindNode Pro
     # https://mindnode.com/
     'mindnode-pro',
     # Mi
     # http://www.mimikaki.net/en/index.html
     'mi',
     # UNetbootin
     # http://unetbootin.github.io/
     'unetbootin',
     # UnRarX
     # http://www.unrarx.com
     'unrarx',
     # Opera
     # http://www.opera.com/
     'opera',
     # Paparazzi!
     # https://derailer.org/paparazzi/
     'paparazzi',
     # Safari Technology Preview
     # https://developer.apple.com/safari/technology-preview/
     'safari-technology-preview',
     # Skype
     # http://www.skype.com
     'skype',
     # Silverlight
     # https://www.microsoft.com/silverlight/
     'silverlight',
     # Slack
     # https://slack.com/
     'slack',
     # SourceTree
     # https://www.sourcetreeapp.com/
     'sourcetree',
     # Spectacle
     # http://spectacleapp.com/
     'spectacle',
     # Spotify
     # https://www.spotify.com
     'spotify',
     # Sublime Text
     # https://www.sublimetext.com/2
     'sublime-text',
     # Simple Comic
     # https://github.com/techstoreclub/Simple-Comic
     'techstoreclub-simple-comic',
     # Transmission
     # http://www.transmissionbt.com/
     'transmission',
     # TFTP Server
     # http://ww2.unime.it/flr/tftpserver/
     'tftpserver',
     # TotalFinder
     # http://totalfinder.binaryage.com
     # 10.11 SIP http://totalfinder.binaryage.com/system-integrity-protection
     'totalfinder',
     # TotalSpaces
     # http://totalspaces.binaryage.com/
     # 10.11 SIP http://totalspaces.binaryage.com/elcapitan
     'totalspaces',
     # VirtualBox
     # https://www.virtualbox.org
     'virtualbox',
     # VMware Fusion
     # https://www.vmware.com/products/fusion/
     'vmware-fusion',
     # VLC, VLC media player
     # https://www.videolan.org/vlc/
     'vlc',
     # Wireshark
     # https://www.wireshark.org/
     'wireshark',
     # Wondershare Player
     # http://www.wondershare.com/video-player/
     'wondershare-player',
     ]:
       provider => 'brewcask',
       require  => [ Homebrew::Tap['caskroom/cask'], Sudoers['installer'] ],
  }

  # move to /Applications
  move_to_applications {
    'archiver':
      app_name => 'Archiver';
    'bartender':
      app_name => 'Bartender 2';
    'bettertouchtool':
      app_name => 'BetterTouchTool';
    'firefoxdeveloperedition':
      app_name => 'FirefoxDeveloperEdition';
    'flux':
      app_name => 'Flux';
    'google-chrome':
      app_name => 'Google Chrome';
    'google-chrome-canary':
      app_name => 'Google Chrome Canary';
    'totalspaces':
      app_name => 'TotalSpaces2';
  }

  if versioncmp($::macosx_productversion_major, '10.10') < 0 {
    package {
      [
        # Arranger
        # http://bucketomac.de/arranger/arranger/
        'arranger',
        # MenuMeters
        # http://www.ragingmenace.com/software/menumeters/
        'menumeters',
       ]:
       provider => 'brewcask',
       require  => [ Homebrew::Tap['caskroom/cask'], Sudoers['installer'] ],
    }
  } else {
    package {
      [
        # Flashlight
        # http://flashlight.nateparrott.com/
        'flashlight',
        # MenuMeters, MenuMeters El Capitan Port
        # http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/
        'yujitach-menumeters',
      ]:
       provider => 'brewcask',
       require  => [ Homebrew::Tap['caskroom/cask'], Sudoers['installer'] ],
    }
  }

  file { '/Applications/VMware Fusion.app':
    ensure  => 'link',
    target  => "/Users/${::boxen_user}/Applications/VMware Fusion.app",
    require => Package['vmware-fusion'],
  }

  package { 'utorrent':
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
    notify   => Exec['applications-utorrent-installer'],
  }

  exec { 'applications-utorrent-installer':
    command     => "open ${brewcask::config::cask_room}/utorrent/latest/uTorrent.app",
    user        => $::boxen_user,
    refreshonly => true,
  }

  osx_login_item { 'uTorrent':
    ensure  => 'absent',
  }

  # Homebrew-cask versions
  homebrew::tap { 'caskroom/versions': }
  package {
    [
      # quicktime-player7
      # http://support.apple.com/kb/dl923
      'quicktime-player7',
     ]:
       provider => 'brewcask',
       require  => [
                    Homebrew::Tap['caskroom/cask'],
                    Homebrew::Tap['caskroom/versions'],
                    ],
  }

  # Homebrew-cask sonots packages
  homebrew::tap { 'sonots/mycask': }
  package {
    [
      # Gyazo, Gyazo GIF
      # https://gyazo.com/
      'gyazo',
     ]:
       provider => 'brewcask',
       require  => [
                    Homebrew::Tap['caskroom/cask'],
                    Homebrew::Tap['sonots/mycask'],
                    ],
  }

  # Homebrew-cask n0ts packages
  homebrew::tap { 'n0ts/mycask': }
  package {
    [
      # uqwifi-connect
      # http://wi2.co.jp/jp/uq/connect/
      'uqwifi-connect',
     ]:
       provider => 'brewcask',
       require  => [
                    Homebrew::Tap['caskroom/cask'],
                    Homebrew::Tap['n0ts/mycask'],
                    ],
  }

  if $sp_cpu_type != '' {
    # Intel Power Gadget
    # https://software.intel.com/en-us/articles/intel-power-gadget-20
    package { 'intel-power-gadget':
       provider => 'brewcask',
       require  => [
                    Homebrew::Tap['caskroom/cask'],
                    Homebrew::Tap['n0ts/mycask'],
                    ],
    }
  }

  # Homebrew n0ts
  homebrew::tap { 'n0ts/myformula': }
  package {
    [
      'my-emacs',
    ]:
      require => Homebrew::Tap['n0ts/myformula'],;
  }
}
