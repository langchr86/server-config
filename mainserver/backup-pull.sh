#!/bin/bash

ADDR="christian@192.168.0.8"
DEST="/mnt/subvolumes/share-main/Backups/lang-piserver"

# piserver backup pull
mkdir -p ${DEST}

rsync -a --delete --stats ${ADDR}:/home/christian/git ${DEST}/lang-piserver_git/

rsync -a --delete --stats ${ADDR}:/home/christian/share/data ${DEST}/lang-piserver_share/
rsync -a --delete --stats ${ADDR}:/home/christian/share/fileshare ${DEST}/lang-piserver_share/
rsync -a --delete --stats ${ADDR}:/home/christian/share/gallery ${DEST}/lang-piserver_share/
rsync -a --delete --stats ${ADDR}:/home/christian/share/projects ${DEST}/lang-piserver_share/
rsync -a --delete --stats ${ADDR}:/home/christian/share/temp ${DEST}/lang-piserver_share/
