# Public: node
class projects::node {
  notify { 'class projects::node declared': }

  # https://nodejs.org/en/
  # https://github.com/nodejs/Release#release-schedule
  $version_latest = '9.5.0'
  $version_lts = '8.9.4'
  $version_lambda = '6.10.3'
  $prefix = "${::homebrew_root}/opt/anyenv/envs/ndenv"

  class { 'projects::node::global':
    versions => [ $version_latest, $version_lts, $version_lambda ],
    prefix   => $prefix,
  }

  file { "${::boxen_home}/cache/ndenv":
    ensure => directory,
  }

  ensure_resource('projects::node::version', $version_lts,
                  { 'version' => $version_lts, 'prefix' => $prefix })

  ensure_resource('projects::node::version', $version_lambda,
                  { 'version' => $version_lambda, 'prefix' => $prefix })
}
