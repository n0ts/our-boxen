class people::n0ts::sudo {
  notify { 'class people::n0ts::sudo declared': }

  # Require for brewcask
  sudoers { 'installer':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      # /usr/bin/sqlite3 required for alfred
      '(ALL) SETENV:NOPASSWD: /usr/sbin/installer, /usr/bin/sqlite3',
    ],
    type     => 'user_spec',
  }
}
