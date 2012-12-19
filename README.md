# Example42 Puppet Playground

This repository provides a Vagrant multi vm setup where you can easily test Puppet code on different OS.

Vagrant base boxes urls have been retrieved from Internet sources.

To remove, fix or add entries please send pull requests for [Vagrantfile]().

## INSTALLATION

Clone this repo to a work directory of your choice (here vagrant-example42): 

        git clone https://github.com/example42/vagrant-example42.git vagrant-example42
        
This creates the a multi vm vagrant environment 

        cd vagrant-example42
        vagrant status

This is enough to play with Puppet.


## WORK WITH MODULES

You can add the modules you want in vagrant-example42/modules. For this you have various alternatives:

 **1** - If you want to **quick test code** just add resources in manifeests/init.pp (see below). 


 **2** - If you want to test modules from the **Puppet Forge** you can install them with:

        puppet module install puppetlabs-apache  --modulepath modules/

 **3** - If you want to test the **NextGen Example42 modules** set you have to initialize its submodules (it takes some minutes)

        git submodule init
        git submodule update

   This initializes the modules dir with Example42 modules, then you have to actually download all the single modules:

        cd modules
        git submodule init
        git submodule update

  **4** - If you want to **test your own modules** just place them in the modules dir
  
  
## USAGE

Review, if you want, the Vagrantfile in vagrant-example42 and show the available OS

        cat Vagrantfile
        vagrant status

Edit and play with the Puppet manifest applied on the boxes

        vi manifests/init.pp
        
This is your test ground, add resources, use modules, declare classes... 

For sample code that uses Example42 modules, look at the other files in manifest/*.pp.

See how your code behaves on the selected test box:

        vagrant up test_centos6

This may take a while, the first time, to download the box.

Once created the VM connect to it with:

        vagrant ssh test_centos6

To exit form the shell on the VM

        vm# exit

To restart your VM:

        vagrant reload test_centos6

To destroy and rebuild from scratch

        vagrant destroy test_centos6
        vagrant up test_centos6


## PLAY WITH PUPPET

You can test and apply code directly from the VM:

        vagrant ssh test-centos6

From a shell on the VM get the superpowers and move to vagrant configs:

        vm# sudo -s
        vm# cd /tmp/vagrant-puppet/

To try some Puppet code edit the manifest file:

        vm# vi manifests/init.pp
        
You can work on it both from your system and the VM.

On your system is in vagrant-example42/manifests/init.pp

On the VM is mounted on /tmp/vagrant-puppet/manifests/init.pp 

From the VM you can run a **test** with:

        vm# puppet apply -v --modulepath '/tmp/vagrant-puppet/modules-0' --pluginsync /tmp/vagrant-puppet/manifests/init.pp

From your host:

        vagrant provision test_centos6


To test the code on all the running nodes

        vagrant provision
        
