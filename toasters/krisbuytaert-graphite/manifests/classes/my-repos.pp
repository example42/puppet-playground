class my-repos{

  yumrepo{'base':
    descr           => 'CentOS-$releasever - Base',
    baseurl     => 'http://pulp.inuits.eu/pulp/repos/centos/$releasever/os/$basearch',
  }

  yumrepo{'updates':
    descr           => 'CentOS-$releasever - Updates',
    baseurl     => 'http://pulp.inuits.eu/pulp/repos/centos/$releasever/updates/$basearch',
  }
  yumrepo{'extras':
    descr           => 'CentOS-$releasever - Extras',
    baseurl     => 'http://pulp.inuits.eu/pulp/repos/centos/$releasever/extras/$basearch',
  }

  yumrepo{'centosplus':
    descr          => 'CentOS-$releasever - Plus',
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/centos/$releasever/centosplus/$basearch',
  }

  yumrepo{'contrib':
    descr          => 'CentOS-$releasever - Contrib',
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/centos/$releasever/contrib/$basearch',
                                                                                                      }

  yumrepo { 'rubygems':
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/rubygems',
    descr      => 'RubyGems at Inuits',
    gpgcheck   => '0',
  }

  yumrepo { 'monitoringsucks':
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/monitoring',
    descr      => 'MonitoringSuck at Inuits',
    gpgcheck   => '0',
  }
  yumrepo {'epel':
    baseurl  => 'http://pulp.inuits.eu/pulp/repos/epel/6/x86_64/',
    descr    => 'Epel Repo at Inuits',
    gpgcheck => '0',
    enabled  => '1',
  }
  yumrepo {'nodjes-tchol':
    baseurl    => 'https://pulp.inuits.eu/pulp/repos/stable/el6/x86_64/',
    descr      => 'NodeJs Tjol Mirror at Inuits',
    gpgcheck   => '0',
  }

  yumrepo {'stealthmonkeys':
    baseurl    => 'https://pulp.inuits.eu/pulp/repos/rhel/6/x86_64/',
    descr      => 'Stealthmonkeys at Inuits',
    gpgcheck   => '0',
  }
}
