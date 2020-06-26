# Public: sudo
class people::n0ts::sudo {
  notify { 'class people::n0ts::sudo declared': }

  # Required for brewcask
  sudoers { 'installer':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      '(ALL) NOPASSWD:SETENV : /usr/bin/env',
      '(ALL) NOPASSWD:SETENV : /usr/sbin/installer',
      # for Zoomus
      '(ALL) NOPASSWD:SETENV : /usr/bin/xargs',
      '(ALL) NOPASSWD:SETENV : /usr/sbin/chown',
    ],
    type     => 'user_spec',
  }

  # /usr/bin/sqlite3 required for alfred
  sudoers { 'sqlite3':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      '/usr/bin/sqlite3',
    ],
    type     => 'user_spec',
  }

  if versioncmp($::macosx_productversion_major, '10.12') <= 0 {
    # Required for virtualbox-extension-pack
    sudoers { 'vboxmanage':
      users    => $::boxen_user,
      hosts    => 'ALL',
      commands => [
        '(ALL) NOPASSWD : /usr/local/bin/VBoxManage',
      ],
      type     => 'user_spec',
    }
  }
}
