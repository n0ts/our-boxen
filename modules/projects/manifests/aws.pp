# Public: aws
class projects::aws {
  notify { 'class projects::aws declared': }

  $python_version = '2.7.14'

  include brewcask

  package {
    [
      'awslogs',
      'ec2-ami-tools',
      'ec2-api-tools',
      'amazon-ecs-cli',
     ]:
       ensure => latest,
  }

  package {
    [
      'amazon-workspaces',
     ]:
      provider => 'brewcask',
  }

  # Homebrew n0ts
  ensure_resource('homebrew::tap', 'n0ts/myformula')

  package {
    [
      'athenai',
    ]:
       require => Homebrew::Tap['n0ts/myformula'],
  }

  require projects::python

  projects::python::package {
    [
     'awscli',
     'awsebcli',
     'aws-shell'
     ]:
       python => $python_version;

    'ec2-ssh':
      python => $python_version,
      url => 'https://github.com/n0ts/ec2-ssh/archive/my-develop.zip';
  }

  file { "/Users/${::boxen_user}/.aws":
    ensure => directory,
    mode   => '0750',
  }

  file { "/Users/${::boxen_user}/.aws/config":
    content => '
[default]
;region=
output=json
',
    mode    => '0640',
    replace => false,
    require => File["/Users/${::boxen_user}/.aws"],
  }

  file { "/Users/${::boxen_user}/.aws/credentials":
    content => '
[default]
aws_access_key_id=
aws_secret_access_key=
',
    mode    => '0640',
    replace => false,
    require => File["/Users/${::boxen_user}/.aws"],
  }
}
