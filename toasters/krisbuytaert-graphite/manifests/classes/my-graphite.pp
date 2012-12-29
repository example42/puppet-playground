class my-graphite {


  package {
    'django-tagging':
      ensure => present;
  }

  $soft = ['mod_wsgi', 'python-fedora-django', 'mod_python', 'python-zope-interface',
  'python-twisted-core', 'python-memcached', 'python-ldap' ]
  package {
    $soft:
      ensure => present;
  }


  class {'graphite::params':
    time_zone    => 'UTC',
    manage_httpd => true,
  }
  class {'graphite': }
  #include graphite::demo


  service { 'iptables':
    ensure    => 'stopped',
    name      => 'iptables',
    enable    => false,
    hasstatus => true
  }

  include logster

  #  logster::graphite {"swa":
  #  host => '127.0.0.1',
  #  file => '/var/log/graphite-web/access.log',
  #  prefix => 'swa'
  #}


  file {'/etc/httpd/conf.d/welcome.conf':
    ensure => absent;
  }


  # Satisfy  jps dependency
  package {'java-1.6.0-openjdk-devel': ensure => present; }

  include jmxtrans
  include jmxtrans::example

  jmxtrans::graphite {'duplicate':
    jmxhost      => '127.0.0.1',
    jmxport      => '2101',
    objtype      => 'java.lang:type=Memory',
    attributes   => '"HeapMemoryUsage", "NonHeapMemoryUsage"',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }


  jmxtrans::graphite {'dev.example.com':
    jmxhost      => '172.16.0.1',
    jmxport      => '5446',
    objtype      => 'java.lang:type=Memory',
    attributes   => '"HeapMemoryUsage", "NonHeapMemoryUsage"',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }
  jmxtrans::graphite {'catalinathread.dev.example.com':
    jmxhost      => '172.16.0.1',
    jmxport      => '5446',
    objtype      => 'Catalina:type=ThreadPool,name=*',
    attributes   => '"currentThreadCount", "currentThreadsBusy", ""',
    resultAlias  => 'connectors',
    typenames    => 'name',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }

  jmxtrans::graphite {'queue.hornetq.dev.example.com':
    jmxhost      => '192.168.92.100',
    jmxport      => '5446',
    objtype      => 'org.hornetq:type=Queue,*',
    attributes   => '"MessageCount","MessagesAdded","ConsrCount"',
    resultAlias  => 'hornetq',
    typenames    => 'name',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }

  jmxtrans::graphite {'hornetq.dev.example.com':
    jmxhost      => '172.16.0.1',
    jmxport      => '5446',
    objtype      => 'java.lang:thype=Memory',
    attributes   => '"HeapMemoryUsage", "NonHeapMemoryUsage"',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }

  jmxtrans::graphite {'thread.dev.example.com':
    jmxhost      => '172.16.0.1',
    jmxport      => '5446',
    objtype      => 'java.lang:type=Threading',
    attributes   => '"ThreadCount", "PeakThreadCount","DaemonThreadCount","TotalStartedThreadCount"',
    graphitehost => '127.0.0.1',
    graphiteport => '2003',
  }

  graphite::carbon::storage {'default_1min_for_1day':
    pattern    => '.*',
    retentions => '60s:1d,300s:30d,600s:356d'
  }



  include collectd
  #include collectd::plugin::snmp
  #class {'collectd::plugin::graphitewriter':
  #  graphitehost   => '127.0.0.1',
  #  graphiteport   => '2003',
  #                  }

  include statsd
  class {'tattle':
    dbhost        => '10.42.42.41',
    dbpass        => 'elttat',
    graphiteurl   => 'http://graphite/',
  }


  # class { 'percona':
  #  server          => 'true',
  #  percona_version => '5.1';
  #}


  #percona::database{"tattle":
  #  ensure => present
  #}
  #percona::rights{"Set rights for tattle":
  #  user          => "tattle",
  #  password      => "elttat",
  #  database      => ["tattle"],
  #  priv          => ["select_priv", "insert_priv", "update_priv", "delete_priv"],
  #  host          => "localhost"
  #}


  }

