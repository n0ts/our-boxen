class projects::web {
  notify { 'class project::web declared': }

  package {
    [
      # Collection of tools for managing UNIX services
      # http://cr.yp.to/daemontools.html
      'daemontools',
      # HTTP server with support for HTTP/1.x and HTTP/2
      # https://github.com/h2o/h2o/
      'h2o',
      # Framework for distributed processing of large data sets
      # https://hadoop.apache.org/
      'hadoop',
      # Reliable, high performance TCP/HTTP load balancer
      # http://www.haproxy.org/
      'haproxy',
      # User-friendly cURL replacement (command-line HTTP client)
      # https://github.com/jkbrzt/httpie
      'httpie',
      # Tools and libraries to manipulate images in many formats
      # http://www.imagemagick.org
      'imagemagick',
      # malloc implementation emphasizing fragmentation avoidance
      # http://www.canonware.com/jemalloc/download.html
      'jemalloc',
      # Load testing and performance measurement application
      # https://jmeter.apache.org/
      'jmeter',
    ]: ;
  }

  include brewcask

  package {
    [
      # HTTP Caputure
      # http://www.charlesproxy.com/
      'charles',
    ]:
      provider => 'brewcask',
      require  => Homebrew::Tap['caskroom/cask'],
  }
}
