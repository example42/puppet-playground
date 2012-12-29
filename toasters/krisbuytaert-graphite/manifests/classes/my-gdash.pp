class my-gdash{


  include passenger

  apache::vhost{'gdash':
    docroot      => '/usr/local/gdash/public/',
    vhost_config => 'RackAutodetect On',
  }

  class {'gdash':
    graphitehost => 'https://graphite.dev.inuits.eu/'
  }

  rsyslog::shiplog{'gdash-access':
    filename     => '/var/log/httpd/vhosts/gdash/access.log',
    inputfiletag => 'apache-access',
  }
  rsyslog::shiplog{'gdash-error':
    filename     => '/var/log/httpd/vhosts/gdash/error.log',
    inputfiletag => 'apache-error',
  }


}


