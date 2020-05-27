# Public: elasticsearch
class projects::elasticsearch {
  notify { 'class projects::elasticsearch declared': }

  package {
    [
      'elasticsearch',
      'kibana',
      'logstash',
      'filebeat',
      'metricbeat',
     ]: ;
  }

  projects::elasticsearch::plugin {
    [
      'x-pack',
      'analysis-kuromoji',
    ]: ;
  }
}
