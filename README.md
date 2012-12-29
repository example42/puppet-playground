# Puppet Playground

Welcome to the Puppet Playground where you can play with Puppet and also do some serious stuff.

It's basically:

  - a Vagrant multi vm environment (*) optimized, by default, for Puppet testing on different OS

  - a play command that makes things easier and installs appliances (toasters) based on librarian-puppet


(*) Vagrant base boxes urls have been retrieved from Internet sources like [VagrantBox.es](http://www.vagrantbox.es/).
To remove, fix or add entries please send pull requests for [Vagrantfile](https://github.com/example42/puppet-playground/blob/master/Vagrantfile).


## Installation

Clone this repo to a work directory of your choice (here puppet-playground): 

    git clone https://github.com/example42/puppet-playground.git puppet-playground
    
Move into the newly created directory, from this point all commands are relative to this path:

    cd puppet-playground

What you have is a normal Vagrant multi VM environment:

    vagrant status

This is enough to play with Puppet in Masterless mode:
default manifest is **[manifests/init.pp](https://github.com/example42/puppet-playground/blob/master/manifests/init.pp)**,
modules are in **modules/**.

To show the status of the Puppet Playground

    ./play status

## Install modules and toasters

You can add the modules you want in puppet-playground/modules. For this you have various alternatives:

  **1** - If you want to **quick test Puppet resources** without using modules just write your Puppet code in **manifests/init.pp** (see below). 

    vi manifests/init.pp

  **2** - If you want to test modules from the **Puppet Forge** you can install them with:

    puppet module install <modulename>  --modulepath modules/

So, for example you can type:

    puppet module install puppetlabs-apache  --modulepath modules/

which is exactly the same of:

    ./play forge install puppetlabs-apache

  **3** - If you want to test the NextGen Example42 modules you can just type
 
    ./play setup example42

This initializes the modules dir with the Example42 NextGen modules, directly cloned from GitHub.

  **4** - If you want to **test your own modules** just place them in the modules dir, one module per directory, as you would do in your puppet master.

  **5** - If you want to **play with toasters**, install **librarian-puppet toasters** and use the play command (more details below) 

    gem install librarian-puppet
    ./play list
    ./play install <toaster>
  
  
## Vagrant Usage

Whatever method you use to populate the modules’ directory and the default manifest file, you can test your Puppet code on the running Vagrant boxes. First, review (if you want) the default Vagrantfile provided by puppet-playground. You will see a normal MultiVM setup with masterless Puppet integration

    cat Vagrantfile

You can see the available VMs with:

    vagrant status

Expect an output like the one below:

    Current VM states:
 
    Test_Centos6_64          not created
    Test_Ubuntu1204_64       not created
    Test_Ubuntu1004_64       not created
    Test_Ubuntu1004_32       not created
    Test_Debian6_64          not created
    Test_SuseLinux11_64      not created
    Test_OpenSuse12_64       not created
    ToFix_Solaris10_64       not created
    ToFix_FreeBSD9_64        not created
    ToFix_OpenBSD5_64        not created
    ToFix_Centos5_64         not created
    ToFix_Centos5_32         not created
    ToFix_Centos4_64         not created
    ToFix_Ubuntu1104_64      not created
    ToFix_RedHat6_64         not created
    ToFix_ScientificLinux6_64not created

Boxes with the Test_ prefix have successfully been tested on an updated Vagrant/VirtualBox installation, the ones with ToFix_ have had some problem for a smooth automated Puppet run. This list is going to be updated and corrected.

You can run any of the provided Vagrant boxes with:

    vagrant up Test_Centos6_64

This may take some minutes, the first time you run it, to download the base box from the Internet.

Once created the VM, you can connect to it with:

    vagrant ssh Test_Centos6_64

Note that at the moment headless mode is disabled, so you’ll see the VirtualBox console window pop up. If you encounter problems with ssh, you should be able to login with user ‘vagrant’ and password ‘vagrant’ and then sudo -s.

To exit from the shell on the VM

    vm# exit

To restart your VM:

    vagrant reload Test_Centos6_64

To destroy and rebuild from scratch:

    vagrant destroy Test_Centos6_64
    vagrant up Test_Centos6_64


## Work with Puppet

Once you see that Vagrant is doing its job, you can start to play with Puppet code: edit the default Puppet manifest applied on the boxes:

    vi manifests/init.pp

This is your test playground: add resources, use modules, declare classes…
You can place simple resources like:

    file { 'motd':
      path    => '/etc/motd',
      content => 'Hi there',
    }

Or use modules you’ve previously placed in the modules/ dir.

    class { 'wordpress':
    }

Or whatever Puppet code you might want to apply.

If you need to provide custom files, the sanest approach is to place them in the templates directory of a custom “site” module (call it ‘site’ or however you want) and refer to it using the content parameter:

    file { 'motd':
      path    => '/etc/motd',
      content => template('site/motd'),
    }

This will populate /etc/motd with the template placed in **puppet-playground/modules/site/templates/motd**.

To test your code’s changes on a single node, you have two alternatives:

From your host, in the puppet-playground directory:

    vagrant provision Test_Centos6_64

From the VM you have created:

    vagrant ssh Test_Centos6_64

Once you’ve logged in the VM, get the superpowers and run Puppet:

    vm# sudo -s
    vm# puppet apply -v --modulepath '/tmp/vagrant-puppet/modules-0' --pluginsync /tmp/vagrant-puppet/manifests/init.pp

You can also edit the manifests file both from your host or inside a VM:

From your host (having your cwd in puppet-playground directory):

    vi manifests/init.pp

From the VM (once connected via ssh):

    vm# sudo -s
    vm# cd /tmp/vagrant-puppet/
    vm# vi manifests/init.pp

If you have more VMs active you can test your changes on all of them with a simple:

    vagrant provision


## Play in the Playground

Many of the activities described before can be done and automated with the play command.
It manages the Puppet Playground, namely the default manifest, located in **manifests/init.pp** , the **Puppetfile** and the content of the **modules/** directory.

To show the status of the playground

    ./play status

To show the available toasters for ./play install:

    ./play list

To install a specific toaster via librarian-puppet :

    ./play install garethr-riemann

To import an external toaster (must have Puppetfile and init.pp, might have a custom Vagrantfile)

    ./play import /home/al/vagrant/my-appliance

To run the current playground (same as vagrant provision)

    ./play run

To cleanup the whole playground (Beware all the existing changes will be wiped off)

    ./play clean

To run puppi commands on all the active boxes (note: Puppi must included in the playground)

    ./play puppi check
    ./play puppi info packages

Basically **./play puppi $*** does a **puppi $*** on all the running VMs

Similarly you can run puppet module commands:

    ./play forge list
    ./play forge search apt
    ./play forge install puppetlabs-apt

Here with **./play forge $*** you execute **puppet module $* --modulepath modules/**

To reinstall the default Vagrantfile (might be overrided by toasters imported or installed, if they provide it):

    ./play setup default

To wipe off and inizialize the modules/ directory with NextGen Example42 modules

    ./play setup example42


## Write you own toaster

A toaster is just a **directory **that contains these files:

 1 - The **default manifest** with the Puppet code that is needed for your appliance setup.
   Here you don't need to define nodes, just variables (they are treated as top scope) and resources.  

    init.pp

 2 - A [Librarian Puppet](http://librarian-puppet.com/) formatted **Puppetfile**

    Puppetfile

 3 - An **optional** custom **Vagrantfile** (with tested VMs are relevant settings)

    Vagrantfile

To import your toaster in the Playground just type

    ./play import /path/to/my/toaster

But if you think that it can be useful to others, please add it to the [toasters] directory (https://github.com/example42/puppet-playground/blob/master/toasters/) and make a pull request: your toaster will be available to everybody out of the box .


## Caveats

### Broken Vagrant Boxes

Not all the Vagrant boxes have been widely tested, they have probably old versions of the VirtualBox Guest Additions and maybe 
provide not updated Vagrant configurations.

If you find errors like:

    /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile:7: undefined method `system=' for #<Vagrant::Config::VMConfig:0x1025fc5a0> (NoMethodError)

Try to remove or delete the referred file:

    mv /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile.bak

Some boxes (currently the ones with the ToFix prefix) are not fully working for Puppet provisioning. 


### Modules directory

The cohexistence of different ways to manage the modules directory (with puppet module tool, with the Example42 NextGen git repo, with custom modules r via librarian-puppet) may create inconsistent status, if you mix these methods.

Start from an empty modules dir to have a clean setup good for every use.


## Support and Bugs

Please submit bug filings, pull requests and suggestions via GitHub.

This Puppet Playground might become more and more useful if:

  - More Working vagrant Boxes are provided for different OS. You can add them to [Vagrantfile](https://github.com/example42/puppet-playground/blob/master/Vagrantfile)

  - New toasters are provided that use different modules sets with librarian-puppet. Added them to [toasters] directory (https://github.com/example42/puppet-playground/blob/master/toasters/)

  - New ideas and integrations are delivered (ie: Travis, Jenkins for automatic checks of deployed toasters)

Any contribution is very welcomed: the Playground is funnier if there are more kids around ;-)

