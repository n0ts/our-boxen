# Public: ansible
class projects::ansible {
  notify { 'class projects::ansible declared': }

  package { 'ansible':
    ensure => latest,
  }

  include projects::python

  projects::python::package { 'ansible-lint': }

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

  exec { 'get human_log.py':
    command => "wget -q https://raw.githubusercontent.com/n0ts/ansible-human_log/master/human_log.py -P /Users/${::boxen_user}/.ansible/plugins/callback_plugins/",
    creates => "/Users/${::boxen_user}/.ansible/plugins/callback_plugins/human_log.py",
  }
}
