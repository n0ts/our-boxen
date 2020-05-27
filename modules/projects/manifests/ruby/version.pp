# Public ruby:version
define projects::ruby::version(
  $version,
  $prefix,
  $ensure = 'installed',
) {
  include homebrew::config
  include boxen::config

  $_cflags = [
              "-I${::homebrew::config::installdir}/include",
              '-march=core2',
              '-O3',
              ]
  $_ldflags = [
               "-L${::homebrew::config::installdir}/lib",
               ]
  $_configure = [
                 '--without-gmp',
                 "--with-readline-dir=%{::homebrew::config::installdir}/opt/readline",
                 ]
  $_env = {
    'CC'      => '/usr/bin/cc',
    'CFLAGS'  => join($_cflags, ' '),
    'LDFLAGS' => join($_ldflags, ' '),
    'RBENV_ROOT' => $prefix,
    'RUBY_BUILD_CACHE_PATH' => "${::boxen_home}/cache/rbenv",
    'RUBY_CONFIGURE_OPTS'   => join($_configure, ' '),
  }

  ensure_resource('package', 'readline')

  exec { "ruby-install-${version}":
    command  => "ruby-build --skip-existing ${version} ${prefix}/versions/${version}",
    cwd      => $prefix,
    provider => 'shell',
    timeout  => 0,
    creates  => "${prefix}/versions/${version}",
    user     => $::boxen_user,
    require  => [ File["${::boxen_home}/cache/rbenv"],
                  Package['readline'] ],
    notify   => Exec["ruby-upgrade-gem-${version}"],
  }

  exec { "ruby-upgrade-gem-${version}":
    command     => 'gem update --system',
    provider    => 'shell',
    user        => $::boxen_user,
    path        => [
                    "${prefix}/versions/${version}/bin",
                    "${prefix}/shims",
                    "${prefix}/bin",
                    "${boxen::config::homebrewdir}/bin",
                    '/usr/bin',
                    '/bin',
                    '/usr/sbin',
                    '/sbin',
                    ],
    environment => [
                    'BUNDLE_GEMFILE=""',
                    'BUNDLE_BIN_PATH=""',
                    'GEM_HOME=""',
                    'GEM_PATH=""',
                    'RUBYOPT=""',
                    'RUBYLIB=""',
                    ],
    refreshonly => true,
  }

  Exec["ruby-install-${version}"] {
    path +> [
             "${prefix}/plugins/ruby-build/bin",
             "${boxen::config::homebrewdir}/bin",
             '/usr/bin',
             '/bin',
             '/usr/sbin',
             '/sbin',
             ],
    environment +> sort(join_keys_to_values($_env, '='))
  }
}
