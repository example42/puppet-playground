### Global vars that affect any class declaration.

# To test puppi integration uncomment below
/*
$puppi        = true
$monitor      = true
$monitor_tool = [ 'puppi' ]
*/

# General package management (not required)
  case $::osfamily {
    redhat: { include yum }
    debian: { include apt }
  }

# Default setup

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

