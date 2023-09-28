claudia-server
==============


## Prepare backup HDD

* Format on Windows PC with NTFS.
* Use the label `daten-backup`


## Install armbian bullseye

* Download LTS ubuntu distro from [Armbian - Odroid HC1 / HC2 / MC1](https://www.armbian.com/odroid-hc1/)
* Flash SD-Card
* Boot and watch LEDs on Ethernet port. Left one is 100MBit and right one is 1000MBit.
  Blue LED static shows bootloader active and blinking running kernel.
* Search the device with an IP scanner e.g: Angry IP Scanner.  Initial credentials: `root:1234` (armbian)
* The first login will prompt you to create new root password
* Now you will be prompted to create the normal user: `claudia`


## Make user sudoer without password prompt

~~~
printf "claudia ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers.d/claudia
~~~


## Update system

~~~
apt update
apt upgrade -y
apt autoremove -y
~~~


## CPU Governor

~~~
nano /boot/boot.ini
~~~

~~~
# CPU Governoor
setenv governor "ondemand"
~~~

Check with

~~~
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
~~~


## armbian-config

Use config tool to setup basic settings.

~~~
armbian-config
~~~

* Network -> IP: 192.168.1.9
* Personal -> Timezone
* Personal -> Locales: en_US.UTF-8
* Personal -> Hostname: `claudia-server`
* System -> DTB


## Move System to SATA drive

~~~
armbian-config
System -> Install
~~~

Ensure you have an empty partition before starting this process. Or prepare it with `fdisk`.
If not prepared the wizard will start `fdisk` anyway.

~~~
Create new GPT partition table with: g
Create new partition of size 64G with: n -> 1 -> ENTER -> +64G
Create partition with remaining space: n -> 2 -> ENTER -> ENTER
Write changes: w
~~~

Now restart the wizard and choose install to `/dev/sdb1` and choose `btrfs` as filesystem.
Maybe the screen freezes about 2 Minutes before showing any progress screen.
This will result in a reboot.


## Run ansible playbook

Ensure to use the real end-user `claudia` for this step.
First we make login easier by deploying SSH public key: `ssh-copy-id claudia@192.168.1.9`

If the samba role fails to create the user do it manually:


## Configure Samba shares on host

* `\\192.168.1.9\daten-sicher`
* `\\192.168.1.9\daten-unsicher`
* `\\192.168.1.9\daten-backup`


## Configure RSync backups on host

See: [rsync-daemon role](rsync-daemon.md)


## Plex

By now the plex container should run.
Configure the server by opening the following URL: `http://192.168.1.9:32400/web/index.html`

* Disable `Erlaube mir Zugriff auf meine Medien von außerhalb meines Heimnetzwerkes`
* Add the different media folder by referencing the folders located in `/movies`
* Access your server after configuring over [app.plex.tv](https://app.plex.tv/).
