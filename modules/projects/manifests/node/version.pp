# Public node:version
define projects::node::version(
  $version,
  $prefix,
) {
  include homebrew::config
  include boxen::config

  $_env = {
    'NDENV_ROOT' => $prefix,
    'NODE_BUILD_CACHE_PATH' => "${::boxen_home}/cache/ndenv",
  }

  exec { "node-install-${version}":
    command  => "ndenv install --skip-existing ${version}",
    cwd      => $prefix,
    provider => 'shell',
    timeout  => 0,
    creates  => "${prefix}/versions/${version}",
    user     => $::boxen_user,
    require  => File["${::boxen_home}/cache/ndenv"],
    notify   => Exec["node-upgrade-npm-${version}"],
  }

  exec { "node-upgrade-npm-${version}":
    command     => 'npm update -g npm',
    user        => $::boxen_user,
    path        => [
                    "${prefix}/versions/${version}/bin",
                    ],
    refreshonly => true,
  }

  Exec["node-install-${version}"] {
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
