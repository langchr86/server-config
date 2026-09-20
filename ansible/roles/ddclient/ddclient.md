ddclient
========

This is used to update any DNS entries at a dyn-DNS service.


Cloudflare
----------

See: [Configure ddclient for Cloudflare Dynamic DNS](https://www.davidschlachter.com/misc/cloudflare-ddclient)

We need at least the root `A` entry and a `CNAME` per subdomain or a wildcard for all subdomains.
Only the root (`@`) needs to point to the real IP and needs to be updated by `ddclient`.
The `CNAME` entry can be redirected to the root (`@`).
All entries must not use cloudflare proxy but `DNS only`!

If the home router does not get IPv6 we need to delete any `AAAA` records.
We can test this with [ready.chair6.net](https://ready.chair6.net)

~~~
;; A Records
langchr86.ch.	1	IN	A	11.222.333.444

;; CNAME Records
*.langchr86.ch.	1	IN	CNAME	langchr86.ch.
...
~~~
