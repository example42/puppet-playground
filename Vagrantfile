Vagrant.configure("2") do |config|
  config.cache.auto_detect = true
  {
    :Centos6_64 => {
      :box     => 'centos6_64',
      :box_url => 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box',
    },
    :Centos63_64 => {
      :box     => 'centos-6.3-64bit',
      :box_url => 'http://packages.vstone.eu/vagrant-boxes/centos-6.3-64bit-latest.box',
    },
    :Centos58_64 => {
      :box     => 'centos-5.8-64bit',
      :box_url => 'http://packages.vstone.eu/vagrant-boxes/centos-5.8-64bit-latest.box',
    },
    :Ubuntu1404_64 => {
      :box     => 'trusty-server-cloudimg-amd64-vagrant-disk1.box',
      :box_url => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    },
    :Ubuntu1304_64 => {
      :box     => 'raring64',
      :box_url => 'http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box',
    },
    :Ubuntu1210_64 => {
      :box     => 'quantal64',
      :box_url => 'http://cloud-images.ubuntu.com/vagrant/quantal/current/quantal-server-cloudimg-amd64-vagrant-disk1.box',
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
        puppet.hiera_config_path = 'data/hiera.yaml'
        puppet.working_directory = '/vagrant/data'
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "init.pp"
        puppet.options = [
         '--verbose',
         '--report',
         '--show_diff',
         '--pluginsync',
         '--summarize',
#        '--evaltrace',
#        '--debug',
#        '--parser future',
        ]
      end
    end
  end
end
