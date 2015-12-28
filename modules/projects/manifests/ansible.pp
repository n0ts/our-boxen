class projects::ansible {
  notify { 'class project::ansible declared': }

  package { 'ansible': }

  include projects::python

  python::install_package { 'ansible-lint': }

  file {
    [
      "/Users/${::boxen_user}/.ansible",
      "/Users/${::boxen_user}/.ansible/plugins",
      "/Users/${::boxen_user}/.ansible/plugins/callback_plugins"
     ]:
      ensure  => directory,
  }

  file { "/Users/${::boxen_user}/.ansible/ansible.cfg":
      content => "[defaults]
callback_plugins= ~/.ansible/plugins/callback_plugins/
retry_files_enabled = False
",
      require => File["/Users/${::boxen_user}/.ansible"],
  }

  require wget

  exec { 'get human_log.py':
    command => "wget -q https://raw.githubusercontent.com/redhat-openstack/khaleesi/master/plugins/callbacks/human_log.py -O /Users/${::boxen_user}/.ansible/plugins/callback_plugins",
    creates => "/Users/${::boxen_user}/.ansible/plugins/callback_plugins/human_log.py",
}
}
