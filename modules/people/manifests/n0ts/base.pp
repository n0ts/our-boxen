class people::n0ts::base {
  notify { 'class people::n0ts::base declared': }

  $locate_cmds = [
                  'launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist',
                  '/usr/libexec/locate.updatedb',
                  ]
  exec { 'Locate Database':
    command => join($locate_cmds, "\n"),
    user    => 'root',
    unless  => 'test -f /var/db/locate.database',
  }


  file { "${boxen::config::home}/bin/brew-update.sh":
    content => '#!/bin/bash
BREW=brew
($BREW update) && ($BREW upgrade brew-cask) && ($BREW cleanup) && ($BREW cask cleanup)
',
    mode    => 0755,
  }

  file { '/Users/Shared/w':
    ensure => directory,
  }

  file { '/Users/Shared/w/sync':
    ensure  => directory,
    require => File['/Users/Shared/w'],
  }

  file { '/w':
    ensure  => link,
    owner   => 'root',
    target  => '/Users/Shared/w',
    require => File['/Users/Shared/w'],
  }

  file { '/prj':
    ensure  => link,
    owner   => 'root',
    target  => '/Users/Shared/prj',
    require => File['/Users/Shared/prj'],
  }

  file { "/Users/${::boxen_user}/w":
    ensure  => link,
    target  => '/Users/Shared/w',
    require => File['/Users/Shared/w'],
  }

  file { '/Users/Shared/prj':
    ensure => directory,
  }

  file { "/Users/${::boxen_user}/prj":
    ensure  => link,
    target  => '/Users/Shared/prj',
    require => File['/Users/Shared/prj'],
  }

  repository { "/Users/${::boxen_user}/.env":
    source   => 'n0ts/dotfiles',
    provider => 'git',
    notify   => Exec['n0ts-dotfiles-install'],
  }

  exec { 'n0ts-dotfiles-install':
    command     => 'make',
    cwd         => "/Users/${::boxen_user}/.env",
    refreshonly => true,
  }
}
