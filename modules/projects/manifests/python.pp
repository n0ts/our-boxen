class projects::python {
  notify { 'class project::python declared': }

  $version_latest = '3.6.0'
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

  python::version { $version_lambda: }

  install_package {
    [
      'supervisor',
    ]: ;
  }
}
