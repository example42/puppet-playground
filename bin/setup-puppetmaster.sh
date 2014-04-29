#!/bin/bash
# Based on https://github.com/gehel/vagrant-vms/blob/master/vagrant-puppetmaster/init.sh

# Set here the default branch to use for first puppet apply
default_branch='nodeless'
DNS_DOMAIN='example42.com'
DNS_ALT_NAMES="puppet01,puppet02,puppet01.${DNS_DOMAIN},puppet02.${DNS_DOMAIN}"

echo '## r10k deploy'
export PATH=$PATH:/opt/ruby/bin

gem list | grep r10k > /dev/null
if [ "x$?" == "x1" ] ; then
  gem install r10k
fi

r10k deploy environment --config /vagrant/r10k.yaml 

service puppetmaster stop

echo '## CA setup'
# Uncomment to clean up all certificate
# puppet cert clean --all `hostname -f`
[ -f /var/lib/puppet/ssl/ca/ca_pub.pem ] || puppet ca generate --dns-alt-names ${DNS_ALT_NAMES} puppet

# service puppetmaster start
# service puppetmaster stop

echo '## puppet apply'
puppet apply --modulepath=/etc/puppet/environments/${default_branch}/modules:/etc/puppet/environments/${default_branch}/site \
             --hiera_config=/etc/puppet/environments/${default_branch}/etc/hiera.yaml \
             /etc/puppet/environments/${default_branch}/manifests/site.pp

echo '## puppet agent'
sleep 10
puppet agent -t

