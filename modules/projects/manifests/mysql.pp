class projects::mysql {
  notify { 'class project::mysql declared': }

  # mysql
  package { 'mysql':
    ensure => '5.7.11';
  }

}
