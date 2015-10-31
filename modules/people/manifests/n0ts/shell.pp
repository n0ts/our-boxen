class people::n0ts::shell {
  notify { 'class people::n0ts::shell declared': }

  $shell = "${boxen::config::homebrewdir}/bin/zsh"

  exec { 'nt0s-shell-etc-shells':
    user    => 'root',
    command => "echo ${shell} >> /etc/shells",
    unless  => "grep ${shell} /etc/shells",
    require => Package['zsh'],
    notify  => Exec['n0ts-shell-chsh'],
  }

  exec { 'n0ts-shell-chsh':
    user       => 'root',
    command    => "chsh -s ${shell} ${::boxen_user}",
    refreshonly => true,
  }
}
