lang-main
=========


Prepare Hardware
----------------

See [Hardware](/docs/hardware.md).


Prepare Backups
---------------

In case of a hardware migration it is best to prepare manual backups before.

* Stop all running services shown by `sudo docker ps` with `sudo systemctl stop <service>`.

* Trigger automatic backups:

  ~~~
  sudo systemctl start backup-git-lang-main
  sudo systemctl start backup-config-lang-main
  sudo systemctl start backup-share-common-lang-main
  sudo systemctl start bitwarden_backup
  ~~~

* Manually copy files from main disk:

  ~~~
  mkdir -p /share/backups/lang-main/manual/
  sudo cp -r /config /share/backups/lang-main/manual/
  sudo cp -r /git /share/backups/lang-main/manual/
  sudo cp -r /share-common /share/backups/lang-main/manual/
  ~~~

All relevant manual steps to restore backups (e.g. for bitwarden) can be done after the hardware migration is finished.


Common steps
------------

Find the common steps needed for this host here:
[Deployment on Ubuntu Host](/docs/deployment-ubuntu.md)


Prepare block devices
---------------------

Ensure that the data disks correspond with the used paths in the playbook.


Additional
----------

Setup all related things like the local router etc.
