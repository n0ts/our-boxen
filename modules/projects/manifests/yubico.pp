# Public: yubico
class projects::yubico {
  notify { 'class projects::yubico declared': }

  package {
    [
      'yubico-pam',
    ]:
    ensure => latest,
  }

  package {
    [
      'yubico-authenticator',
      'yubikey-neo-manager',
     ]:
    provider => 'brewcask',
  }

  file { "/Users/${::boxen_user}/.yubico":
    ensure => directory,
    mode   => '0700',
  }

  notify { "Please copy to ${::homebrew_root}/Cellar/pam_yubico/[version]/lib/security/pam_yubico.so /usr/lib/pam/pam_yubico.so": }
}
