class projects::vpn {
  notify { 'class project::vpn declared': }

  file { '/etc/ppp/ip-up':
    content => template('projects/shared/ppp-ip-up.erb'),
    owner   => 'root',
    group   => 'wheel',
    mode    => 775,
    replace => false,
  }

  file { '/etc/ppp/ip-down':
    content => template('projects/shared/ppp-ip-down.erb'),
    owner   => 'root',
    group   => 'wheel',
    mode    => 775,
    replace => false,
  }
}
