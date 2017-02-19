#!/bin/bash

RSYNC_CMD="rsync -a --delete --stats"

function do-data-sync-push() {
	local SRC=$1
	local DST=$2

	echo "do push sync data folder ${SRC} to ${DST}"
	${RSYNC_CMD} ${SRC} ${USER}@${DST}
	echo "-------------------------"
}

function do-data-sync-pull() {
	local SRC=$1
	local DST=$2

	echo "do pull sync data folder ${SRC} to ${DST}"
	${RSYNC_CMD} ${USER}@${SRC} ${DST}
	echo "-------------------------"
}

function do-system-sync-push() {
	local DST=$1

	echo "do sync whole rootfs to ${DST}"

	rsync -aX --delete --stats ${PWD_OPTION} \
	--exclude="/dev/*" --exclude="/proc/*" \
	--exclude="/sys/*" --exclude="/tmp/*" \
	--exclude="/run/*" --exclude="/mnt/*" \
	--exclude="/media/*" --exclude="/lost+found" \
	--exclude="/etc/dphys-swapfile" --exclude="/var/swap" \
	--exclude="/home/christian/share/*" --exclude="var/www/html/wiki/*" \
	/ ${USER}@${DST}
	echo "-------------------------"
}
