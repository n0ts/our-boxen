class projects::scloud {
  notify { 'class project::scloud declared': }

  homebrew::tap { 'sacloud/usacloud': }

  package { 'usacloud':
    require => Homebrew::Tap['sacloud/usacloud'],
  }
}
