# Public: terminal::code
define projects::terminal::code() {
  exec { "install-iterm2-code-${name}":
    command => join([
                     "curl -L https://raw.github.com/gnachman/iTerm2/master/tests/${name} > /Users/${::boxen_user}/.iterm2/${name}",
                     "chmod +x /Users/${::boxen_user}/.iterm2/${name}",
                   ], "\n"),
    unless  => "test -x /Users/${::boxen_user}/.iterm2/${name}",
    require => File["/Users/${::boxen_user}/.iterm2"],
  }
}
