class projects::google_cloud {
  notify { 'class project::google-cloud declared': }

  exec { 'install-google-cloud-sdk':
    command => join([
                     'curl -sL https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz',
                     'tar zxf google-cloud-sdk.tar.gz',
                     './google-cloud-sdk/install.sh --usage-reporting false --command-completion false --path-update false --additional-components app-engine-java app-engine-php-darwin app-engine-python app kubectl alpha beta gcd-emulator pubsub-emulator cloud-datastore-emulator app-engine-go cbt datalab docker-credential-gcr',
                     'mv /tmp/google-cloud-sdk /opt/',
                     'rm -f /tmp/google-cloud-sdk.tar.gz',
                     "chown -R ${::boxen_user} /Users/${::boxen_user}/.config/gcloud",
                     ], "\n"),
    cwd     => '/tmp',
    user    => root,
    unless => 'test -d /opt/google-cloud-sdk',
  }
}
