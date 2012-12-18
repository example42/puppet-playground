# Vagrant setup of an Example42 testlab 

This repository provides a Vagrant multi vm setup for testing Example42 modules on different OS

Vagrant base boxes urls have been retrieved from Internet sources.
To remove, fix or add entries please send pull request.

## INSTALLATION AND USAGE

Download to a work directory you want (here vagrant-example42): 

        git clone --recursive https://github.com/example42/vagrant-example42.git vagrant-example42
        
This creates the a full vagrant environment with Example42 modules to test locally (takes time to complete)

        cd vagrant-example42

Initialize and update Example42 git submodules (takes time)

        cd modules
        git submodule init
        git submodule update

Review, if you want, the Vagrantfile in vagrant-example42 and show status

        cat Vagrantfile
        vagrant status

Edit and play with the Puppet manifest applied on the boxes

        vi manifests/init.pp
        
This is your test ground, add resources, use modules, declare classes... 

See how your code behaves on the selected test box:

        vagrant up test_centos6

This may take a while, the first time, to download the box.

Once created the VM connect with:

        vagrant ssh test_centos6

To restart your box:

        vagrant reload test_centos6

To destroy and rebuild from scratch

        vagrant destroy test_centos6
        vagrant up test_centos6


You can work and run puppet apply directly from the test box:

        vagrant ssh test-centos6

From a shell on the VM get the superpowers and move to vagrant configs:

        sudo -s
        cd /tmp/vagrant-puppet/

To try some Puppet code edit the manifest file:

        vi manifests/init.pp
        
And see what happens when you apply it:

        puppet apply -v --modulepath '/tmp/vagrant-puppet/modules-0' --pluginsync /tmp/vagrant-puppet/manifests/init.pp

