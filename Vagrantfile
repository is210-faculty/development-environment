# -*- mode: ruby -*-
# vi: set ft=ruby :

$ssh_script = <<SCRIPT
mkdir -p ~/.ssh
chmod -R go-rwx ~/.ssh
chmod go-rwx /vagrant/.vagrant/machines/default/virtualbox/private_key
ssh-keygen -y -f /vagrant/.vagrant/machines/default/virtualbox/private_key | tee -a ~/.ssh/authorized_keys
SCRIPT

# The git repo is missing the 'data' directory that will become the user's
# home folder. Create it if it doesn't yet exist.
Dir.mkdir("data") unless File.exists?("data")

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # vagrantup.com

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty32"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: '127.0.0.1'

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 2048
  end

  # Mount our sync'ed folders
  config.vm.synced_folder "data", "/home/vagrant/"
  config.vm.synced_folder "salt/root", "/srv/salt/"

  # Add some files to the vagrant user's Desktop / home folder
  config.vm.provision "file", source: "bootstrap/vagrant", destination: "/home/"

  # Rebuild the pubkey from the private one since we overwrite it with mount
  config.vm.provision "shell", inline: $ssh_script, privileged: false

  # Main vm provisioning via salt
  config.vm.provision :salt do |salt|

    salt.bootstrap_options = "-P -c /tmp" # Vagrant issue #6029 and #5973
    salt.install_master = false
    salt.install_type = "stable"
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = "debug"

  end

  # Lightdm (gui) won't be started on provisioning without this
  config.vm.provision "shell", inline: "service lightdm start"

end
