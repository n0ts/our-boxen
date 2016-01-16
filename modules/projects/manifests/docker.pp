class projects::docker {
  notify { 'class project::docker declared': }

  package {
    [
     # Pack, ship and run any application as a lightweight container
     # https://www.docker.com/
     'docker',
     # Create Docker hosts locally and on cloud providers
     # https://docs.docker.com/machine
     'docker-machine',
     # Isolated development environments using Docker
     # https://docs.docker.com/compose/
     'docker-compose',
     # Turn a pool of Docker hosts into a single, virtual host
     # https://github.com/docker/swarm
     'docker-swarm',
    ]:
      ensure => latest,
  }

  include brewcask
  package {
    [
     # Kitematic
     # https://kitematic.com/
     'kitematic',
    ]:
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }
}
