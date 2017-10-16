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

  exec { 'Visible /opt':
    command => 'SetFile -a v /opt',
    user    => 'root',
  }

  include homebrew
  include brewcask

  file { "${boxen::config::home}/bin/brew-update":
    content => "#!/bin/bash
brew update --force
brew upgrade
for c in \$(brew cask list); do
    info=\$(brew cask info \$c)
    installed_ver=\$(echo \"$info\" | cut -d\$'\\n' -f1 | tr -d ' ' | cut -d':' -f 2)
    current_ver=\$(echo \"$info\" | cut -d\$'\\n' -f3 | cut -d' ' -f 1 | rev | cut -d'/' -f 1 | rev)
    if [ \"\$installed_ver\" != \"\$current_ver\" ]; then
        brew cask reinstall \$c
    fi
done
brew cleanup
brew cask cleanup
",
    mode    => 0755,
  }

  file { "${boxen::config::home}/bin/merge-dup-open-with":
    content => "#!/bin/bash
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user
",
    mode    => 0755,
  }

  file { '/Users/Shared/w':
    ensure => directory,
  }

  file { '/w':
    ensure  => link,
    owner   => 'root',
    target  => '/Users/Shared/w',
    require => File['/Users/Shared/w'],
  }

  file {
    [
     '/w/etc',
     '/w/var',
     '/w/var/log',
     '/w/var/run',
     '/w/sync',
     ]:
       ensure => directory,
       require => File['/w'],
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

  file { "/Users/${::boxen_user}/prj":
    ensure  => link,
    target  => '/Users/Shared/prj',
    require => File['/Users/Shared/prj'],
  }

  file { '/Users/Shared/prj':
    ensure => directory,
  }

  file { '/Users/Shared/prj/github':
    ensure  => directory,
    require => File['/Users/Shared/prj'],
  }

  file { '/Users/Shared/prj/bitbucket':
    ensure  => directory,
    require => File['/Users/Shared/prj'],
  }

  file { "/Users/${::boxen_user}/Library/LaunchAgents":
    ensure => directory,
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
