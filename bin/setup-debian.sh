#!/bin/bash
cd /root
if [ ! -f puppetlabs-release-precise.deb ] ; then 
  wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs-release-precise.deb
  apt-get update
  apt-get install -y puppet
fi

dpkg -s git || apt-get install git -y

gem list | grep hiera-file > /dev/null
if [ "x$?" == "x1" ] ; then
  gem install --no-ri --no-rdoc hiera-file
fi

gem list | grep hiera-eyaml > /dev/null
if [ "x$?" == "x1" ] ; then
  gem install --no-ri --no-rdoc hiera-eyaml
fi
