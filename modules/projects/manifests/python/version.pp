# Public python:version
define projects::python::version(
  $version,
  $prefix,
) {
  require openssl

  include homebrew::config
  include boxen::config

  $_cflgas = [
              "-I${::homebrew::config::installdir}/include",
              "-I${::homebrew::config::installdir}/opt/openssl/include",
              "-I/opt/X11/include",
              "-march=core2",
              "-O3",
              ]
  $_ldflags = [
               "-I${::homebrew::config::installdir}/include",
               "-I${::homebrew::config::installdir}/opt/openssl/include",
               "-I/opt/X11/include",
               "-march=core2",
               "-O3",
               ]
  $_env = {
    'CC'      => '/usr/bin/cc',
    'CFLAGS'  => join($_cflgas, ' '),
    'LDFLAGS' => join($_ldflags, ' '),
    'PYENV_ROOT' => $prefix,
    'PYTHON_BUILD_CACHE_PATH' => "${::boxen_home}/cache/pyenv",
  }

  ensure_resource('package', 'readline')

  exec { "python-install-${version}":
    command  => "pyenv install --skip-existing ${version}",
    cwd      => $prefix,
    provider => 'shell',
    timeout  => 0,
    creates  => "${prefix}/versions/${version}",
    user     => $::boxen_user,
    require  => [ File["${::boxen_home}/cache/pyenv"],
                  Package['readline'], Package['openssl'] ],
    notify   => Exec["python-upgrade-pip-${version}"],
  }

  exec { "python-upgrade-pip-${version}":
    command     => 'pip install --upgrade pip',
    user        => $::boxen_user,
    path        => [
                    "${prefix}/versions/${version}/bin",
                    ],
    refreshonly => true,
  }

  Exec["python-install-${version}"] {
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
