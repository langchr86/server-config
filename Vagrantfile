# -*- mode: ruby -*-
# vi: set ft=ruby :

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

    disk_count = 4
    disk_size_gb = 20
    disk_format = 'vdi'
    disk_controller = 'SCSI'

    (0..disk_count-1).each do |i|
	  disk_file = "disks/data-disk-#{i}.#{disk_format}"
	  unless File.exist?(disk_file)
	    if (i == 0)
	      vb.customize ["storagectl", :id, "--name", disk_controller, "--add", "sata"]		# create disk controller if not already existing
	    end
        vb.customize ['createhd', '--filename', disk_file, '--format', disk_format, '--size', disk_size_gb * 1024]
      end
	  vb.customize ['storageattach', :id,  '--storagectl', disk_controller, '--port', i+2, '--device', 0, '--type', 'hdd', '--medium', disk_file]
    end
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

    backup.vm.provision "shell",
        inline: "/vagrant/vagrant-ansible.sh playbook_backup.yml",
        privileged: false
  end
end
