# Public: elasticsearch::plugin
define projects::elasticsearch::plugin($plugin = undef) {
  if $plugin == unfef {
    $_plugin = $name
  } else {
    $_plugin = $plugin
  }
  $unless = "elasticsearch-plugin list | grep \"${_plugin}\""
  exec { "install-plugin-${name}":
    command => "elasticsearch-plugin install --batch ${name}",
    unless  => $unless,
    require => Package['elasticsearch'],
  }
}
