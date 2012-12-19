# Example42 Puppet Playground

This repository provides a Vagrant multi vm setup where you can easily test Puppet code on different OS.

Vagrant base boxes urls have been retrieved from Internet sources like [VagrantBox.es](http://www.vagrantbox.es/).

To remove, fix or add entries please send pull requests for [Vagrantfile](https://github.com/example42/vagrant-example42/blob/master/Vagrantfile).

## INSTALLATION

Clone this repo to a work directory of your choice (here vagrant-example42): 

        git clone https://github.com/example42/vagrant-example42.git vagrant-example42
        
This creates a multi vm vagrant environment 

        cd vagrant-example42
        vagrant status

This is enough to play with Puppet in Masterless mode: default manifest is **[manifests/init.pp](https://github.com/example42/vagrant-example42/blob/master/manifests/init.pp)**, modules are in **modules/**.


## WORK WITH MODULES

You can add the modules you want in vagrant-example42/modules. For this you have various alternatives:

 **1** - If you want to **quick test Puppet resources** without using modules just add them in manifests/init.pp (see below). 


 **2** - If you want to test modules from the **Puppet Forge** you can install them with:

        puppet module install <modulename>  --modulepath modules/

  So, for example:

        puppet module install puppetlabs-apache  --modulepath modules/

 **3** - If you want to test the **NextGen Example42 modules** set you have to initialize their integration:

        git submodule init
        git submodule update

   This initializes the modules dir with the Example42 NextGen modules set, then you have to actually download all the single modules:

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

        vagrant up Test_Centos6_64

This may take a while, the first time, to download the box.

Once created the VM connect to it with:

        vagrant ssh Test_Centos6_64

To exit form the shell on the VM

        vm# exit

To restart your VM:

        vagrant reload Test_Centos6_64

To destroy and rebuild from scratch

        vagrant destroy Test_Centos6_64
        vagrant up Test_Centos6_64


## PLAY WITH PUPPET

You can test and apply code directly from the VM:

        vagrant ssh Test_Centos6_64

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

        vagrant provision Test_Centos6_64


To test the code on all the running nodes

        vagrant provision
        
## CAVEATS

Not all the Vagrant boxes have been widely tested, they have probably old versions of the VirtualBox Guest Additions and maybe 
provide not updated Vagrant configurations.

If you find errors like:

        /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile:7: undefined method `system=' for #<Vagrant::Config::VMConfig:0x1025fc5a0> (NoMethodError)

Try to remove or delete the referred file:

        mv /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile.bak

Bug filings, pull requests and suggestions via GitHub are welcomed.
