# Public: one_password
class projects::one_password {
  notify { 'class projects::one_password declared': }

  $app_support = "/Users/${::boxen_user}/Library/Application Support"
  $chrome_json = "${app_support}/Google/Chrome/NativeMessagingHosts/2bua8c4s2c.com.agilebits.1password.json"

  $vivaldi = [
              "mkdir -p \"${app_support}/Vivaldi/NativeMessagingHosts\"",
              "cp \"${chrome_json}\" \"${app_support}/Vivaldi/NativeMessagingHosts/\"",
             ]
  exec { 'Setup 1password for Vivaldi':
    command => join($vivaldi, "\n"),
  }

  $canary = [
             "mkdir -p \"${app_support}/Google/Chrome Canary/NativeMessagingHosts\"",
             "cp \"${chrome_json}\" \"${app_support}/Google/Chrome Canary/NativeMessagingHosts/\"",
            ]
  exec { 'Setup 1password for Chrome Canary':
    command => join($canary, "\n"),
  }
}
