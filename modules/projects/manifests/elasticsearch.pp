class projects::elasticsearch {
  notify { 'class project::elasticsearch declared': }

  define install_plugin($plugin = undef) {
    if $plugin == unfef {
      $_plugin = $name
    } else {
      $_plugin = $plugin
    }
    $unless = "plugin --list | grep \"${_plugin}\""
    exec { "install-plugin-${name}":
      command => "plugin install ${name}",
      unless  => $unless,
      require => Package['elasticsearch'],
    }
  }

  package {
    [
      'elasticsearch',
      'kibana',
     ]: ;
  }

  install_plugin {
    'elasticsearch/marvel/latest':
      plugin => 'marvel';
    'elasticsearch/elasticsearch-analysis-kuromoji/2.7.0':
      plugin => 'analysis-kuromoji';
    'mobz/elasticsearch-head':
      plugin => 'head';
    'lmenezes/elasticsearch-kopf/2.0.1':
      plugin => 'kopf';
    'polyfractal/elasticsearch-inquisitor':
      plugin => 'inquisitor';
  }
}
