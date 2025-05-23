router
======


Port forwarding
---------------

Ensure that the used listening ports are available from outside NAT to the correct host:

| external port | internal port | protocol  | host          | service |
| ------------- | ------------- |-----------| ------------- | ------- |
| `23722`       | `22`          | tcp       | `lang-main`   | ssh |
| `443`         |               | tcp       | `lang-main`   | https: caddy2 |
| `27015-27016` |               | tcp + udp | `lang-main`   | cs16server, csgoserver |
| `27020-27021` |               | udp       | `lang-main`   | cs16server, csgoserver |
| `64738`       |               | tcp + udp | `lang-main`   | mumble |


DNS
---

The DHCP server used on the router is also responsible to distribute the local DNS address.

We need to specify our own DNS server as the primary and something else
(e.g. cloudflare, see: https://adguard-dns.io/kb/general/dns-providers/) as a fallback.

Either you can directly configure the two distributed DNS in the DHCP setup
or you define the router itself as DNS server in the DHCP setup and configure the routers DNS servers.

![router_dns](images/router_dns.png)


Security
--------

### Disable ICMP response from outside

This can help against port scans.
In AVM Fritzbox you can find this option under:
`Internet` -> `Filter` -> `Listen` -> `Globale Filtereinstellungen` -> `Firewall im Stealth Mode`

### Disable UPnP

If you do not use any services that wants to open ports automatically but configures all port forwarding manually
you can disable UPnP.
In AVM Fritzbox this not allowed by default and needs to be activated per device.
If you want to disable all devices at once you can use:

`Internet` -> `Freigaben` -> `Sie können die Einstellung "Selbstständige Portfreigabe" für alle Geräte deaktivieren, die bisher keine Portfreigabe angefordert haben.`


IP Management
-------------

| IP range    | usage                |
|-------------|----------------------|
| .2   - .9   | servers              |
| .10  - .19  | network              |
| .20  - .29  | media                |
| .30  - .39  | energy               |
| .40  - .49  |                      |
| .50  - .99  | smart home |
| .100 - .200 | DHCP                 |


Device IPs
----------

| IP   | device name          |
|------|----------------------|
| .5   | lang-backup          |
| .6   | lang-main            |
| .20  | tv-wohnen            |
| .21  | tv-dispo             |
| .30  | lang-pv-symo24       |
| .31  | servicewelt          |
| .33  | 1pm-motorrad         |
| .48  | button-buro          |
| .49  | button-wohnen        |
| .50  | sensor-sitzplatz     |
| .51  | sensor-technik       |
| .52  | sensor-wohnen        |
| .53  | sensor-buero         |
| .54  | sensor-schlafen      |
| .55  | sensor-dispo         |
| .56  | sensor-garage        |
| .60  | technik-wasser       |
| .65  | 1pm-tv-wohnen        |
| .66  | 1pm-rack             |
| .67  | 1pm-buro             |
| .68  | boiler               |
| .69  | warmepumpe           |
| .70  | storen-dispo-west    |
| .71  | storen-wohnen-ost    |
| .72  | storen-sitzplatz-sud |
| .73  | storen-essen-west    |
| .74  | storen-kuche-west    |
| .75  | storen-reduit-west   |
| .76  | storen-wc-ost        |
| .77  | storen-treppe-nord   |
| .78  | storen-bad-ost       |
| .79  | storen-buro-ost      |
| .80  | storen-buro-sud      |
| .81  | storen-schlafen-sud  |
| .82  | storen-schlafen-west |
| .83  | storen-ankleide-west |
| .84  | storen-ankleide-nord |
| .85  | tumbler              |
| .86  | waschmaschine        |
| .87  | entfeuchter          |
| .89  | geschirrspuler       |
| .90  | licht-wohnen         |
| .91  | licht-schlafen       |
| .92  | licht-dispo-ost      |
| .116 | ComfoNET (MAC-Fix)   |
| .117 | Wattpilot (MAC-Fix)  |
