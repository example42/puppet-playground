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

case $::hostname {
  puppet: {
    class { 'puppet':
      allow         => ['127.0.0.1','*'],
      mode          => 'server',
      passenger     => true,
      nodetool      => 'foreman',
      autosign      => true,
      externalnodes => true,
    }
  }
  foreman: {
    class { 'foreman':
    }
    class { 'mysql':
    }
  }
  puppetdb: {
    class { 'puppetdb':
      db_type      => 'postgresql',
      db_host      => '127.0.0.1',
      require      => Class['postgresql'],
    }
    class { 'postgresql':
      use_postgresql_repo => true,
    }
  }
  mq: {
    class { 'activemq':
    }
  }
}

# Common Resources
  class { 'mcollective':
    stomp_host           => 'mq.example42.com',
    stomp_user           => 'mcollective',
    stomp_password       => 'private_server',
    stomp_admin          => 'admin',
    stomp_admin_password => 'private_client',
    psk                  => 'aSecretPreSharedKey',
    install_client       => $::hostname ? {
      puppet  => true,
      default => false,
    },
    install_stomp_server => $::hostname ? {
      mq      => true,
      default => false,
    },
  }





if $debug {
  file { '/tmp/puppet.debug':
    ensure   => present,
    mode     => '0640',
    owner    => 'root',
    group    => 'root',
    loglevel => debug,  # this is needed to avoid it being logged and reported on every run
    content  => inline_template('<%= scope.to_yaml %>'),
  }
}
