Vagrant::Config.run do |config|

  # Centos
  config.vm.define :test_centos6_64 do |local|
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

  config.vm.define :test_centos5_64 do |local|
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

  config.vm.define :test_centos4_64 do |local|
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
  config.vm.define :test_ubuntu1204_64 do |local|
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

  config.vm.define :test_ubuntu1104_64 do |local|
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

  config.vm.define :test_ubuntu1004_64 do |local|
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

  config.vm.define :test_ubuntu1004_32 do |local|
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
  config.vm.define :test_debian6_64 do |local|
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
  config.vm.define :test_rhel60_64 do |local|
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
  config.vm.define :test_sl6_64 do |local|
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
  config.vm.define :test_sles11sp1_64 do |local|
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


  # Solaris
  config.vm.define :test_solaris10_64 do |local|
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

end
