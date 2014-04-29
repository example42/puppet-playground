#!/bin/bash

puppet_version='3.0.2'
facter_version='1.6.17'
hiera_version='1.3.1'

useradd puppet

cd /usr/src && wget https://raw.github.com/puppetlabs/puppet/master/ext/envpuppet
cd /usr/src && git clone git://github.com/puppetlabs/puppet.git
cd /usr/src && git clone git://github.com/puppetlabs/facter.git
cd /usr/src && git clone git://github.com/puppetlabs/hiera.git

cd /usr/src/puppet && git checkout tags/${puppet_version}
cd /usr/src/facter && git checkout tags/${facter_version}
cd /usr/src/hiera  && git checkout tags/${hiera_version}

echo '/usr/src/envpuppet puppet $@' > /bin/puppet
echo '/usr/src/envpuppet facter $@' > /bin/facter
echo 'export ENVPUPPET_BASEDIR=/usr/src/' >> /etc/profile

chown vagrant:vagrant /usr/src/envpuppet
chown vagrant:vagrant /bin/puppet
chown vagrant:vagrant /bin/facter
chown -R vagrant:vagrant /usr/src/puppet
chown -R vagrant:vagrant /usr/src/facter

chmod 751 /usr/src/envpuppet
chmod 751 /bin/puppet
chmod 751 /bin/facter

# apt-get install -y augeas-tools augeas-lenses libaugeas-ruby
# gem install hiera hiera-puppet --no-ri --no-rdoc

gem list | grep hiera-file > /dev/null
if [ "x$?" == "x1" ] ; then
  gem install hiera-file
fi

gem list | grep hiera-eyaml > /dev/null
if [ "x$?" == "x1" ] ; then
  gem install hiera-eyaml
fi
