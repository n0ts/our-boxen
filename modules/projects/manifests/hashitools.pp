class projects::hashitools {
  notify { 'class project::hashitools declared': }


  define install_vagrant_plugin() {
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
  }

  include brewcask
  package {
    [
      'consul',
      'nomad',
      'otto',
      'packer',
      'serf',
      'terraform',
      'vagrant',
      'vault',
     ]:
    provider => 'brewcask',
    require  => Homebrew::Tap['caskroom/cask'],
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure  => directory,
  }

  install_vagrant_plugin {
    [
     "sahara",
     "vagrant-aws",
     "vagrant-azure",
     "vagrant-digitalocean",
     "vagrant-google",
     "vagrant-managed-servers",
     "vagrant-rackspace",
     "vagrant-softlayer",
     "vagrant-vmware-fusion",
     ]: ;
  }

  notify { "vagrant plugin license vagrant-vmware-fusion ~/license.lic": }
}
