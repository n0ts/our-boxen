# Public: chef
class projects::chef {
  notify { 'class projects::chef declared': }

  include brewcask

  package { 'chefdk':
    provider => 'brewcask',
  }
}
