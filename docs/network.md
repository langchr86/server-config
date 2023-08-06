network
=======


WOL
---

Check if enabled:

~~~
sudo ethtool <interface>
~~~

Expected output:

~~~
Supports Wake-on: pumbg
Wake-on: g
~~~


2.5Gb Ethernet
--------------

We use an USB ethernet adapter: `Delock Adapter USB Type-A male to 2.5 Gigabit LAN`.
This one internally uses a `Realtek RTL8156` chipset.
To be able to use the full potential we have to use the specific linux driver.

See:

* [Fixing performance issues with Realtek RTL8156B 2.5GbE USB dongle in Ubuntu](https://www.cnx-software.com/2022/02/20/fixing-performance-issues-with-realtek-rtl8156b-2-5gbe-usb-dongle-in-ubuntu/)
* The used udev rules (is the same as in the official driver): [50-usb-realtek-net.rules](https://github.com/bb-qq/r8152/blob/master/50-usb-realtek-net.rules).
* The official source for drivers: [Realtek USB FE / GBE / 2.5G / Gaming Ethernet Family Controller Software](https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-usb-3-0-software)
