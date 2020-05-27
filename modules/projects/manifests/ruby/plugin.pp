# Public: ruby::plugin
define projects::ruby::plugin($ensure, $source) {
  repository { "ruby-plugin-${name}":
    ensure => $ensure,
    force  => true,
    path   => "${::homebrew_root}/opt/anyenv/envs/rbenv/plugins/${name}",
    source => $source,
    user   => $::boxen_user,
  }
}
