# Public: ruby::package
define projects::ruby::package(
  $version = $projects::ruby::version_latest,
  $prefix  = $projects::ruby::prefix,
) {
  ruby_gem { "${name} for ${version}":
    gem          => $name,
    ruby_version => $version,
    rbenv_root   => $prefix,
  }
}

