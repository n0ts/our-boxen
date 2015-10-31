class projects::docker {
  notify { 'class project::docker declared': }

  package { 'docker': }

  include brewcask
  package {
    [
      'dockertoolbox',
      'kitematic',
      'virtualbox',
    ]:
    provider => 'brewcask',
    require  => [ Homebrew::Tap['caskroom/cask'], Sudoers['dockertoolbox'] ],
  }


  # Require for dockertoolbox
  sudoers { 'dockertoolbox':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      # /usr/bin/sudo -E -- /usr/sbin/chown -R -- $USER:staff /Users/n0ts/.docker
      '(ALL) SETENV:NOPASSWD: /usr/bin/chown',
    ],
    type     => 'user_spec',
  }
}
