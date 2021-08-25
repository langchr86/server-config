# -*- mode: ruby -*-
# vi: set ft=ruby :

# Activate the experimental disk feature:
# $ export VAGRANT_EXPERIMENTAL="disks"

Vagrant.configure("2") do |config|

  config.vm.box = "geerlingguy/ubuntu2004"
  config.vm.box_version = "1.0.3"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--spec-ctrl", "on"]
  end


#  config.vm.define "mini" do |mini|
#    mini.vm.hostname = "lang-mini"
#    mini.vm.network "private_network", ip: "192.168.10.9"
#
#    mini.vm.provision "shell",
#        inline: "/vagrant/local-mini.sh",
#        privileged: false
#  end
#
#  config.vm.define "main" do |main|
#    main.vm.hostname = "lang-main"
#    main.vm.network "private_network", ip: "192.168.10.8"
#
#    main.vm.provision "shell",
#        inline: "/vagrant/local-main.sh",
#        privileged: false
#  end

  config.vm.define "backup" do |backup|
    backup.vm.hostname = "lang-backup"
    backup.vm.network "private_network", ip: "192.168.10.7"
    backup.vm.disk :disk, size: "6GB", name: "share_1"
    backup.vm.disk :disk, size: "6GB", name: "share_2"

    backup.vm.provision "shell",
        inline: "/vagrant/vagrant-ansible.sh playbook_backup.yml",
        privileged: false
  end
end
