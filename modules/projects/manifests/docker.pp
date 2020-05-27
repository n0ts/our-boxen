# Public: docker
class projects::docker {
  notify { 'class projects::docker declared': }

  include brewcask

  package {
    [
     # Pack, ship and run any application as a lightweight container
     # https://www.docker.com/
     'docker',
     # Kitematic
     # https://kitematic.com/
     'kitematic',
    ]:
    provider => 'brewcask',
  }
}
