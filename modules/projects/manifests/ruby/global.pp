# Public ruby:global
class projects::ruby::global(
  $versions,
  $prefix,
) {
  if $versions[0] != 'system' {
    ensure_resource('projects::ruby::version', $versions[0],
                    { 'version' => $versions[0], 'prefix' => $prefix })
    $require = Projects::Ruby::Version[$versions[0]]
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
