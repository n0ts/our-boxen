class projects::scala {
  notify { 'class project::scala declared': }

  package {
    [
      'scala',
      'skinny',
      'sbt',
      'typesafe-activator',
     ]:
    ensure => latest,
  }
}
