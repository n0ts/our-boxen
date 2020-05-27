# Public: golang
class projects::golang {
  notify { 'class projects::golang declared': }

  # https://golang.org/dl/
  $version_latest = '1.9.2'
  $prefix = "${::homebrew_root}/opt/anyenv/envs/goenv"

  class { 'projects::golang::global':
    versions => [ $version_latest ],
    prefix   => $prefix,
  }

  file { "${::boxen_home}/cache/goenv":
    ensure => directory,
  }
}
