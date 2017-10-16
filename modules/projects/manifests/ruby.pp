class projects::ruby {
  notify { 'class project::ruby declared': }

  $version_latest = '2.4.2'
  $version_boxen = '2.0.0-p648'

  define install_package($ruby_version = $projects::ruby::version_latest) {
    ruby_gem { "${name} for ${ruby_version}":
      gem          => $name,
      ruby_version => $ruby_version,
    }
  }

  # rbenv plugins
  file { "${::boxen_home}/rbenv/plugins":
    ensure  => directory,
    require => $require,
  }
  ruby::rbenv::plugin { 'rbenv-vars':
    source  => 'sstephenson/rbenv-vars',
    ensure  => 'v1.2.0',
  }
  ruby::rbenv::plugin { 'rbenv-gem-rehash':
    source  => 'sstephenson/rbenv-gem-rehash',
    ensure  => 'v1.0.0',
  }
  ruby::rbenv::plugin { 'rbenv-gem-update':
    source  => 'n0ts/rbenv-gem-update',
    ensure  => 'v1.0.0a',
  }

  # latest stable
  class { 'ruby::global':
     version => $version_latest,
  }

  install_package {
    [
      'bundler',
      'pry',
      'tmuxinator',
    ]: ;
  }

  # required for Boxen module development
  ruby::version { $version_boxen: }

  ruby_gem { "bundler for ${version_boxen}":
    gem          => 'bundler',
    ruby_version => $version_boxen,
  }
}
