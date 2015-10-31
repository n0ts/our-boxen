class projects::php {
  notify { 'class project::php declared': }

  include projects::memcached
  include projects::mysql
  include projects::postgresql
  include projects::redis

  # Homebrew php
  homebrew::tap { 'homebrew/php': }

  # Homebrew n0ts
  homebrew::tap { 'n0ts/myformula': }

  package { 'my-php56':
     require => [
                   Homebrew::Tap['homebrew/php'],
                   Homebrew::Tap['n0ts/myformula'],
                   Package['mariadb'],
                   Package['postgresql'],
                 ],
  }

  package { 'composer':
    require => [
                 Homebrew::Tap['homebrew/php'],
                 Package['my-php56'],
                ]
  }

  file { "${boxen::config::homebrewdir}/etc/php/5.6/_local.ini":
    content => template('projects/shared/php-local.ini.erb'),
    require => Package['my-php56'],
  }

  # Fix for PHP Warning:  Module 'pdo_pgsql' already loaded in Unknown on line 0
  file { "${boxen::config::homebrewdir}/etc/php/5.6/conf.d/ext-pdo_pgsql.ini":
    ensure  => absent,
    require => Package['my-php56'],
  }
}
