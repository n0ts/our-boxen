# Public: hashitools:vagrant_plugin
define projects::hashitools::vagrant_plugin() {
  $vagrant_root = "/opt/vagrant"
  $vagrant_bin = "${vagrant_root}/bin/vagrant"
  $unless = "${vagrant_bin} plugin list | grep ${name}"
  exec { "install-vagrant-pluguin-${name}":
    command     => "${vagrant_bin} plugin install ${name}",
    environment =>
      [
       "VAGRANT_HOME=/Users/${::boxen_user}/.vagrant.d",
       "VAGRANT_NO_COLOR=1",
       ],
    unless      => $unless,
    require     => [ Package['vagrant'], File["/Users/${::boxen_user}/.vagrant.d"] ],
  }

  # dummy AWS box
  # https://github.com/mitchellh/vagrant-aws
  if $name == "vagrant-aws" {
    $unless_box = "${vagrant_bin} box list | grep dummy-aws"
    exec { "install-vagrant-pluguin-aws-dummy-box":
      command     => "${vagrant_bin} box add dummy-aws https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box",
      environment =>
        [
         "VAGRANT_DEFAULT_PROVIDER=virtualbox",
         "VAGRANT_HOME=/Users/${::boxen_user}/.vagrant.d",
         "VAGRANT_NO_COLOR=1",
         ],
      unless      => $unless_box,
      require     => [ Package['vagrant'], File["/Users/${::boxen_user}/.vagrant.d"] ],
    }
  }
}
