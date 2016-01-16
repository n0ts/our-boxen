class projects::mysql {
  notify { 'class project::mysql declared': }

  # mysql
  package { 'mariadb':
    ensure => latest,
  }

}
