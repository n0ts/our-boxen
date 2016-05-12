class people::n0ts::ssh {
  notify { 'class people::n0ts::ssh declared': }

  file { "/Users/${::boxen_user}/.ssh":
    ensure => directory,
    mode   => 700,
  }

  file {
    [
     "/Users/${::boxen_user}/.ssh/authorized_keys",
     "/Users/${::boxen_user}/.ssh/known_hosts",
     ]:
      content => "",
      mode    => 400,
      replace => false,
  }

  file { "/Users/${::boxen_user}/.ssh/config":
    content => 'Host *
  ServerAliveInterval 60
  ForwardAgent no
  Compression yes
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  Ciphers arcfour128,arcfour256,aes256-ctr,aes192-ctr,aes128-ctr,aes256-cbc,aes192-cbc,aes128-cbc,blowfish-cbc,cast128-cbc,3des-cbc,arcfour
  MACs hmac-sha1-96,hmac-sha1,hmac-md5-96,hmac-md5
  KexAlgorithms diffie-hellman-group1-sha1
  #ControlMaster auto
  #ControlPath ~/.ssh/master-%r@%h:%p
  #ControlPersist 10
',
    mode    => 400,
    replace => false,
  }
}
