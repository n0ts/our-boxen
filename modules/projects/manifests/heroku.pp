class projects::heroku {
  notify { 'class project::heroku declared': }

  package {
    'heroku': ;
  }
}
