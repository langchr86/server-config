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
