# Public: terminal::integration
define projects::terminal::integration() {
  exec { "install-iterm2-integration-${name}":
    command => join([
                     "curl -L https://iterm2.com/misc/${name}_startup.in > /Users/${::boxen_user}/.iterm2/shell_integration.${name}",
                     "chmod +x /Users/${::boxen_user}/.iterm2/shell_integration.${name}",
                   ], "\n"),
    unless  => "test -x /Users/${::boxen_user}/.iterm2/shell_integration.${name}",
    require => File["/Users/${::boxen_user}/.iterm2"],
  }
}
