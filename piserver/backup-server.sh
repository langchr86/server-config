#!/bin/bash

FORCE_ON="/share/lang-nas08/force_on"

# startup backup server
touch ${FORCE_ON}
sleep 600
rm -f ${FORCE_ON}
