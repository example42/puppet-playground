
Exec { path => ["/usr/bin", "/usr/sbin", "/bin"] }

package {"telnet":  ensure => present; }
import 'hosts/*.pp'
import 'classes/*.pp'
