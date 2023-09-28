Homeassistant
=============


Initial setup
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


Reverse Proxy Problems
----------------------

If you encounter the following errors in the HA log:

~~~
[homeassistant.components.http.forwarded] Received X-Forwarded-For header from an untrusted proxy 192.168.96.2
~~~

You need the add the reported IP as trusted proxy in the main HA config file under `trusted_proxies:`
