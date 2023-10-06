TODO
====

General
-------

* check file/folder permissions for existing services
* check idempotency

* ansible vault password as github secret/token?
  * environment variable in github
  * But is this save? No, if some roles place the passwords as plaintext in some files on the VM.

* cross check all file/dir permissions. Not everything needs "become".
* tmux plugins: https://github.com/tmux-plugins/list
* clean older roles and mechanisms
* migrate to mosquitto 2.x: https://mosquitto.org/documentation/migrating-to-2-0/
