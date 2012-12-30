Vagrant::Config.run do |config|

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
    :Ubuntu1204_64 => {
      :box     => 'precise64',
      :box_url => 'http://files.vagrantup.com/precise64.box',
    },
    :Ubuntu1004_64 => {
      :box     => 'lucid64',
      :box_url => 'http://files.vagrantup.com/lucid64.box',
    },
    :Ubuntu1004_32 => {
      :box     => 'lucid32',
      :box_url => 'http://files.vagrantup.com/lucid32.box',
    },
    :Debian6_64 => {
      :box     => 'squeeze64',
      :box_url => 'http://puppetlabs.s3.amazonaws.com/pub/squeeze64.box',
    },
    :SuseLinux11_64 => {
      :box     => 'sles11sp1_64',
      :box_url => 'http://puppetlabs.s3.amazonaws.com/pub/sles11sp1_64.box',
    },
    :OpenSuse12_64 => {
      :box     => 'OpenSuse12_1x64_July14',
      :box_url => 'https://s3.amazonaws.com/circlejtp/OpenSuseVagrant/OpenSuse12_1x64_July14.box',
    },
  }.each do |name,cfg|
    config.vm.define name do |local|
      local.vm.box = cfg[:box]
      local.vm.box_url = cfg[:box_url]
#      local.vm.boot_mode = :gui
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
end
