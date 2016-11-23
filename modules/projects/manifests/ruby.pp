class projects::ruby {
  notify { 'class project::ruby declared': }

  $version_latest = '2.3.3'
  $version_boxen = '2.0.0-p647'

  define install_latest_package($ruby_version = $projects::ruby::version_latest) {
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
    ensure  => 'v1.2.0',
    source  => 'sstephenson/rbenv-vars',
  }
  ruby::rbenv::plugin { 'rbenv-gem-rehash':
    source  => 'sstephenson/rbenv-gem-rehash',
    ensure  => 'master',
  }
  ruby::rbenv::plugin { 'rbenv-gem-update':
    source  => 'nicknovitski/rbenv-gem-update',
    ensure  => 'master',
  }

  # latest stable
  class { 'ruby::global':
     version => $version_latest,
  }

  install_latest_package {
    [
      'bundler',
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
