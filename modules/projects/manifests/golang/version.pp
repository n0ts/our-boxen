# Public golang:version
define projects::golang::version(
  $version,
  $prefix,
) {
  include homebrew::config
  include boxen::config

  $_env = {
    'GOENV_ROOT' => $prefix,
    'GO_BUILD_CACHE_PATH' => "${::boxen_home}/cache/goenv",
  }

  exec { "golang-install-${version}":
    command  => "goenv install --skip-existing ${version}",
    cwd      => $prefix,
    provider => 'shell',
    timeout  => 0,
    creates  => "${prefix}/versions/${version}",
    user     => $::boxen_user,
    require  => File["${::boxen_home}/cache/goenv"],
  }

  Exec["golang-install-${version}"] {
    path +> [
             "${prefix}/shims",
             "${prefix}/bin",
             "${boxen::config::homebrewdir}/bin",
             '/usr/bin',
             '/bin',
             '/usr/sbin',
             '/sbin',
             ],
    environment +> sort(join_keys_to_values($_env, '='))
  }
}
