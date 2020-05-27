# Public: circleci
class projects::circleci {
  notify { 'class projects::circleci declared': }

  $download_url = uriescape("https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci")
  exec { "install-circleci":
    command => join([
                     "curl -L \"${download_url}\" > \"${::boxen_home}/bin/circleci\"",
                     "chmod +x \"${::boxen_home}/bin/circleci\"",
                     ], "\n"),
    unless  => "test -f \"${::boxen_home}/bin/circleci\"",
  }
}
