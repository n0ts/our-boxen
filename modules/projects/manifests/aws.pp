class projects::aws {
  notify { 'class project::aws declared': }

  include python

  package {
    [
      'ec2-ami-tools',
      'ec2-api-tools',
     ]: ;
  }

  python::install_package {
    'awscli': ;
    'ec2-ssh':
      url => 'https://github.com/n0ts/ec2-ssh/archive/my-develop.zip';
  }

  file { "/Users/${::boxen_user}/.aws":
    ensure => directory,
    mode   => 0750,
  }

  file { "/Users/${::boxen_user}/.aws/config":
    content => '
[default]
;region=
output=json
',
    mode    => 0640,
    replace => false,
    require => File["/Users/${::boxen_user}/.aws"],
  }

  file { "/Users/${::boxen_user}/.aws/credentials":
    content => '
[default]
aws_access_key_id=
aws_secret_access_key=
',
    mode    => 0640,
    replace => false,
    require => File["/Users/${::boxen_user}/.aws"],
  }
}