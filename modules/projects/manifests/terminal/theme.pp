# Public: terminal::theme
define projects::terminal::theme($url) {
  $theme = "${name}.terminal"
  $download_url = uriescape("${url}/${theme}")
  $unless = "defaults read com.apple.Terminal \"Window Settings\" | tr -d '\"' | grep \"name = ${name}\""
  exec { "install-theme-${name}":
    command => join([
                     "curl -L \"${download_url}\" > \"${::boxen_home}/cache/terminal/${theme}\"",
                     "open \"${::boxen_home}/cache/terminal/${theme}\"",
                     ], "\n"),
    unless  => $unless,
    require => File["${::boxen_home}/cache/terminal"],
  }
}
