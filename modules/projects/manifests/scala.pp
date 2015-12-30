class projects::scala {
  notify { 'class project::scala declared': }

  package {
    [
      'scala',
      'sbt',
      'typesafe-activator',
     ]:
    ensure => latest,
  }
}
