class projects::ruby {
  notify { 'class project::ruby declared': }

  define latest_install_package() {
    ruby_gem { "${name} for 2.2.3":
      gem          => $name,
      ruby_version => '2.2.3',
    }
  }

  # plugins
  file { "${::boxen_home}/rbenv/plugins":
    ensure  => directory,
    require => $require
  }
  ruby::rbenv::plugin { 'rbenv-vars':
    ensure => 'v1.2.0',
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
     version => '2.2.3',
  }

  latest_install_package {
    [
      'bundler',
      'tmuxinator',
    ]: ;
  }

  # required for Boxen module development
  ruby::version { '2.0.0-p647': }

  ruby_gem { "bundler for 2.0.0-p647":
    gem          => 'bundler',
    ruby_version => '2.0.0-p647',
  }
}
