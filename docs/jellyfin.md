Jellyfin
========

Erstmalige Einrichtung
----------------------

Einrichten unter `192.168.0.6:8096` oder `https://media.langchr86.ch`

* Deutsch, German, Switzerland.
* User `admin` als Manager einrichten.
* Bibliothek nur lesbar in den Container mounten.
* `Externe Verbindungen zu diesem Server zulassen` nur deaktivieren, wenn nicht von extern (Caddy) zugegriffen wird.


Medienbibliothek einrichten
---------------------------

Zuerst alle Bibliotheken erstellen und korrekt konfigurieren.
Danach einen kompletten Scan anwerfen und unter keinen Umständen abbrechen.
Dies kann mehrere Stunden dauern!

* `Echtzeitüberwachung` nach Bedarf deaktivieren.
* `Metadatendienst` deaktivieren für:
  * Musik
  * Hörspiele
  * Soundtracks
  * ComedyAudio
  * Comics & Bücher


Einstellungen
-------------

### Allgemein

Administration -> Server -> Allgemein:

* Servername: `lang-main`

Administration -> Erweitert -> Netzwerk:

* Bekannte Proxys: `172.0.0.0/8,192.168.0.0/16`


### Plugins installieren

Administration -> Erweitert -> Plugins -> Katalog:

* `Bookshelf`
* `Fanart`
* `Playback Reporting`

Server neu starten: Administration -> Server -> Übersicht -> Neustart

Danach müssen manche der Plugins in den Bibliotheken aktiviert werden. Z.B. `Fanart`.


### Hardwarebeschleunigung

Administration -> Server -> Wiedergabe:

* Hardwarebeschleunigung: `VAAPI`
* VA-API-Gerät: `/dev/dri/renderD128`
* Hardware-Dekodierung aktivieren für: `H264, HEVC, VC1, HEVC 10bit, VP9 10bit, HEVC RExt 8/10bit, HEVC RExt 12bit`
* `VPP-Tone-Mapping aktivieren`
* `Tone-Mapping aktivieren`

Weitere Infos zur Hardwarebeschleunigung: https://jellyfin.org/docs/general/administration/hardware-acceleration/intel/#configure-on-linux-host


### Normale User

Administration -> Server -> Benutzer:

* User `clang` als normaler User einrichten.
* `Externe Verbindungen zu diesem Server zulassen` aktivieren.


### Fix Comic-Reader on Smartphone

Als `admin` unter: Administration -> Server -> Branding -> Benutzerdefinierter CSS-Code:

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
