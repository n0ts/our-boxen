# Public: anyenv
class people::n0ts::applications::anyenv(
  $envs,
) {

  $anyenv_definition_root = "${::boxen_home}/config/anyenv"
  $anyenv_root = "${::boxen_home}/data/anyenv"

  exec { "anyenv - init":
    command     => "anyenv install --force-init",
    provider    => shell,
    environment => [
                    "ANYENV_DEFINITION_ROOT=${anyenv_definition_root}",
                    ],
    onlyif      => "test ! -d ${anyenv_root}",
    require     => Package['anyenv'],
  }

  $envs.each |String $env| {
    exec { "anyenv - ${env}":
      command     => "anyenv install ${env}",
      provider    => shell,
      environment => [
                      "ANYENV_DEFINITION_ROOT=${anyenv_definition_root}",
                      "ANYENV_ROOT=${anyenv_root}",
                      ],
      onlyif      => "test ! -d ${anyenv_root}/envs/${env}",
      require     => [Exec["anyenv - init"], Package['anyenv'] ],
    }
  }
}
