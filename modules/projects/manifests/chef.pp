class projects::chef {
  notify { 'class project::chef declared': }

  include brewcask
  package { 'chefdk':
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }
}
