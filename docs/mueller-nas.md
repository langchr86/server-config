mueller-nas
===========


## Prepare backup HDD

* Format on Windows PC with NTFS.
* Use the label `backup`


## Install armbian

* Download LTS ubuntu 24.04 noble from [Armbian - Odroid XU4 / HCx](https://www.armbian.com/odroid-xu4/)
* Flash SD-Card
* Boot and watch LEDs on Ethernet port. Left one is 100MBit and right one is 1000MBit.
  Blue LED static shows bootloader active and blinking running kernel.
* Search the device with an IP scanner e.g: Angry IP Scanner.  Initial credentials: `root:1234` (armbian)
* The first login will prompt you to create new root password
* Now you will be prompted to create the normal user: `kevin`


## Update system

~~~
apt update
apt upgrade -y
apt autoremove -y
~~~


## armbian-config

Use config tool to setup basic settings.

~~~
armbian-config
~~~

* Network -> IP: 192.168.1.9
* Personal -> Timezone
* Personal -> Locales: en_US.UTF-8
* Personal -> Hostname: `mueller-nas`
* System -> DTB
* System -> Governor


## Move System to SATA drive

This has not been done because we use a QVO SSD as storage drive.


## Run ansible playbook

Ensure to use the real end-user `kevin` for this step.
First we make login easier by deploying SSH public key: `ssh-copy-id kevin@192.168.0.121`

If the samba role fails to create the user do it manually:


## Configure Samba shares on host

* `\\mueller-nas\daten`
* `\\mueller-nas\backup`


## Configure RSync backups on host

See: [rsync-daemon role](rsync-daemon.md)
