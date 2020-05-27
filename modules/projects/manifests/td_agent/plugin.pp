# Public: ruby::plugin
define projects::td_agent::plugin() {
  $td_agent_root = '/opt/td-agent'
  $td_agent_gems = "${td_agent_root}/embedded/lib/ruby/gems/2.1.0/gems"
  $gem = "${td_agent_root}/usr/sbin/td-agent-gem"
  $unless = "ls ${td_agent_gems}/fluent-plugin-${name}-*"
  exec { "install-pluguin-${name}":
    command     => "${gem} install --no-document fluent-plugin-${name}",
    cwd         => $td_agent_root,
    environment => [
                    'BUNDLE_GEMFILE=""',
                    'BUNDLE_BIN_PATH=""',
                    'GEM_HOME=""',
                    'GEM_PATH=""',
                    'RUBYOPT=""',
                    'RUBYLIB=""',
                    ],
    user        => 'root',
    unless      => "${unless} >/dev/null 2>&1",
    require     => [ Package['td-agent'], Sudoers['td-agent-gem'], File["${td_agent_root}/Gemfile"] ],
  }
}
