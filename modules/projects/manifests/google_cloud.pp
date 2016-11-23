class projects::google_cloud {
  notify { 'class project::google-cloud declared': }

  exec { 'install-google-cloud-sdk':
    command => join([
                     'curl -sL https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz',
                     'tar zxf google-cloud-sdk.tar.gz',
                     './google-cloud-sdk/install.sh --usage-reporting false --command-completion false --path-update false --additional-components app',
                     'mv /tmp/google-cloud-sdk /opt/',
                     'rm -f /tmp/google-cloud-sdk.tar.gz',
                     ], "\n"),
    cwd     => '/tmp',
    user    => root,
    unless => 'test -d /opt/google-cloud-sdk',
  }
}
