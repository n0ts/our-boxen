class projects::redis {
  notify { 'class project::redis declared': }

  package { 'redis':
    ensure => latest,
  }
}
