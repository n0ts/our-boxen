class projects::python {
  notify { 'class project::python declared': }

  $version_latest = '3.6.1'
  $version_stable = '2.7.13'
  $version_lambda = '2.7.12'

  define install_package($python_version = $projects::python::version_latest, $url = undef) {
    python::package { "${name} for ${python_version}":
      package => $name,
      python  => $python_version,
      url     => $url,
    }
  }

  class { 'python::global':
    version => $version_latest,
  }

  python::version { $version_stable: }
  python::version { $version_lambda: }

  file { "${boxen::config::home}/bin/pip-update":
    content => "#!/bin/bash
pip install -U pip
pip freeze --local | grep -v '^\\-e' | cut -d = -f 1 | xargs pip install -U
",
    mode    => 0755,
  }
}
