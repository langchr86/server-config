#!/bin/bash

NAS08="/share/lang-nas08/force_on"
NAS16="/share/lang-nas16/force_on"



# startup main and backup server for backup task
touch ${NAS16}
sleep 1m
touch ${NAS08}
sleep 30m
rm -f ${NAS08} ${NAS16}
