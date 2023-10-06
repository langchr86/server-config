Samba
=====


Change passwords
----------------

The ansible role does not automatically change passwords for existing users.
Delete the user before running the playbook with:

~~~
$ sudo smbpasswd -x clang
~~~

Afterward you have to disconnect all shares and restart the services:

~~~
$ sudo systemctl restart smbd nmbd
~~~

Now we can reconnect the shares with the new credentials.
