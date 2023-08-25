hdparm
======


show current state:

~~~
sudo hdparm -C /dev/sd[a-c]
~~~

show APM level:

~~~
sudo hdparm -I /dev/sd[a-c] | grep level
~~~

set spindown configs

~~~
sudo hdparm -B 64 -S 12 /dev/sd[a-c]
~~~
