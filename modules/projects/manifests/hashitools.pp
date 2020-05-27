# Public: hashitools
class projects::hashitools {
  notify { 'class projects::hashitools declared': }

  include brewcask

  package {
    [
      'consul',
      'nomad',
      'packer',
      'serf',
      'terraform',
      'vault',
     ]:
       ensure => latest,
  }

  package {
    [
     'vagrant',
     ]:
       provider => 'brewcask',
  }

  file { "/opt/vagrant/embedded/bin/curl":
    ensure => absent,
    require => Package["vagrant"],
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure  => directory,
  }

  projects::hashitools::vagrant_plugin {
    [
     "sahara",
     "vagrant-aws",
     "vagrant-azure",
     "vagrant-berkshelf",
     "vagrant-digitalocean",
     "vagrant-google",
     "vagrant-managed-servers",
     "vagrant-omnibus",
     "vagrant-rackspace",
     "vagrant-softlayer",
     "vagrant-vbguest",
     ]: ;
  }

  notify { "vagrant plugin install vagrant-vmware-fusion && vagrant plugin license vagrant-vmware-fusion license.lic": }
}
