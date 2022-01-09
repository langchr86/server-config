router
======


Port forwarding
---------------

Ensure that the used listening ports are available from outside NAT via TCP/UDP to the correct host:

| external port | internal port | host          | service |
| ------------- | ------------- | ------------- | ------- |
| `23722`       | `22`          | `lang-mini`   | ssh |
| `80`          |               | `lang-mini`   | http: caddy2 |
| `443`         |               | `lang-mini`   | https: caddy2 |
| `27015-27016` |               | `lang-main`   | cs16server, csgoserver |
| `27020-27021` |               | `lang-main`   | cs16server, csgoserver |
| `64738`       |               | `lang-mini`   | mumble |
