class projects::chef {
  notify { 'class project::chef declared': }

  include brewcask
  package { 'chefdk':
    provider => 'brewcask',
  }
}
