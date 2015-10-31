class people::n0ts::applications::1password {
  notify { 'class people::n0ts::applications::1password declared': }

  # installed 1Password from the Mac App Store,
  # https://support.1password.com/switch-to-opvault/mac.html
  boxen::osx_defaults { 'Make OPVault the default format':
    user    => $::boxen_user,
    domain  => '2BUA8C4S2C.com.agilebits.onepassword-osx-helper',
    key     => 'useOPVaultFormatByDefault',
    type   => 'bool',
    value   => true,
  }
}
