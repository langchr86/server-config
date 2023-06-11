# -*- mode: ruby -*-
# vi: set ft=ruby :

# Activate the experimental disk feature:
ENV["VAGRANT_EXPERIMENTAL"] = "disks"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"
  config.vm.box_version = "20230608.0.0"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--spec-ctrl", "on"]
  end


  config.vm.define "claudia" do |claudia|
    claudia.vm.hostname = "vm-claudia"
    claudia.vm.network "private_network", ip: "192.168.10.11"
    claudia.vm.network "forwarded_port", guest: 80, host: 80
    claudia.vm.network "forwarded_port", guest: 443, host: 443
    claudia.vm.disk :disk, size: "8GB", name: "pool-main"
    claudia.vm.disk :disk, size: "8GB", name: "daten-backup"

    claudia.vm.provision "shell",
        inline: "/vagrant/vagrant-ansible.sh playbook_claudia.yml",
        privileged: false
  end
end
