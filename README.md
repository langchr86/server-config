server-config
=============

Configuration of private server infrastructure.


Common setup
------------

* Download corresponding minimal ubuntu LTS server image
* Flash USB stick with [`rufus`](https://rufus.ie/)
* Use guided/minimal installation
* Choose to partition whole primary disk with only one partition for `/`
* Install GRUB bootloader
* Select hostname corresponding to hardware setup and build year
* Create user `clang`
* Install SSH server and no desktop environment


Setup sudo
----------

~~~
sudo visudo -f /etc/sudoers.d/clang
~~~

~~~
clang ALL=(ALL) NOPASSWD: ALL
~~~


Network setup
-------------

Hostname        IP
------------    -----------

lang-backup     192.168.0.5
lang-main       192.168.0.6
lang-mini       192.168.0.8


### set static IP on debian

~~~
sudo nano /etc/netplan/00-installer-config.yaml
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
~~~

~~~
auto enp0s5
iface enp0s5 inet static
address 192.168.0.7
netmask 255.255.255.0
gateway 192.168.0.1
dns-nameservers 192.168.0.1 8.8.8.8 1.1.1.1
~~~

and then

~~~
sudo reboot
~~~


### Port forwarding

Ensure that the used listening port `23722` is available from outside NAT via TCP/UDP to Host `192.168.0.8`


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

* [lang-backup](docs/lang-backup.md)
* [lang-main](docs/lang-main.md)
* [lang-mini](docs/lang-mini.md)
