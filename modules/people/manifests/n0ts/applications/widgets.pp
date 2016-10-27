class people::n0ts::applications::widgets {
  notify { 'class people::n0ts::applications::widgets declared': }

  define raw_widget($source) {
    $clean_source = strip($source)

    Exec {
      creates => "/Library/Widgets/${name}.wdgt"
    }

    exec {
     "raw_widget-download-${name}":
        command => "/usr/bin/curl -L ${clean_source} > '/tmp/${name}.wdgt'",
        notify  => Exec["raw_widget-rename-${name}"];
     "raw_widget-rename-${name}":
        command     => "cp /tmp/${name}.wdgt .",
        cwd         => '/Library/Widgets',
        user        => 'root',
        require     => Exec["raw_widget-download-${name}"],
        refreshonly => true;
    }
  }

  boxen::zipped_widget {
    'Currency Converter':
      source => 'http://widgets.palple.net/currencyconverter/CurrencyConverter.zip';
    'DashKards':
      source =>  'http://dashkards.com/widget-data/dashkards.zip';
    'Delivery Status':
      source => 'https://junecloud.com/get/delivery-status-widget?6.2.1';
    'Minutes':
      source => 'https://dl.dropboxusercontent.com/u/1341171/Minutes.zip';
    'QR Code Generator':
      source => 'http://www.midwinter-dg.com/downloads/qr-code-generator.zip';
    'Percentages':
      source => 'http://widgets.palple.net/percentuali/Percentages.zip';
    'SoraMoyo':
      source => 'http://www.cyanworks.net/downloads/SoraMoyo1.5.3.zip';
    'iCal':
      source =>'http://cl.ly/AayE/download/iCal.wdgt.zip';
    'iStat Nano':
      source => 'http://ec.ccm2.net/ccm.net/download/files/istat_nano_2.2.zip';
  }

  raw_widget {
    'QuakeInfoDash':
      source => 'http://macwidgets.jpn.org/quakeinfodash/QuakeInfoDash520.wdgt.zip';
  }
}
