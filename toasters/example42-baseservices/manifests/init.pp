## GENERAL SETUPS
# This top scope variables can be overrriden in clesses parameters

# Automatic monitoring management. $monitor_tool can be an array
$monitor      = true
$monitor_tool = [ 'puppi' ]

# Uncomment below to enable host based firewalling with Iptables
# $firewall      = true
# $firewall_tool = [ 'iptables' ]

# Uncomment below to enabled debugging
# $debug        = true

# Basic package management

# Basic package management
case $::osfamily {
  redhat: {
    include yum::repo::epel
    package { 'redhat-lsb': ensure => present }
  }
  debian: {
    include apt
    package { 'lsb-release': ensure => present }
  }
  suse: {
    package { 'lsb': ensure => present }
  }
}


# OpenSSH Management
  class { 'openssh':
#    template => 'example42/openssh/sshd_config.erb',
#    port     => '22122',
#    options  => {
#       'PermitRootLogin' => 'without-password'
#    },
  }

# Resolver management
  class { 'resolver':
    dns_servers => [ '8.8.4.4' , '8.8.8.8' ],
    search      => 'example42.com' ,
    options     => {
      'rotate'  => '',
      'timeout' => '2',
    },
  }

# Ntp Management
  class { 'ntp':
    server => '1.europe.pool.ntp.org',
  }

# MUNIN management
  class { 'munin':
    server       => [ '10.42.42.12' ] ,
    server_local => $::hostname ? {
      'munin' => true,
      default => false,
    },
  }

# NRPE management
  class { 'nrpe':
    allowed_hosts => [ '10.42.42.11' , '10.42.42.16' , $::ipaddress ],
  }

# RSYSLOG management
  class { 'rsyslog':
#    template => 'example42/rsyslog/rsyslog.conf',
#    my_class => 'example42::my_rsyslog',
  }



## DEBUG
# Uncomment below to have /tmp/puppet.debug with all the scope variables
if $debug == true {
  file { '/tmp/puppet.debug':
    ensure   => present,
    mode     => '0640',
    owner    => 'root',
    group    => 'root',
    loglevel => debug,  # this is needed to avoid it being logged and reported on every run
    content  => inline_template('<%= scope.to_yaml %>'),
  }
}
