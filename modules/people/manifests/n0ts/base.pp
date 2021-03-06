# Public: base
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
    timeout => 600,
  }

  exec { 'Visible /opt':
    command => 'SetFile -a v /opt',
    user    => 'root',
  }

  include homebrew
  include brewcask

  file { "${boxen::config::home}/bin/brew-update":
    content => template('people/brew-update.erb'),
    mode    => '0755',
  }

  file { "${boxen::config::home}/bin/merge-dup-open-with":
    content => template('people/merge-dup-open-with'),
    mode    => '0755',
  }

  $root_dir = '/Users/Shared'

  file { "${root_dir}/w":
    ensure => directory,
  }

  file {
    [
     "${root_dir}/w/etc",
     "${root_dir}/w/var",
     "${root_dir}/w/var/log",
     "${root_dir}/w/var/run",
     "${root_dir}/w/sync",
     ]:
       ensure => directory,
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
