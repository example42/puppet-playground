# Vagrant files for a local Example42 setup 

This repository provides a Vagrant multi vm setup for testing Example42 modules on different OS

Vagrant base boxes urls have been retrieved from Internet sources.
To remove, fix or add entries please send pull request.


## INSTALLATION AND USAGE

Download to a work directory you want (here vagrant-example42): 

        git clone --recursive https://github.com/example42/vagrant-example42.git vagrant-example42

Review, if you want, the Vagrantfile in vagrant-example42 and show status

        cd vagrant-example42
        cat Vagrantfile
        vagrant status

Edit and play with the Puppet manifest applied on the boxes

        vi manifests/init.pp

See how your code behaves on the selected test box

        vagrant up test-centos6

This may take a while, the first time, to download the box.

