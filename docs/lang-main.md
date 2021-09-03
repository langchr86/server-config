lang-main
=========


Prepare btrfs pool
------------------

~~~
sudo apt install btrfs-tools

sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL

sudo mkfs.btrfs -f -m raid1 -d raid1 -L pool-main /dev/sda /dev/sdb /dev/sdc
~~~


Mount
-----

~~~
sudo blkid
sudo nano /etc/fstab
~~~

~~~
UUID="7773eeaf-e1e5-4df1-9746-1259c4b2c07d"  /mnt/pool-main  btrfs  defaults  0 0
~~~

~~~
sudo mount /mnt/pool-main
~~~

~~~
sudo mkdir /mnt/pool-main/snapshots
sudo mkdir /mnt/pool-main/subvolumes
~~~

~~~
sudo btrfs subvolume create /mnt/pool-main/subvolumes/share-main
sudo chown clang:users /mnt/pool-main/subvolumes/share-main
sudo chmod 770 /mnt/pool-main/subvolumes/share-main
~~~

~~~
sudo btrfs filesystem df /mnt/pool-main
sudo btrfs filesystem show /dev/sda
ll /mnt/pool-main/subvolumes
~~~
