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

  class { 'java':
  }

  class { 'tomcat':
  }

