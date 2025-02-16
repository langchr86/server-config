Vaultwarden / Bitwarden
=======================

Vault: [bitwarden.langchr86.ch](https://bitwarden.langchr86.ch)
Admin: [http://<IP>:8088/admin](http://192.168.0.6:8088/admin)

Most configuration is enabled by using docker-compose.
Some services need to be enabled by configuring over the admin web UI.

* [Yubikey OTP](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-Yubikey-OTP-authentication)
* [SMTP Email and Email 2FA](https://github.com/dani-garcia/vaultwarden/wiki/SMTP-Configuration)

All these settings are stored in `config.json`.
This file is part of the automatic backup.


Restore Backup
--------------

~~~
$ sudo systemctl stop bitwarden
$ cd /config/bitwarden
$ rm -rf restore/*
$ cp -r backup/* restore/
$ ./backup_scripts/run_restore.sh

container$ rm -rf /data/*
container$ cp -r /restore/* /data/
container$ exit

$ sudo systemctl restart bitwarden
~~~
