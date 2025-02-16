Jellyfin
========

Erstmalige Einrichtung
----------------------

Einrichten unter `192.168.0.6:8096` oder `https://media.langchr86.ch`

* Deutsch, German, Switzerland.
* User `admin` als Manager einrichten.
* Bibliothek momentan nur lesbar in den Container mounten.
* `Externe Verbindungen zu diesem Server zulassen` deaktivieren


Einstellungen
-------------

### Allgemein

Administration -> Server -> Allgemein:

* Servername: `lang-main`


### Plugins installieren

Administration -> Erweitert -> Plugins -> Katalog:

* `Kodi Sync Queue`
* `Open Subtitles`
* `Fanart`
* `Bookshelf`

Server neu starten: Administration -> Server -> Übersicht -> Herunterfahren

Danach müssen manche der Plugins in den Bibliotheken aktiviert werden. Z.B. `Fanart`.


### Hardwarebeschleunigung

Administration -> Server -> Wiedergabe:

* Hardwarebeschleunigung: `VAAPI`
* VA-API-Gerät: `/dev/dri/renderD128`
* Hardware-Dekodierung aktivieren für: `H264, HEVC, VC1, HEVC 10bit, VP9 10bit`

Weitere Infos zur Hardwarebeschleunigung: https://jellyfin.org/docs/general/administration/hardware-acceleration/intel/#configure-on-linux-host


### Normale User

Administration -> Server -> Benutzer:

* User `kodi` als normaler User einrichten.
* `Externe Verbindungen zu diesem Server zulassen` aktivieren


### Fix Comic-Reader on Smartphone

Als `admin` unter: Administration -> Server -> Allgemein -> Benutzerdefinierter CSS-Code:

~~~
#comicsPlayer .swiper-slide-img {
    max-height: 100%;
    max-width: 100%;
    display: table-cell;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
}
~~~

Siehe auch: https://www.reddit.com/r/jellyfin/comments/112e3rx/jellyfin_comic_reading_on_mobile_issues/
oder: https://jellyfin.org/docs/general/clients/css-customization/
