lang-gpu
========

This is a Windows 11 host which is used for game streaming or number crunching.
For streaming or remote desktop [Apollo](https://github.com/ClassicOldSong/Apollo) is used.
This host is manually managed.
There is no Ansible for this host.


BIOS/UEFI
---------

* Enable `Power On after power loss`


Common setup
------------

* Install the newest Windows image
* Activate with key
* Give a reasonable host-name: `lang-gpu`
* Run all updates
* Install hardware specific drivers if needed
* Debloat with: https://github.com/Raphire/Win11Debloat
* Disable Standby/Hibernate
* Define a reasonable password with autologin (optional)


Game/Desktop streaming
----------------------

* Install the newest release (even if alpha) of Apollo: https://github.com/ClassicOldSong/Apollo/releases
* Use Moonlight as client. Optionally integrate as non-steam app into Steam.
* Plug-in an HDMI Dummy.
* Plug-in any type of Mouse.
  A wireless dongle without a Mouse can be used as dummy.

Explanation:

* Sunshine does only work with the HDMI dummy and its hard-defined resolution.
  Apollo allows to create a virtual desktop per client and adjusts the client resolution.
  In addition, it supports HDR.
* The Mouse is needed because Windows will not show a Mouse pointer without any connected hardware.
  In addition, some games may not work.


Set static IP
-------------

192.168.0.7


Remote Power Control
--------------------

Use a Shelly 1pm in combination with `Power On after power loss` to start the server.


Remote Shutdown
---------------

* Install: https://github.com/karpach/remote-shutdown-pc
* Allow Firewall settings
* Setup the following service in homeassistant:

~~~~~~
rest_command:
  lang_gpu_shutdown:
    url: http://192.168.0.7:5001/shutdown
~~~~~~
