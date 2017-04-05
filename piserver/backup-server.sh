#!/bin/bash

FORCE_ON="/share/lang-nas08/force_on"

# startup backup server
touch ${FORCE_ON}
sleep 15m
rm -f ${FORCE_ON}
