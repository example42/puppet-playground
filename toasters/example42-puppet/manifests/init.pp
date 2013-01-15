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


# USAGE SAMPLES

## Client Installation (with puppet.example42.com puppetmaster)
/*
  class { 'puppet':
    server       => 'puppet.example42.com',
  }
*/

## Client Installation with Puppet run activated by randomized cron.
/*
  # Run interval via cron every 3 hours (random)
  $rand_minute = fqdn_rand(60)
  $rand_hour = fqdn_rand(3)
  $rand_hour_set = $rand_hour ? {
    '0' => '0,3,6,9,12,15,18,21',
    '1' => '1,4,7,10,13,16,19,22',
    '2' => '2,5,8,11,14,17,20,23',
    default => '*', # This should never be met
  }
  $puppet_cron = "$rand_minute $rand_hour_set * * *"
  class { 'puppet':
    server       => 'puppet.grandsla.com',
    runmode      => 'manual',
    croninterval => $puppet_cron,
    croncommand  => '/usr/bin/puppet agent --onetime --ignorecache --no-usecacheonfailure',
  }
*/

## Basic Server installation
  class { 'puppet':
    allow        => ['127.0.0.1','*'],
    mode         => 'server',
 }

## Server installation with mod passenger
/*
  class { 'puppet':
    allow        => ['127.0.0.1','*'],
    mode         => 'server',
    passenger    => true,
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
