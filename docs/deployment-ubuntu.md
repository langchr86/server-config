Deployment with Ubuntu
======================


### BIOS/UEFI

* Enable `Power On` after power loss
* Disable unused LAN adapters
* Enable WOL and allow to boot from USB device
  * only if USB LAN adapter is used
  * only if this host is controlled by WOL

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


###  Setup passwordless sudo

This can be used for initial setup but should be removed afterward.

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


Wipe existing filesystems
-------------------------

~~~
sudo wipefs -a /dev/sdX
# or
sudo dd if=/dev/zero of=/dev/sdX bs=512 count=1
~~~


Ansible
-------

Install Ansible:

~~~
sudo apt-get update
sudo apt-get install --yes software-properties-common python3 python3-passlib
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install --yes ansible
~~~

Run specific ansible playbook launcher script, e.g.:

~~~
./backup.sh
~~~
