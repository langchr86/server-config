Lyrion Media Server
===================


First Setup
-----------

Start your setup over the Web-UI on: `192.168.0.6:9000`.

Select the appropriate Folders:

Media folders:

* `/music/Alben`
* `/music/Singles`
* `/music/Soundtracks`
* `/music/Various`

Playlist folder: `/playlist`


Settings
--------

* Software Updates
  * Software Updates = Don't check


Plugins
-------

Recommend plugins are:

* Material-Skin
* Musik- und Interpreten-Information
* YouTube
* Musiksammlung erneut durchsuchen
* Drag & Drop Musikdateien zur Wiedergabe
* Band's Campout


### Drag & Drop Musikdateien zur Wiedergabe

* Rescan Timer = on
* Rescan Time = 03:00
* Rescan Type = Clear library and rescan everything


### Youtube

[How to install youtube plugin with API key](https://forums.slimdevices.com/showthread.php?105840-ANNOUNCE-YouTube-Plugin-%28API-v3%29&p=857414&viewfull=1#post857414)


### Troubleshooting

If some problems occur with plugins (or others) stop the service, clear the cache and restart.

~~~~~~
sudo systemctl stop logitechmediaserver
sudo rm -rf /var/lib/squeezeboxserver/cache/*
sudo systemctl start logitechmediaserver
~~~~~~

Plugins then need to be installed again.
