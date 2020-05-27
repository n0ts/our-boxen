# Public: memcached
class projects::memcached {
  notify { 'class projects::memcached declared': }

  package {
    [
     'memcached',
     'libmemcached'
     ]:
    ensure => latest,
  }
}
