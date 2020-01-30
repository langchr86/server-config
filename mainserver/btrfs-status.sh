#!/bin/bash

LOG="/mnt/subvolumes/share-main/status.log"


# clear existing file and add header
date > ${LOG}
printf "\n" >> ${LOG}


# BTRFS
printf "\n\n" >> ${LOG}
printf "btrfs device stats /mnt \n==============================\n" >> ${LOG}
btrfs device stats /mnt >> ${LOG}
printf "\n\n" >> ${LOG}


# S.M.A.R.T.
function smart_start_short_test {
	local DEVICE=${1}
	smartctl -t short ${DEVICE}
}

function smart_get_test_log {
	local DEVICE=${1}
	printf "\n\n" >> ${LOG}
	printf "smartctl -a ${DEVICE} \n==============================\n" >> ${LOG}
	smartctl -a ${DEVICE} >> ${LOG}
	printf "\n\n" >> ${LOG}
}

smart_start_short_test "/dev/sda"
smart_start_short_test "/dev/sdb"
smart_start_short_test "/dev/sdc"
smart_start_short_test "/dev/sdd"
smart_start_short_test "/dev/sde"

sleep 5m

smart_get_test_log "/dev/sda"
smart_get_test_log "/dev/sdb"
smart_get_test_log "/dev/sdc"
smart_get_test_log "/dev/sdd"
smart_get_test_log "/dev/sde"
