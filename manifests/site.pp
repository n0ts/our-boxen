require boxen::environment
require homebrew

Exec {
  group     => 'staff',
  logoutput => on_failure,
  user      => $boxen_user,

  path => [
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include wget

    include java

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  ##nodejs::version { '12.17.0': }
  ##nodejs::version { '14.3.0': }

  # default ruby versions
  ##ruby::version { '2.7.1': }

  # common, useful packages
  ##package {
  ##  [
  ##    'ack',
  ##    'findutils',
  ##    'gnu-tar'
  ##  ]:
  ##}

  file { "${boxen::config::srcdir}/.our-boxen":
    ensure => link,
    target => "${boxen::config::repodir}/our-boxen",
  }
}

