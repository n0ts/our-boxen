# Public: heroku
class projects::heroku {
  notify { 'class projects::heroku declared': }

  package { 'heroku':
    ensure => latest,
  }
}
