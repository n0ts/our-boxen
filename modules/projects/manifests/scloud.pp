# Public: scloud
class projects::scloud {
  notify { 'class projects::scloud declared': }

  homebrew::tap { 'sacloud/usacloud': }

  package { 'usacloud':
    require => Homebrew::Tap['sacloud/usacloud'],
  }
}
