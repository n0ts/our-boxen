class projects::memcached {
  notify { 'class project::memcached declared': }

  package {
    [
     'memcached',
     'libmemcached'
     ]: ;
  }
}
