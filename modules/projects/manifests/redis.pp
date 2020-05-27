# Public: redis
class projects::redis {
  notify { 'class projects::redis declared': }

  package { 'redis':
    ensure => latest,
  }
}
