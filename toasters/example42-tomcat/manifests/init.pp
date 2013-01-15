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

## Alternative multi jdk installation
/*
java::install { 'Java7':
  jdk     => true,
  version => 7,
}
*/


# TOMCAT INSTALLATION
# Basic Tomcat Installation
  class { 'tomcat':
  }


## JAVA WEB APPS INSTALLATION
# Puppi deploy procedures for various software.
# Note that the following software is not installed automatically by Puppet
# Puppet provides the Puppi configurations
# To deploy run, for example:
# From a VM root shell: 'puppi deploy jenkins'
# From pupppet-playground base dir (to deploy on all active boxes): './play puppi deploy jenkins'
#
# Note that this code is just for demostration purpose.
# Dependencies or specific configurations may prevent the deployed software from working out of the box
# Note also that this toaster doesn't provide specific (and tested) Vagrant configurations, so there's no
# useful port-forwarding 

puppi::project::war { 'nexus':
  source        => 'http://www.sonatype.org/downloads/nexus-2.2-01.war',
  deploy_root   => $tomcat::data_dir,
  run_checks    => false,
  check_deploy  => false,
  backup_enable => false,
}

puppi::project::war { 'liferay':
  source      => 'http://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.1%20GA2/liferay-portal-6.1.1-ce-ga2-20120731132656558.war/download',
  deploy_root => $tomcat::data_dir,
  run_checks    => false,
  check_deploy  => false,
  backup_enable => false,
}

puppi::project::war { 'jenkins':
  source        => 'http://mirrors.jenkins-ci.org/war/latest/jenkins.war',
  deploy_root   => $tomcat::data_dir,
  run_checks    => false,
  check_deploy  => false,
  backup_enable => false,
}


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
