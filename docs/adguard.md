AdGuard
=======

AdGuard is used to provide a local DNS resolver
that can also filter request to work as an ad-blocker and security layer.
To be able to listen on the machines local port `53`
we are disabling the `DNSStubListener` of `systemd-resolved`.
`systemd-resolved` is still running and will respond to request if `AdGuard` is not running.

To use the local DNS server we need to configure our DHCP server to deploy the machines IP address as DNS server.
Always specify a second DNS server as backup.
E.g. the one of the local router.

Clients with static network configuration or browsers with their own DNS setting
need to be changed to use the local DNS server.

To test the blocking functionality the following pages can be used:

* https://canyoublockit.com/
