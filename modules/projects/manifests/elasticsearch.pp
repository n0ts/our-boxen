class projects::elasticsearch {
  notify { 'class project::elasticsearch declared': }

  define install_plugin($plugin = undef) {
    if $plugin == unfef {
      $_plugin = $name
    } else {
      $_plugin = $plugin
    }
    $unless = "elasticsearch-plugin list | grep \"${_plugin}\""
    exec { "install-plugin-${name}":
      command => "elasticsearch-plugin install --batch ${name}",
      unless  => $unless,
      require => Package['elasticsearch'],
    }
  }

  package {
    [
      'elasticsearch',
      'kibana',
      'logstash',
      'filebeat',
      'metricbeat',
     ]: ;
  }

  install_plugin {
    [
      'x-pack',
      'analysis-kuromoji',
    ]: ;
  }
}
