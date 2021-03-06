# Public: gcloud
class projects::gcloud {
  notify { 'class projects::gcloud declared': }

  $cmd = [
          'curl -sL https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz',
          'tar zxf google-cloud-sdk.tar.gz',
          './google-cloud-sdk/install.sh --usage-reporting false --command-completion false --path-update false --additional-components app-engine-java app-engine-php-darwin app-engine-python app kubectl alpha beta gcd-emulator pubsub-emulator cloud-datastore-emulator app-engine-go cbt datalab docker-credential-gcr',
          'mv /tmp/google-cloud-sdk /opt/',
          'rm -f /tmp/google-cloud-sdk.tar.gz',
          "chown -R ${::boxen_user} /Users/${::boxen_user}/.config/gcloud",
          ]
  exec { 'install-google-cloud-sdk':
    command => join($cmd, "\n"),
    cwd     => '/tmp',
    user    => root,
    unless  => 'test -d /opt/google-cloud-sdk',
  }

  include projects::python

  file { "${boxen::config::home}/bin/gcloud-update":
    content => template('projects/shared/gcloud-update.erb'),
    mode    => '0755',
  }

  file { '/opt/google-cloud-sdk/bin/.python-version':
    content => $projects::python::version_stable,
    require => Exec['install-google-cloud-sdk'],
  }
}
