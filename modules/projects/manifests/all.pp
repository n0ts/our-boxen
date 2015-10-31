class projects::all {
  notify { 'class project::all declared': }

  include projects::ansible
  include projects::aws
  include projects::chef
  include projects::docker
  include projects::elasticsearch
  include projects::golang
  include projects::hashitools
  include projects::memcached
  include projects::mysql
  include projects::node
  include projects::php
  include projects::postgresql
  include projects::python
  include projects::redis
  include projects::ruby
  include projects::scala
  include projects::td_agent
  include projects::terminal
  include projects::vpn
  include projects::web
}
