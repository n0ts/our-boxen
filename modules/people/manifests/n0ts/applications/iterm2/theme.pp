# Define: item2::theme
define people::n0ts::applications::iterm2::theme($url) {
  $theme = "${name}.itermcolors"
  $download_url = uriescape("${url}/${theme}")
  $unless = "defaults read com.googlecode.iterm2 \"Custom Color Presets\" | grep \"${name}\""
  exec { "install-theme-${name}":
    command => join([
                     "curl -L \"${download_url}\" > \"${::boxen_home}/cache/iterm2/${theme}\"",
                     "open \"${::boxen_home}/cache/iterm2/${theme}\"",
                     ], "\n"),
    unless  => $unless,
    require => [ Package['iterm2'], File["${::boxen_home}/cache/iterm2"] ],
  }
}
