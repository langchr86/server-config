# -*- mode: ruby -*-
# vi: set ft=ruby :

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


  config.vm.define "main" do |main|
    main.vm.hostname = "vm-main"
    main.vm.network "private_network", ip: "192.168.10.6"
    #main.vm.network "forwarded_port", guest: 53, host: 53       # adguard
    main.vm.network "forwarded_port", guest: 3000, host: 3000   # adguard
    main.vm.network "forwarded_port", guest: 80, host: 80       # caddy
    main.vm.network "forwarded_port", guest: 443, host: 443     # caddy
    main.vm.disk :disk, size: "8GB", name: "share_1"
    main.vm.disk :disk, size: "8GB", name: "share_2"
    main.vm.disk :disk, size: "8GB", name: "share_3"

    main.vm.provision "shell",
        inline: "/vagrant/vagrant-ansible.sh playbook_main.yml",
        privileged: false
  end

  config.vm.define "backup" do |backup|
    backup.vm.hostname = "vm-backup"
    backup.vm.network "private_network", ip: "192.168.10.5"
    backup.vm.disk :disk, size: "6GB", name: "share_1"
    backup.vm.disk :disk, size: "6GB", name: "share_2"

    backup.vm.provision "shell",
        inline: "/vagrant/vagrant-ansible.sh playbook_backup.yml",
        privileged: false
  end
end
