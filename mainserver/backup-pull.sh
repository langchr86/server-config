#!/bin/bash


# let the network establish
sleep 30


ADDR="christian@192.168.0.8"
DEST="/mnt/subvolumes/share-main/Backups/lang-piserver"

# piserver backup pull
mkdir -p ${DEST}

rsync -a --delete --stats ${ADDR}:/git/ ${DEST}/lang-piserver_git/

rsync -a --delete --stats ${ADDR}:/share/data/ ${DEST}/lang-piserver_share/data/
rsync -a --delete --stats ${ADDR}:/share/fileshare/ ${DEST}/lang-piserver_share/fileshare/
rsync -a --delete --stats ${ADDR}:/share/gallery/ ${DEST}/lang-piserver_share/gallery/
rsync -a --delete --stats ${ADDR}:/share/projects/ ${DEST}/lang-piserver_share/projects/
rsync -a --delete --stats ${ADDR}:/share/temp/ ${DEST}/lang-piserver_share/temp/
