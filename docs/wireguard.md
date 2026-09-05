WireGuard with wg-easy
======================

First Setup
-----------

Set up on `192.168.0.6:51841`.

The Admin-UI is not served outside the network but can be accessed by using an existing VPN.


Admin-Console Config
--------------------

Change global configs:

* `Allowed IPs`: `192.168.0.0/24`
* `DNS`: `192.168.0.1` (the one your DHCP is using)


Troubleshooting
---------------

If your host has no `ip_tables` kernel module (e.g. newest raspberry pi OS)
then you need to replace the hooks with:
https://wg-easy.github.io/wg-easy/v15.3/examples/tutorials/podman-nft/#edit-hooks.
See: https://github.com/wg-easy/wg-easy/issues/2658
