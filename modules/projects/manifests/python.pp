class projects::python {
  notify { 'class project::python declared': }

  define install_package($url = undef) {
    python::package { "${name} for 2.7.10":
      package => $name,
      python  => '2.7.10',
      url     => $url,
    }
  }

  # Lambda use python 2.7.10
  class { 'python::global':
    version => '2.7.10',
  }

  install_package {
    [
      'supervisor',
      'virtualenv',
    ]: ;
  }
}
