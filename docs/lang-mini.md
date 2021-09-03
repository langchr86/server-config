lang-mini
=========


Remove all things of whoopsie
-----------------------------

~~~~~~
sudo nano /etc/dbus-1/system.d/org.freedesktop.NetworkManager.conf

// remove policy for whoopsie
sudo apt-get purge whoopsie libwhoopsie0
~~~~~~
