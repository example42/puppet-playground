# Example42 Test Lab - Vagrant based 

This repository provides a Vagrant multi vm setup for testing Example42 modules on different OS

Vagrant base boxes urls have been retrieved from Internet sources.

To remove, fix or add entries please send pull requests for [Vagrantfile]().

## INSTALLATION

Clone this repo to a work directory of your choice (here vagrant-example42): 

        git clone --recursive https://github.com/example42/vagrant-example42.git vagrant-example42
        
This creates the a multi vm vagrant environment 

        cd vagrant-example42
        vagrant status

This is enough to play with Puppet code (see below). 

If you want to test the NextGet Example42 modules set you have to initialize its submodules (takes time)

        cd modules
        git submodule init
        git submodule update


## USAGE

Review, if you want, the Vagrantfile in vagrant-example42 and show the available OS

        cat Vagrantfile
        vagrant status

Edit and play with the Puppet manifest applied on the boxes

        vi manifests/init.pp
        
This is your test ground, add resources, use modules, declare classes... 

See how your code behaves on the selected test box:

        vagrant up test_centos6

This may take a while, the first time, to download the box.

Once created the VM connect to it with:

        vagrant ssh test_centos6

To exit form the shell on the VM

        exit

To restart your VM:

        vagrant reload test_centos6

To destroy and rebuild from scratch

        vagrant destroy test_centos6
        vagrant up test_centos6


## PLAY WITH PUPPET

You can test and apply code directly from the VM:

        vagrant ssh test-centos6

From a shell on the VM get the superpowers and move to vagrant configs:

        sudo -s
        cd /tmp/vagrant-puppet/

To try some Puppet code edit the manifest file:

        vi manifests/init.pp
        
You can work on it both from your system and the VM.

On your system is in vagrant-example42/manifests/init.pp

On the VM is mounted on /tmp/vagrant-puppet/manifests/init.pp 

From the VM you can run a **test** with:

        puppet apply -v --modulepath '/tmp/vagrant-puppet/modules-0' --pluginsync /tmp/vagrant-puppet/manifests/init.pp

From your host:

        vagrant provision test_centos6


To test the code on all the running nodes

        vagrant provision
        
