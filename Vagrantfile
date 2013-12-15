Vagrant.configure("2") do |config|
  config.cache.auto_detect = true
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    # v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end

  {
    :Centos6 => {
      :box     => 'centos-64-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box',
    },
    :Centos5 => {
      :box     => 'centos-59-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-59-x64-vbox4210.box',
    },
    :Ubuntu1204 => {
      :box     => 'ubuntu-server-12042-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box',
    },
    :Ubuntu1004 => {
      :box     => 'ubuntu-server-12042-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box',
    },
    :Debian7 => {
      :box     => 'debian-70rc1-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box',
    },
    :Debian6 => {
      :box     => 'debian-607-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vbox4210.box',
    },
    :SuseLinux11 => {
      :box     => 'sles-11sp1-x64-vbox4210',
      :box_url => 'http://puppet-vagrant-boxes.puppetlabs.com/sles-11sp1-x64-vbox4210.box',
    },
    :OpenSuse12_64 => {
      :box     => 'OpenSuse12_1x64_July14',
      :box_url => 'https://s3.amazonaws.com/circlejtp/OpenSuseVagrant/OpenSuse12_1x64_July14.box',
    },
    :OpenBSD53_64 => {
      :box     => 'OpenBSD53_64',
      :box_url => 'https://dl.dropboxusercontent.com/u/12089300/VirtualBox/openbsd53_amd64_vagrant12.box',
    },
  }.each do |name,cfg|
    config.vm.define name do |local|
      local.vm.box = cfg[:box]
      local.vm.box_url = cfg[:box_url]
#      local.vm.boot_mode = :gui
      local.vm.host_name = ENV['VAGRANT_HOSTNAME'] || name.to_s.downcase.gsub(/_/, '-').concat(".example42.com")
      local.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "init.pp"
        puppet.options = [
         '--verbose',
         '--report',
         '--show_diff',
         '--pluginsync',
#        '--debug',
#        '--parser future',
        ]
      end
    end
  end
end
