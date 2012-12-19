Vagrant::Config.run do |config|

  # Centos
  config.vm.define :Test_Centos6_64 do |local|
    local.vm.box = "centos6_64"
    local.vm.boot_mode = :gui
    local.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "init.pp"
      puppet.module_path = "modules"
      puppet.options = [
      '--verbose',
#      '--debug',    
      ]
    end
  end

  config.vm.define :Test_Centos5_64 do |local|
    local.vm.box = "centos5_64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/centos5_64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_Centos5_32 do |local|
    local.vm.box = "centos_56_32"
    local.vm.box_url = "http://yum.mnxsolutions.com/vagrant/centos_56_32.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_Centos4_64 do |local|
    local.vm.box = "centos4_64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/centos4_64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end


  # Ubuntu
  config.vm.define :Test_Ubuntu1204_64 do |local|
    local.vm.box = "precise64"
    local.vm.box_url = "http://files.vagrantup.com/precise64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_Ubuntu1104_64 do |local|
    local.vm.box = "natty64"
    local.vm.box_url = "http://dl.dropbox.com/u/7490647/talifun-ubuntu-11.04-server-amd64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_Ubuntu1004_64 do |local|
    local.vm.box = "lucid64"
    local.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_Ubuntu1004_32 do |local|
    local.vm.box = "lucid32"
    local.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end


  # Debian
  config.vm.define :Test_Debian6_64 do |local|
    local.vm.box = "squeeze64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/squeeze64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end


  # RedHat
  config.vm.define :Test_RedHat6_64 do |local|
    local.vm.box = "rhel60_64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/rhel60_64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end


  # Scientific Linux
  config.vm.define :Test_ScientificLinux6_64 do |local|
    local.vm.box = "sl6_64"
    local.vm.box_url = "http://lyte.id.au/vagrant/sl6-64-lyte.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end


  # Suse Linux
  config.vm.define :Test_SuseLinux11_64 do |local|
    local.vm.box = "sles11sp1_64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/sles11sp1_64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_OpenSuse12_64 do |local|
    local.vm.box = "vagrant-opensuse-121-64"
    local.vm.box_url = "https://transfert.inria.fr/fichiers/42187e68fc6312db6856f07e651cd475/vagrant-opensuse-121-64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end
  # Solaris
  config.vm.define :Test_Solaris10_64 do |local|
    local.vm.box = "solaris10_64"
    local.vm.box_url = "http://puppetlabs.s3.amazonaws.com/pub/solaris10_64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  # *BSD
  config.vm.define :Test_FreeBSD9_64 do |local|
    local.vm.box = "freebsd_amd64_zfs"
    local.vm.box_url = "https://github.com/downloads/xironix/freebsd-vagrant/freebsd_amd64_zfs.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

  config.vm.define :Test_OpenBSD5_64 do |local|
    local.vm.box = "openbsd50_amd64"
    local.vm.box_url = "https://github.com/downloads/stefancocora/openbsd_amd64-vagrant/openbsd50_amd64.box"
    local.vm.boot_mode = :gui
    local.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "init.pp"
      puppet.options = [
      '--verbose',
#      '--debug',
      ]
    end
  end

end
