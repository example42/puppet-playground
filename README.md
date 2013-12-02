# Puppet Playground

Welcome to the Puppet Playground where you can play with Puppet and also do some serious stuff.

It's basically:

  - a Vagrant multi vm environment (*) optimized, by default, for Puppet testing on different OS

  - a play command that makes things easier and installs appliances (toasters) based on librarian-puppet


(*) Vagrant base boxes urls have been retrieved from Internet sources like [VagrantBox.es](http://www.vagrantbox.es/).
To remove, fix or add entries please send pull requests for [Vagrantfile](https://github.com/example42/puppet-playground/blob/master/Vagrantfile).


## Installation

You need **[VirtualBox](https://www.virtualbox.org/)** , **[Vagrant](http://www.vagrantup.com/)** and **Git** installed on your system.

Then you can just clone this repo to a work directory of your choice (here puppet-playground):

    git clone https://github.com/example42/puppet-playground.git puppet-playground

and move into the newly created directory.

    cd puppet-playground

Note: from this point all commands are relative to this path.

To use toasters you also need **[Librarian Puppet](https://github.com/rodjek/librarian-puppet)**, you can install it as a gem:

    gem install librarian-puppet

The default Vagrantfile uses the cachier plugin, you can install it with:

    vagrant plugin install vagrant-cachier


## Basic usage
Once you have moved into the playground you have at disposal various commands:

  **1** - **Vagrant**. Show available subcommands with:

    vagrant

  Show the Vagrant status with:

    vagrant status


  **2** - Puppet Playground's **play** command. Show available actions with:

    ./play

  Eventually add the current puppet-playground dir to PATH:

    PATH=$PATH:`pwd` # This command is run by set_path.sh

  Show the status of the Puppet Playground with:

    ./play status

  **3** - **Librarian Puppet**. Show available tasks with:

    librarian-puppet


## Install modules and toasters

The Puppet code is placed in 2 locations of the playground:

- Default manifest is **manifests/init.pp**, here you play with your Puppet code.
  You can test native resources or use resources and classes provided by modules.

- Modules are in **modules/**, you can populate this directory in different ways:

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

  This initializes the modules dir with the Example42 modules set, directly cloned from GitHub.

**4** - If you want to **test your own modules** just place them in the modules dir, one module per directory, as you would do in your puppet master.

**5** - If you want to **play with toasters**, install **librarian-puppet toasters** and use the play command (more details below)

      ./play list
      ./play install <toaster>


## Vagrant Usage

Whatever method you use to populate the modules’ directory and the default manifest directory, you can test your Puppet code on the running Vagrant boxes. First, review (if you want) the default Vagrantfile provided by puppet-playground. You will see a normal MultiVM setup with masterless Puppet integration

    cat Vagrantfile

You can see the available VMs with:

    vagrant status

Expect an output like the one below:

    Current VM states:

    Centos6_64               not created (virtualbox)
    Centos63_64              not created (virtualbox)
    Centos58_64              not created (virtualbox)
    Ubuntu1304_64            not created (virtualbox)
    Ubuntu1210_64            not created (virtualbox)
    Ubuntu1204_64            not created (virtualbox)
    Ubuntu1004_64            not created (virtualbox)
    Ubuntu1004_32            not created (virtualbox)
    Debian7_64               not created (virtualbox)
    Debian6_64               not created (virtualbox)
    SuseLinux11_64           not created (virtualbox)
    OpenSuse12_64            not created (virtualbox)
    OpenBSD53_64             not created (virtualbox)

Note that this list is going to be updated and corrected.

You can run any of the provided Vagrant boxes with:

    vagrant up Centos6_64

This may take some minutes, the first time you run it, to download the base box from the Internet.

Once created the VM, you can connect to it with:

    vagrant ssh Centos6_64

Note that at the moment headless mode is disabled, so you’ll see the VirtualBox console window pop up. If you encounter problems with ssh, you should be able to login with user ‘vagrant’ and password ‘vagrant’ and then sudo -s.

To exit from the shell on the VM

    vm# exit

To restart your VM:

    vagrant reload Centos6_64

To destroy and rebuild from scratch:

    vagrant destroy Centos6_64
    vagrant up Centos6_64


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

    vagrant provision Centos6_64

From the VM you have created:

    vagrant ssh Centos6_64

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
It manages the Puppet Playground: the **Vagrantfile**, the **Puppetfile** and the content of the **manifests** and **modules** directories.

To show the status of the playground

    ./play status

To show the available toasters for ./play install:

    ./play list

To install a specific toaster via librarian-puppet :

    ./play install example42-tomcat

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

A toaster is just a **directory** that contains these files:

 1 - The **manifests** directory with the Puppet code that is needed for your appliance setup.
 By default the provided Vagrantfile uses manifests/init.pp as main manifest, but you can use a different name, al long as it's coherent with your Vagrantfile's puppet.manifest_file (if possibile keep init.pp, for easier cross testing with different Vagrant environments)

    manifests/

 2 - A [Librarian Puppet](http://librarian-puppet.com/) formatted **Puppetfile**

    Puppetfile

 3 - An **optional** custom **Vagrantfile** (with tested VMs and custom settings)

    Vagrantfile

To import your toaster in the Playground just type

    ./play import /path/to/my/acme-mailscanner/

But if you think that it can be useful to others, please add it to the [toasters directory](https://github.com/example42/puppet-playground/blob/master/toasters/) and make a pull request: your toaster will be available to everybody out of the box with a simple:

    ./play install acme-mailscanner


## Example42 integrations

The Puppet Playground has started as a Vagrant environment where to test [Example42](http://www.example42.com) modules, as you can see, you can actually use it to test whatever kind of Puppet code and modules. Still the are some "extras" that you can have, when using Example42 modules.

As seen, you can populate the modules dir with the [Example42 NextGen](https://github.com/example42/puppet-modules-nextgen) modules with

    ./play setup example42

You can also test a more restricted set of modules with the provided Example42 toasters

    ./play install example42-jboss

And you can play with puppi and automatic monitoring if you use Example42 modules or toasters.

In the manifest/init.pp be sure to have these topscope variables (you can pass the same values as class parameters):

    $puppi        = true
    $monitor      = true
    $monitor_tool = [ 'puppi' ]

Note that on RedHat and derivatives you also need the EPEL repository installed.
You can provided it with Example42's yum module:

    include yum

Once you've run puppet on the active boxes you can do interesting things with puppi, like verifying if the services provided by Puppet are actually up and running:

    ./play puppi check

or, deploy a custom application (configured with puppi in your manifests/init.pp) on all the running Vagrant boxes:

    ./play puppi deploy my_app

or view from them realtime infos like:

    ./play puppi info network


## Caveats and things to know

### Broken Vagrant Boxes

Not all the Vagrant boxes have been widely tested, they have probably old versions of the VirtualBox Guest Additions and maybe
provide not updated Vagrant configurations.

If, during a vagrant up you find errors like:

    /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile:7: undefined method `system=' for #<Vagrant::Config::VMConfig:0x1025fc5a0> (NoMethodError)

Try to remove or delete the referred file:

    mv /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile /Users/al/.vagrant.d/boxes/solaris10_64/include/_Vagrantfile.bak

Some boxes (currently the ones with the ToFix prefix) are not fully working for Puppet provisioning: leave them off if they block serial operations on all the active VMs.


### Modules directory

The cohexistence of different ways to manage the modules directory (with puppet module tool, with the Example42 NextGen git repo, with custom modules r via librarian-puppet) may create inconsistent status, if you mix these methods.

Start from an empty modules dir to have a clean setup good for every use.


### Vagrantfile

Currently a default Vagrantfile is provided but can be overrided by a different one provided by a toaster.

The idea is to keep the default one multi-purpose, multi-os and well tested and leave the option to provide alternative Vagrantfiles via toasters.

If you install or import a toaster that provides a custom Vagrantfile your running VMs will "disappear" from the playground and the new one(s) of the toaster will show up.

Note that the active "old" VMs are still running and you can manage them via vagrant only reinstallling the relevant Vagrantfile on the Playground.

To reinstall on the Playground the default Vagrantfile (note that this command does not change the content of modules/ Puppetfile and manifests/):

    ./play setup default

To (re)install on the Playground a Vagrantfile from a toaster (this will override also the Puppet configurations)

    ./play install toaster_name


## Support and Bugs

Please submit bug filings, pull requests and suggestions via GitHub.

This Puppet Playground might become more and more useful if:

  - More Working vagrant Boxes are provided for different OS. You can add them to [Vagrantfile](https://github.com/example42/puppet-playground/blob/master/Vagrantfile)

  - New toasters are provided that use different modules sets with librarian-puppet. Added them to [toasters] directory (https://github.com/example42/puppet-playground/blob/master/toasters/)

  - New ideas and integrations are delivered (ie: Travis, Jenkins for automatic checks of deployed toasters)

Any contribution is very welcomed: the Playground is funnier if there are more kids around ;-)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/example42/puppet-playground/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

