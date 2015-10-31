class projects::ansible {
  notify { 'class project::ansible declared': }

  package { 'ansible': }

  include projects::python

  python::install_package { 'ansible-lint': }
}
