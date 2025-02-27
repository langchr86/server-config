server-config
=============

[![ansible-lint](https://github.com/langchr86/server-config/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/langchr86/server-config/actions/workflows/ansible-lint.yml)
[![subdomain-check](https://github.com/langchr86/server-config/actions/workflows/subdomain-check.yml/badge.svg)](https://github.com/langchr86/server-config/actions/workflows/subdomain-check.yml)

Configuration of my private server infrastructure.
Completely managed by ansible and linux containers.



Overview
--------

The whole infrastructure has several purposes:

* central data storage with redundancy and change history
* automated backup solution for servers and clients
* protection of private data
* multiple services accessible in local LAN only or through public internet

The infrastructure consists of multiple hosts
where one is responsible to provide access to internal services through the internet.
The following diagram gives an overview of the relevant hosts and some data flows.

![infrastructure_overview](docs/images/infrastructure_overview.png)

The following services are available:

* local file access: [samba](https://www.samba.org/)
* SSH access hardened by using the following guides and tools:)
  * [ssh-audit.com](https://www.ssh-audit.com/)
  * [ssh-audit.com/hardening_guides.html](https://www.ssh-audit.com/hardening_guides.html)
  * [ssh-jumphost-vs-wireguard-jumphost](https://www.procustodibus.com/blog/2021/12/ssh-jumphost-vs-wireguard-jumphost/)
  * [secure-secure-shell](https://blog.stribik.technology/2015/01/04/secure-secure-shell.html)
* RAID1 and change history: [btrfs](https://btrfs.wiki.kernel.org/index.php/Main_Page)
  and [btrbk](https://github.com/digint/btrbk)
* automatic server and client backups: [rsync and rsync-daemon](https://en.wikipedia.org/wiki/Rsync)
  and [QtdSync](http://qtdtools.doering-thomas.de/)
* disk monitoring: [smartctl](https://www.smartmontools.org/)
* download manager: [jdownloader](https://jdownloader.org/)
* torrent manager: [transmission](https://transmissionbt.com/)
* domain management: [cloudflare](https://cloudflare.com/)
* dyn-dns updater: [ddclient](https://github.com/ddclient/ddclient)
* static web-server and reverse-proxy: [caddy2](https://caddyserver.com/)
* local DNS and request filter: [AdGuard Home](https://adguard.com/de/adguard-home/overview.html)
* static markdown wiki: [mdwiki](http://www.mdwiki.info)
* password manager: [bitwarden](https://bitwarden.com/)
  with free backend: [vaultwarden](https://github.com/dani-garcia/vaultwarden)
* multi-room audio system: [lyrion music server](https://lyrion.org/)
* media server: [jellyfin](https://jellyfin.org/)
* media request management: [jellyseerr](https://github.com/Fallenbagel/jellyseerr)
* low-latency voice chat: [mumble](https://www.mumble.com/)
* home automation: [homeassistant](https://www.home-assistant.io/)
  with [mosquitto MQTT](https://mosquitto.org/)
* private finance management: [actual budget](https://actualbudget.org/)
* service dashboard: [homepage](https://gethomepage.dev/)



Deployment
----------

You can deploy this whole setup to either real hosts or a development environment.


### Ansible vault

In any case you need to be able to use all encrypted fields in [passwords.yml](/ansible/passwords.yml).
If you have the corresponding vault password
you need to create the PW file: `infra_pw` in the root folder of this repo.
Or you can simply replace all those fields by any unencrypted values for testing.


### Guides

See the following step-by-step guides:

* [Development by using Vagrant](/docs/vagrant-development.md)
* [Common steps for deployment on Ubuntu Host](/docs/deployment-ubuntu.md)
* [Deployment of main server](/docs/lang-main.md)
* [Deployment of backup server](/docs/lang-backup.md)



Further documentation
---------------------

You can also find some detail documentation for specific individual ansible roles or system parts under:
[Documentation](/docs)



Similar projects
----------------

Check out my "prototype" project for this setup: [langchr86/mini-nas](https://github.com/langchr86/mini-nas).
This is smaller and therefore easier to understand.
It also has much explanation and documentation about the core concepts used.

And here are some other links related to the topic of self-hosting etc.:

* [awesome-selfhosted](https://awesome-selfhosted.net)
* [selfh.st](https://selfh.st/)
* [noted.lol](https://noted.lol/)
