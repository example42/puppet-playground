include riemann
include riemann::dash::sample
class { 'riemann::dash': config_file => '/etc/riemann-dash.rb' }
include riemann::tools
