server-config
=============

[![ansible-lint](https://github.com/langchr86/server-config/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/langchr86/server-config/actions/workflows/ansible-lint.yml)

Configuration of my private server infrastructure.
Completely managed by ansible and linux containers.


Overview
--------

The whole infrastructure has several purposes:

* central data storage with redundancy and change history
* automated backup solution for servers and clients
* protection of private data
* multiple services accessible only in local LAN or internet

The infrastructure consists of multiple hosts that usually are powered off
and only started if clients are available in the local LAN.
One always-on low-power server controls the other servers
and provides external available services through internet.
The following diagram gives an overview of the relevant hosts and some data flows.

![infrastructure_overview](docs/images/infrastructure_overview.png)

The following services are available:

* local file access: [samba](https://www.samba.org/)
* RAID1 and change history: [btrfs](https://btrfs.wiki.kernel.org/index.php/Main_Page)
  and [btrbk](https://github.com/digint/btrbk)
* automatic server and client backups: [rsync and rsync-daemon](https://en.wikipedia.org/wiki/Rsync)
  and [QtdSync](http://qtdtools.doering-thomas.de/)
* disk monitoring: [smartctl](https://www.smartmontools.org/)
* download manager: [jdownloader](https://jdownloader.org/)
* torrent manager: [transmission](https://transmissionbt.com/)
* dyn-dns updater: [ddclient](https://github.com/ddclient/ddclient)
* host start/stop manager: [hostcontrold](https://github.com/langchr86/hostcontrold)
* counter strike dedicated server: CS:GO and CS 1.6
* static web-server and reverse-proxy: [caddy2](https://caddyserver.com/)
* static markdown wiki: [mdwiki](http://www.mdwiki.info)
* password manager: [bitwarden](https://go.bitwarden.com/)
* multi-room audio system: [logitech media server](https://en.wikipedia.org/wiki/Logitech_Media_Server)
* central kodi DB: [sharing the library](https://kodi.wiki/view/MySQL)
  with [mariadb](https://mariadb.org/)
* low-latency voice chat: [mumble](https://www.mumble.com/)
* home automation: [homeassistant](https://www.home-assistant.io/)
  with [mosquitto MQTT](https://mosquitto.org/)


Development with Vagrant
------------------------

The whole setup can be emulated by using virtual machines managed by [Vagrant](https://www.vagrantup.com/).
Some of the usual commands are as follows:

~~~~~~
vagrant up              # create all VMs
vagrant up mini         # create only the `mini` VM specified in the `Vagrantfile`
vagrant provision mini
~~~~~~

See the [Vagrantfile](./Vagrantfile) for more information.


Real deployment
---------------

### Common setup

* Download corresponding minimal ubuntu LTS server image
* Flash USB stick with [`rufus`](https://rufus.ie/)
* Use guided/minimal installation
* Choose to partition whole primary disk with only one partition for `/`
* Install GRUB bootloader
* Select hostname corresponding to hardware setup and build year
* Create user `clang`
* Install SSH server and no desktop environment
* Remove not working apt sources: `sudo nano /etc/apt/sources.list`


###  Setup sudo

~~~
sudo su
printf "clang ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers.d/clang
exit
~~~


### set static IP on ubuntu/debian

~~~
sudo nano /etc/netplan/00-installer-config.yaml
sudo netplan apply
~~~

~~~
# This is the network config written by 'subiquity'
# Changed to static IPs by clang
network:
  version: 2
  ethernets:
    enp0s10:
      addresses:
      - 192.168.0.7/24
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1, 8.8.8.8, 1.1.1.1]
~~~


or

~~~
sudo nano /etc/network/interfaces
sudo reboot
~~~

~~~
auto enp0s5
iface enp0s5 inet static
address 192.168.0.7
netmask 255.255.255.0
gateway 192.168.0.1
dns-nameservers 192.168.0.1 8.8.8.8 1.1.1.1
~~~


### SSH Key

~~~
ssh-copy-id clang@192.168.0.7
~~~


Update system
-------------

~~~
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
~~~


Ansible
-------

Install Ansible:

~~~
sudo apt-get update
sudo apt-get install ansible -y
~~~

Create ansible vault PW file: `infra_pw`
and run specific ansible playbook launcher script, e.g.:

~~~
./backup.sh
~~~


Detail or manual steps
----------------------

[Documentation](/docs)
