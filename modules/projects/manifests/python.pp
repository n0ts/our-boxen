# Public: python
class projects::python {
  notify { 'class projects::python declared': }

  # https://www.python.org/downloads/
  $version_latest = '3.6.3'
  $version_stable = '2.7.14'
  $prefix = "${::homebrew_root}/opt/anyenv/envs/pyenv"

  file { "${::boxen_home}/cache/pyenv":
    ensure => directory,
  }

  class { 'projects::python::global':
    versions => [ $version_latest, $version_stable ],
    prefix   => $prefix,
  }

  ensure_resource('projects::python::version', $version_stable,
                  { 'version' => $version_stable, 'prefix' => $prefix })

  file { "/Users/${::boxen_user}/Library/Application Support/pip":
    ensure => directory,
  }

  file { "/Users/${::boxen_user}/Library/Application Support/pip/pip.conf":
    require => File["/Users/${::boxen_user}/Library/Application Support/pip"],
    content => "
[list]
format = columns
",
  }

  file { "${boxen::config::home}/bin/pip-update":
    content => template('projects/shared/pip-update.sh.erb'),
    mode    => '0755',
  }
}
