# Public: ruby
class projects::ruby {
  notify { 'class projects::ruby declared': }

  $version_latest = '2.5.1'
  $prefix = "${::homebrew_root}/opt/anyenv/envs/rbenv"

  file { "${::boxen_home}/cache/rbenv":
    ensure => directory,
  }

  projects::ruby::plugin {
    'rbenv-vars':
      source => 'rbenv/rbenv-vars',
      ensure => 'v1.2.0';
    'rbenv-gem-update':
      source => 'n0ts/rbenv-gem-update',
      ensure => 'v1.0.0a';
  }

  # latest stable
  class { 'projects::ruby::global':
    versions => [ $version_latest ],
    prefix   => $prefix,
  }

  projects::ruby::package {
    [
      'bundler',
      'pry',
      'tmuxinator',
    ]: ;
  }

  file { "${::boxen_home}/.tmuxinator":
    ensure => directory,
  }
}
