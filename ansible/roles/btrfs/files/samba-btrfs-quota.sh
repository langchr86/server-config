#!/bin/bash

ARGS=( "$@" )
DIRLEN=$(( $# - 2 ))

DIR="${ARGS[@]::${DIRLEN}}"
QUERY=${ARGS[-2]}
UID_OR_GID=${ARGS[-1]}

# optional log to a file
echo "$EUID: quota request of type $QUERY for $UID_OR_GID on $DIR" >> /var/log/samba/quota.log

#This script should print one line as output with spaces between the columns. The printed columns should be:
#    1 - quota flags (0 = no quotas, 1 = quotas enabled, 2 = quotas enabled and enforced)
#    2 - number of currently used blocks
#    3 - the softlimit number of blocks
#    4 - the hardlimit number of blocks
#    5 - currently used number of inodes
#    6 - the softlimit number of inodes
#    7 - the hardlimit number of inodes
#    8 (optional) - the number of bytes in a block(default is 1024)
echo "0 0 0 0 0 0 0"
