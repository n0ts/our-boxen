class projects::hashitools {
  notify { 'class project::hashitools declared': }

  include brewcask
  package {
    [
      'consul',
      'nomad',
      'otto',
      'packer',
      'serf',
      'terraform',
      'vagrant',
      'vault',
     ]:
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }
}
