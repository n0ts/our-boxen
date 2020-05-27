# Public node:global
class projects::node::global(
  $versions,
  $prefix,
) {
  if $versions[0] != 'system' {
    ensure_resource('projects::node::version', $versions[0],
                    { 'version' => $versions[0], 'prefix' => $prefix })
    $require = Projects::Node::Version[$versions[0]]
  } else {
    $require = undef
  }

  file { "${prefix}/version":
    ensure  => present,
    mode    => '0644',
    content => join($versions, "\n"),
    require => $require,
  }
}
