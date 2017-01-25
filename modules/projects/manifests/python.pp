class projects::python {
  notify { 'class project::python declared': }

  $version_latest = '3.6.0'

  define install_package($url = undef) {
    python::package { "${name} for 2.7.10":
      package => $name,
      python  => '2.7.10',
      url     => $url,
    }
  }

  # lambda use python 2.7.10
  class { 'python::global':
    version => '2.7.10',
  }

  # latest stable
  python::version { $version_latest: }

  install_package {
    [
      'supervisor',
    ]: ;
  }
}
