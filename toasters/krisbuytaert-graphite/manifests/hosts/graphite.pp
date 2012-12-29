

node 'graphite' {


  include my-repos
  include my-graphite
  include apache
  #  apache::listen{'80':}
  #  apache::namevhost{'80':}
  #  include passenger



  tmpwatch::cleanup {'jmxtrans':
    path => '/var/lib/jmxtrans',
    age  => '5d',
  }
  tmpwatch::cleanup {'carbon':
    path => '/var/lib/carbon',
    age  => '5d',
  }

  class {'rsyslog':
    servers => '10.42.42.51';
  }
  class {'rsyslog::filelog':}
  rsyslog::shiplog{'graphite-access':
    filename => '/var/log/graphite-web/access.log',
    inputfiletag => 'apache-access',
  }
  rsyslog::shiplog{'graphite-error':
    filename => '/var/log/graphite-web/error.log',
    inputfiletag => 'apache-error',
  }

  include my-gdash

}

