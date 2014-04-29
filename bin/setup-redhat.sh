#!/bin/bash
cd /root
rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install -y puppet
yum install -y rubygems

gem list | grep hiera-file
if [ "x$?" == "x1" ] ; then
  gem install --no-ri --no-rdoc hiera-file
fi

gem list | grep hiera-eyaml
if [ "x$?" == "x1" ] ; then
  gem install --no-ri --no-rdoc hiera-eyaml
fi
