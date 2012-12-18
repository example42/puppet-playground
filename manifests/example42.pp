# Testing Example42 stuff

# Enable puppi local monitoring
$monitor = true
$monitor_tool = 'puppi'


class { 'wordpress':
}

case $::osfamily {
  'redhat': { include yum }
  'debian': { include atp }
}
