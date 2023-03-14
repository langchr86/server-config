router
======


Port forwarding
---------------

Ensure that the used listening ports are available from outside NAT to the correct host:

| external port | internal port | protocol  | host          | service |
| ------------- | ------------- |-----------| ------------- | ------- |
| `23722`       | `22`          | tcp       | `lang-mini`   | ssh |
| `80`          |               | tcp       | `lang-mini`   | http: caddy2 |
| `443`         |               | tcp       | `lang-mini`   | https: caddy2 |
| `27015-27016` |               | tcp + udp | `lang-main`   | cs16server, csgoserver |
| `27020-27021` |               | udp       | `lang-main`   | cs16server, csgoserver |
| `64738`       |               | tcp + udp | `lang-mini`   | mumble |


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

| IP  | device name          |
|-----|----------------------|
| .5  | lang-backup          |
| .6  | lang-main            |
| .8  | lang-mini            |
| .20 | tv-wohnen            |
| .21 | tv-dispo             |
| .30 | lang-pv-symo24       |
| .31 | servicewelt          |
| .32 | lf-zehnder           |
| .48 | button-buro          |
| .49 | button-wohnen        |
| .50 | sensor-sitzplatz     |
| .51 | sensor-schopf        |
| .52 | sensor-wohnen        |
| .53 | sensor-buero         |
| .54 | sensor-schlafen      |
| .55 | sensor-dispo         |
| .60 | technik-wasser       |
| .65 | 1pm-tv-wohnen        |
| .66 | 1pm-rack             |
| .67 | 1pm-buro             |
| .68 | boiler               |
| .69 | warmepumpe           |
| .70 | storen-dispo-west    |
| .71 | storen-wohnen-ost    |
| .72 | storen-sitzplatz-sud |
| .73 | storen-essen-west    |
| .74 | storen-kuche-west    |
| .75 | storen-reduit-west   |
| .76 | storen-wc-ost        |
| .77 | storen-treppe-nord   |
| .78 | storen-bad-ost       |
| .79 | storen-buro-ost      |
| .80 | storen-buro-sud      |
| .81 | storen-schlafen-sud  |
| .82 | storen-schlafen-west |
| .83 | storen-ankleide-west |
| .84 | storen-ankleide-nord |
| .85 | tumbler              |
| .86 | waschmaschine        |
| .89 | geschirrspuler       |
| .90 | licht-wohnen         |
