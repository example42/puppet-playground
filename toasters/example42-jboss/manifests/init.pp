## GENERAL SETUPS
# Automatic monitoring management. $monitor_tool can be an array
$monitor      = true
$monitor_tool = [ 'puppi' ]

# Uncomment below to enable host based firewalling with Iptables
# $firewall      = true
# $firewall_tool = [ 'iptables' ]

# Uncomment below to enabled debugging
# $debug        = true

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


## JAVA INSTALLATION
# Basic Java 6 JRE
  class { 'java':
  }

## Alternative with Java 7 JDK
/*
  class { 'java':
    jdk     => true,
    version => 7,
  }
*/


# JBOSS INSTALLATION

# Install Jboss 7 from upstream
  class { 'jboss':
    version              => '7',
    process_user         => 'jboss',
    bindaddr             => $::ipaddress,
    user_uid             => '1502',
    user_gid             => '1502',
  }

# Default Installation
/*
  class { 'jboss':
  }
*/



## DEBUG
# Uncomment below to have /tmp/puppet.debug with all the scope variables
/*  
  file { '/tmp/puppet.debug':
    ensure   => present,
    mode     => '0640',
    owner    => 'root',
    group    => 'root',
    loglevel => debug,  # this is needed to avoid it being logged and reported on every run
    content  => inline_template('<%= scope.to_yaml %>'),
  }
*/
