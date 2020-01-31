#!/bin/bash

LOG="/mnt/subvolumes/share-main/disk-status.log"


# clear existing file and add header
date > ${LOG}
printf "\n" >> ${LOG}

# list all disks
DISKS=$(echo /dev/sd?)

# S.M.A.R.T.
function smart_get_overall_health_report {
	local DEVICE=${1}
	printf "health report: ${DEVICE} \n==============================\n" >> ${LOG}
	smartctl --health "${DEVICE}" | grep "overall-health self-assessment test result" >> ${LOG}
	smartctl --log=error "${DEVICE}" | grep "Error Count" >> ${LOG}
	smartctl --log=selftest "${DEVICE}" | grep "# 1" >> ${LOG}
	printf "\n\n" >> ${LOG}
}

function smart_start_short_test {
	local DEVICE=${1}
	smartctl -t short ${DEVICE} | true
}

function smart_get_test_log {
	local DEVICE=${1}
	printf "\n\n" >> ${LOG}
	printf "smartctl -a ${DEVICE} \n==============================\n" >> ${LOG}
	smartctl -a ${DEVICE} >> ${LOG}
	printf "\n\n" >> ${LOG}
}

for disk in ${DISKS}; do
    smart_get_overall_health_report "$disk"
	smart_start_short_test "$disk"
done

sleep 5m

for disk in ${DISKS}; do
	smart_get_test_log "$disk"
done
