### Global vars that affect any class declaration
$puppi        = true
$monitor      = true
$monitor_tool = [ 'puppi' ]

# USAGE SAMPLES

# Install Jboss 7 from upstream
  class { 'jboss':
    version              => '7',
    process_user         => 'jboss',
    bindaddr             => $::ipaddress,
    user_uid             => '1502',
    user_gid             => '1502',
  }

  class { 'java':
  }

