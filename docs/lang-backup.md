lang-backup
===========


Prepare lvm pool and share
--------------------------

~~~
sudo apt install lvm2

sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL

sudo pvcreate /dev/sdb /dev/sdc
sudo pvdisplay

sudo vgcreate pool-main /dev/sdb /dev/sdc
sudo vgdisplay

sudo lvcreate --name share-main --size 11900G pool-main
// or
sudo lvcreate --name share-main -l 100%FREE pool-main

sudo lvdisplay

sudo mkfs.ext4 /dev/pool-main/share-main
~~~


Mount
-----

~~~
sudo mkdir /mnt/snapshots
sudo mkdir -p /mnt/subvolumes/share-main
~~~

~~~
sudo nano /etc/fstab
~~~

~~~
/dev/pool-main/share-main  /mnt/subvolumes/share-main  ext4  rw,noatime  0 0
~~~

~~~
sudo mount /mnt/subvolumes/share-main
~~~

~~~
sudo chown clang:users /mnt/subvolumes/share-main/
sudo chmod 770 /mnt/subvolumes/share-main
ll /mnt/subvolumes
~~~
