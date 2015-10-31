class projects::web {
  notify { 'class project::web declared': }

  package {
    [
      'h2o',
      'hadoop',
      'haproxy',
      'imagemagick',
      'jemalloc',
      'jmeter',
     ]: ;
  }
}
