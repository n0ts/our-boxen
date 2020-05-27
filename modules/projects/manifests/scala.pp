# Public: scala
class projects::scala {
  notify { 'class projects::scala declared': }

  package {
    [
      'scala',
      'skinny',
      'sbt',
     ]:
    ensure => latest,
  }
}
