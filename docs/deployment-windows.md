Deployment with Windows
=======================


BIOS/UEFI
---------

* Enable `Power On` after power loss
* Disable unused LAN adapters


Common setup
------------

* Install newest Windows image
* Activate with key
* Give a reasonable host-name: `lang-gpu`
* Run all updates
* Install hardware specific drivers if needed
* Debloat with: https://github.com/Raphire/Win11Debloat
* Disable Standby/Hibernate
* Define a reasonable password with autologin (optional)


Package management
------------------

TODO



Set static IP
-------------

192.168.0.7


Remote Shutdown
---------------

* Install: https://github.com/karpach/remote-shutdown-pc
* Allow Firewall settings
* Setup the following service in homeassistant:

~~~~~~
http://192.168.0.7:5001/shutdown
~~~~~~



TODO:

Integrate in Caddy
Integrate in Homepage
Shelly Hardware
Integrate in HomeAssistant
Automation for shutdown
