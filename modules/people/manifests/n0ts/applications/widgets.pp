# Public: widgets
class people::n0ts::applications::widgets {
  notify { 'class people::n0ts::applications::widgets declared': }

  boxen::zipped_widget {
    'Currency Converter':
      source => 'http://widgets.palple.net/currencyconverter/CurrencyConverter.zip';
    'DashKards':
      source =>  'http://dashkards.com/widget-data/dashkards.zip';
    'Delivery Status':
      source => 'https://junecloud.com/get/delivery-status-widget?6.2.1';
    'Minutes':
      source => 'https://us.softpedia-secure-download.com/dl/42338d8cdf44cd5dcd4020f82e0adcf7/5a7d3dc8/400023930/mac/Dashboard-Widgets/Minutes.zip';
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
}
