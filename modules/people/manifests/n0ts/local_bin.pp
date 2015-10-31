define people::n0ts::local_bin(
   $content,
) {
  require people::n0ts::home

  file { "/Users/${::boxen_user}/.bin.local/${name}":
    mode => 755,
    content => "#!/usr/bin/env bash
${content}
",
    require => File["/Users/${::boxen_user}/.bin.local"],
  }
}
