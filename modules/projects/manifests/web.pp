class projects::web {
  notify { 'class project::web declared': }

  package {
    [
      'daemontools',
      'h2o',
      'hadoop',
      'haproxy',
      'imagemagick',
      'jemalloc',
      'jmeter',
    ]: ;
  }
}
