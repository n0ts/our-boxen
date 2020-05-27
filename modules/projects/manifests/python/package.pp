# Public python:package
define projects::python::package(
  $version = '>= 0',
  $prefix  = $projects::python::prefix,
  $python  = undef,
  $url     = undef,
) {
  pyenv_package { $name:
    ensure        => 'present',
    package       => $name,
    version       => $version,
    url           => $url,
    pyenv_version => $python,
    pyenv_root    => $prefix,
    provider      => pip,
  }
}
