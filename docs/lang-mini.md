lang-mini
=========


Remove all things of whoopsie
-----------------------------

~~~~~~
sudo nano /etc/dbus-1/system.d/org.freedesktop.NetworkManager.conf

// remove policy for whoopsie
sudo apt-get purge whoopsie libwhoopsie0
~~~~~~


Heimdall
--------

If no configuration backup is available all relevant apps need to be configured manually:

* bitwarden
* logitech media server
* homeassistant
* transmission
* myjdownloader
* wiki
* movies
* etc.

See [folder](./heimdall) for images of unknown apps.


Vaultwarden / Bitwarden
-----------------------

Vault: [bitwarden.langchr86.mooo.com](https://bitwarden.langchr86.mooo.com/)
Admin: [bitwarden.langchr86.mooo.com/admin](https://bitwarden.langchr86.mooo.com/admin)

Most configuration is enabled by using docker-compose.
Some services need to be enabled by configuring over the admin web UI.

* [Yubikey OTP](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-Yubikey-OTP-authentication)
* [SMTP Email and Email 2FA](https://github.com/dani-garcia/vaultwarden/wiki/SMTP-Configuration)

All these settings are stored in `config.json`.
This file is part of the automatic backup.


Homeassistant
-------------

* Login to: `<YOUR_HOMEASSISTANT_IP>:8123` with your web browser.
* Create a user account.
* Name your home assistant installation. E.g: `homesensor-backend`. And define your location.
* At the next page your asked to select integration services to install. Search and install the `MQTT` integration.
  Use `mosquitto` for server IP and no user and no password. The port should be kept at the default `1883`.
  Enable the flag for the search function.
* Finish the configuration and re-login at the same URL again with your defined user and password.

> Note: We do not define any MQTT credentials to work in anonymous mode.
> You can define credentials but then also need to configure those in the sensors used.
