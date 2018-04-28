# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "generic/debian9"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.define "debian9-nginx"
  config.vm.hostname = "debian9-nginx"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.network "public_network", bridge: "langrill.local"
  
  config.vm.provider "hyperv" do |h|
    h.vmname = "debian9_nginx"
    h.differencing_disk = true
    h.vlan_id = 5
    h.cpus = 2
    h.memory = 1024
  end
  
  config.vm.provision "resources", type: "file", source: "resources", destination: "/tmp/resources"
  config.vm.provision "bootstrap", type: "shell", path: "bootstrap.sh"
  config.vm.provision :reload
  config.vm.provision "index.html", type: "file", source: "index.html", destination: "/tmp/index.html"
  config.vm.provision "nginx-setup", type: "shell", path: "nginx-setup.sh"
  
end
