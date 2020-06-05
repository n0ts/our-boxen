# Public: applications
class people::n0ts::applications {
  notify { 'class people::n0ts::applications declared': }

  # java
  class { 'java':
    major_version => '14.0.1',
    minor_version => '7',
    hash_version  => '664493ef4a6946b186ff29eb326336a2'
  }

  # Homebrew packages
  package {
    [
     # Search tool like grep, but optimized for programmers
     # http://beyondgrep.com/
     'ack',
     # All in one for **env
     # https://anyenv.github.io/
     'anyenv',
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
     # FSF Binutils for native development
     # https://www.gnu.org/software/binutils/binutils.html
     'binutils',
     # Bash & Fish completion for brew-cask
     # https://github.com/xyb/homebrew-cask-completion
     'brew-cask-completion',
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
     # File comparison utilities
     # https://www.gnu.org/s/diffutils/
     'diffutils',
     # Load/unload environment variables based on $PWD
     # https://direnv.net/
     'direnv',
     # Secure your credentials in environment variables
     # https://github.com/sorah/envchain
     'envchain',
     # Infamous electronic fortune-cookie generator
     # http://ftp.ibiblio.org/pub/linux/games/amusements/fortune/!INDEX.html
     'fortune',
     # Fuzzy finder for your shell
     # https://github.com/junegunn/fzf
     'fzf',
     # Alternative to top/htop
     # https://nicolargo.github.io/glances/
     'glances',
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
     # git-secrets
     # https://github.com/awslabs/git-secrets
     'git-secrets',
     # Source code tag system
     # https://www.gnu.org/software/global/
     'global',
     # GNU Transport Layer Security (TLS) Library
     # https://gnutls.org/
     'gnutls',
     # GNU Privacy Guard: a free PGP replacement
     # https://www.gnupg.org/
     'gnupg',
     # Popular GNU data compression program
     # https://www.gnu.org/software/gzip
     'gzip',
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
     # Mac App Store command-line interface
     # https://github.com/argon/mas
     'mas',
     # Text-to-HTML conversion tool
     # https://daringfireball.net/projects/markdown/
     'markdown',
     # mercurial
     # http://mercurial.selenic.com/
     'mercurial',
     # Remote terminal application
     # https://mosh.mit.edu/
     'mosh',
     # Network Kanji code conversion Filter (NKF)
     # https://osdn.jp/projects/nkf/
     'nkf',
     # Port scanning utility for large networks
     # https://nmap.org/
     'nmap',
     # OpenBSD freely-licensed SSH connectivity tools
     # http://www.openssh.com/
     'openssh',
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
     # Utility that provides fast incremental file transfer
     # https://rsync.samba.org/
     'rsync',
     # GNU screen
     # https://www.gnu.org/software/screen
     'screen',
     # Source-code syntax highlighter
     # https://www.gnu.org/software/src-highlite/
     'source-highlight',
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
     # Zstandard is a real-time compression algorithm
     # http://zstd.net/
     'zstd',
     # UNIX shell (command interpreter)
     # http://www.zsh.org/
     'zsh',
     # Additional completion definitions for zsh
     # https://github.com/zsh-users/zsh-completions
     'zsh-completions',
     # Display word differences between text files
     # https://www.gnu.org/software/wdiff/
     'wdiff',
     # Wireshark
     # https://www.wireshark.org/
     'wireshark',
    ]:
       ensure  => latest,
  }
  package {
    [
     # Classic UNIX line editor
     # https://www.gnu.org/software/ed/ed.html
     'ed', 
     # Collection of GNU find, xargs, and locate
     # https://www.gnu.org/software/findutils/
     'findutils',
     # C code prettifier
     # https://www.gnu.org/software/indent/
     'gnu-indent',
     # GNU implementation of the famous stream editor
     # https://www.gnu.org/software/sed/
     'gnu-sed',
     # GNU version of the tar archiving utility
     # https://www.gnu.org/software/tar/
     'gnu-tar',
     # GNU implementation of which utility
     # https://savannah.gnu.org/projects/which/
     'gnu-which',
     # The grep
     # https://www.gnu.org/software/grep/
     'grep',
    ]:
       ensure => latest,
  }

  exec { 'unload built-in ssh-agent':
    command => 'launchctl unload -w /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist',
    unless  => 'test `launchctl list | grep org.openbsd.ssh-agent | cut -f 1` = "-"',
    require => Package['openssh'],
  }

  # Homebrew/simeji/jid
  homebrew::tap { 'simeji/jid': }

  package {
    [
     # jid
     # https://github.com/simeji/jid
     'jid'
    ]:
       require => Homebrew::Tap['simeji/jid'],
  }

  # Homebrew/services
  homebrew::tap { 'homebrew/services': }

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
     # Brave
     # https://brave.com/
     'brave-browser',
     # Box Sync
     # https://sites.box.com/sync4/
     'box-sync',
     # Blisk
     # https://blisk.io
     'blisk',
     # Caffeine
     # http://lightheadsw.com/caffeine/
     'caffeine',
     # Choosy
     # https://www.choosyosx.com/
     'choosy',
     # Dash
     # https://kapeli.com/dash
     'dash',
     # Discord
     # https://discordapp.com/
     'discord',
     # Dropbox
     # https://www.dropbox.com/
     'dropbox',
     # Flickr Uploadr
     # https://www.flickr.com/tools/
     'flickr-uploadr',
     # Mozilla Firefox
     # https://www.mozilla.org/en-US/firefox/
     'firefox',
     # f.lux
     # https://justgetflux.com/
     'flux',
     # Gyazo, Gyazo GIF
     # https://gyazo.com/
     'gyazo',
     # GitHub
     # https://desktop.github.com/
     'github',
     # Google Backup and Sync
     # https://www.google.com/drive/download/
     'google-backup-and-sync',
     # Google Chrome
     # https://www.google.com/chrome/
     'google-chrome',
     # Google Earth
     # https://www.google.com/earth/
     'google-earth-web-plugin',
     # Google Hangouts
     # https://www.google.com/tools/dlpage/hangoutplugin
     'google-hangouts',
     # Google Web Designer
     # https://www.google.com/webdesigner/
     'google-web-designer',
     # GrowlNotify
     # http://growl.info/downloads
     'growlnotify',
     # Keyboard Cleaner
     # http://jan.prima.de/~jan/plok/archives/48-Keyboard-Cleaner.html
     'keyboard-cleaner',
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
     # jasper
     # https://jasperapp.io/
     'jasper',
     # Jumpcut
     # http://jumpcut.sourceforge.net/
     #'jumpcut',
     # LICEcap
     # http://www.cockos.com/licecap/
     'licecap',
     # LibreOffice
     # https://www.libreoffice.org/
     'libreoffice',
     # MacZip4Win
     # http://ynomura.com/home/?page_id=116
     'maczip4win',
     # Mac DVDRipper Pro
     # https://www.macdvdripperpro.com/
     'mdrp',
     # Mi
     # http://www.mimikaki.net/en/index.html
     'mi',
     # MultiFirefox
     # http://davemartorana.com/multifirefox/
     'multifirefox',
     # Opera
     # http://www.opera.com/
     'opera',
     # Paparazzi!
     # https://derailer.org/paparazzi/
     'paparazzi',
     # Powershell
     # https://msdn.microsoft.com/en-us/powershell/mt173057.aspx
     'powershell',
     # Resilio-sync
     # https://www.getsync.com/
     'resilio-sync',
     # Servo
     # https://servo.org
     'servo',
     # Simple Comic
     # https://dancingtortoise.github.io
     'simple-comic',
     # Skype
     # http://www.skype.com
     'skype',
     # Sketch
     # http://www.sketchapp.com/
     'sketch',
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
     # Subversion
     # Version control system designed to be a better CVS
     'subversion',
     # Transmission
     # https://www.transmissionbt.com/
     'transmission',
     # UNetbootin
     # http://unetbootin.github.io/
     'unetbootin',
     # Vivaldi
     # https://vivaldi.com/
     'vivaldi',
     # Microsoft Visual Studio Code
     # https://code.visualstudio.com/
     'visual-studio-code',
     # VLC, VLC media player
     # https://www.videolan.org/vlc/
     'vlc',
     # VMware Fusion
     # https://www.vmware.com/products/fusion/
     ##'vmware-fusion',
     # Wondershare Player
     # http://www.wondershare.com/video-player/
     'wondershare-player',
     # Zoom.us
     # https://zoom.us
     'zoomus',
     # whatsapp
     # https://www.whatsapp.com/
     'whatsapp',
     # xquartz
     # https://www.xquartz.org
     'xquartz',
    ]:
       provider => 'brewcask',
       require  => Sudoers['installer'],
  }

  # Cannot install virtualbox on 10.13...
  # https://github.com/caskroom/homebrew-cask/issues/39369
  if versioncmp($::macosx_productversion_major, '10.12') <= 0 {
     package {
       # Genymotion (requier virtualbox)
       # https://www.genymotion.com/
       'genymotion': ;
       # Virtualbox & Extension Pack
       # https://www.virtualbox.org/
       'virtualbox': ;
       'virtualbox-extension-pack':
         provider => 'brewcask',
         require  => [ Package['virtualbox'], Sudoers['vboxmanage'] ];
     }
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
       require  => Sudoers['installer'],
    }
  } else {
    package {
      [
       # Flashlight
       # http://flashlighttool.42pag.es/
       'flashlighttool',
      ]:
       provider => 'brewcask',
       require  => Sudoers['installer'],
    }
  }

  # Homebrew-cask versions
  homebrew::tap { 'homebrew/cask-versions': }
  package {
    [
     # firefoxdeveloperedition
     # https://www.mozilla.org/en-US/firefox/developer/
     'firefox-developer-edition',
     # google-chrome-canary
     # https://www.google.com/chrome/browser/canary.html?platform=mac
     'google-chrome-canary',
     # Safari Technology Preview
     # https://developer.apple.com/safari/technology-preview/
     'safari-technology-preview',
    ]:
       provider => 'brewcask',
       require  => Homebrew::Tap['homebrew/cask-versions'],
  }

  # Homebrew-cask n0ts packages
  homebrew::tap { 'n0ts/mycask': }
  package {
    [
     # kindle-jp
     # http://www.amazon.co.jp/gp/feature.html/?ie=UTF8&docId=3077089416
     'kindle-jp',
     # TotalFinder
     # http://totalfinder.binaryage.com
     # 10.11 SIP http://totalfinder.binaryage.com/system-integrity-protection
     'totalfinder',
     # TotalSpaces
     # http://totalspaces.binaryage.com/
     # 10.11 SIP http://totalspaces.binaryage.com/elcapitan
     'totalspaces',
     # uqwifi-connect
     # http://wi2.co.jp/jp/uq/connect/
     'uqwifi-connect',
     # UnRarX
     # http://www.unrarx.com
     'unrarx',
    ]:
       provider => 'brewcask',
       require  => Homebrew::Tap['n0ts/mycask'],
  }

  if $sp_cpu_type != '' {
    # Intel Power Gadget
    # https://software.intel.com/en-us/articles/intel-power-gadget-20
    package { 'intel-power-gadget':
       provider => 'brewcask',
       require  => Homebrew::Tap['n0ts/mycask'],
    }
  }

  # Homebrew n0ts
  homebrew::tap { 'n0ts/myformula': }
  # package {
  #   [
  #     'my-emacs',
  #   ]:
  #      require => Homebrew::Tap['n0ts/myformula'],;
  # }

  class { 'people::n0ts::applications::anyenv':
    envs => [ 'goenv', 'nodenv', 'phpenv', 'pyenv', 'plenv', 'rbenv' ],
  }

  boxen::env_script { 'anyenv':
    content  => template('people/anyenv.sh.erb'),
    priority => 'higher',
  }
}
