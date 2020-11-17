#!/bin/bash


# let the network establish
sleep 30


ADDR="clang@192.168.0.8"
DEST="/mnt/subvolumes/share-main/Backups/lang-miniserver"


mkdir -p ${DEST}/lang-miniserver_git/
rsync -a --delete --stats ${ADDR}:/git/ ${DEST}/lang-miniserver_git/

mkdir -p ${DEST}/lang-miniserver_share/
rsync -a --delete --stats ${ADDR}:/share/config/ ${DEST}/lang-miniserver_share/config/
rsync -a --delete --stats ${ADDR}:/share/data/ ${DEST}/lang-miniserver_share/data/
rsync -a --delete --stats ${ADDR}:/share/fileshare/ ${DEST}/lang-miniserver_share/fileshare/
rsync -a --delete --stats ${ADDR}:/share/gallery/ ${DEST}/lang-miniserver_share/gallery/
rsync -a --delete --stats ${ADDR}:/share/projects/ ${DEST}/lang-miniserver_share/projects/
rsync -a --delete --stats ${ADDR}:/share/temp/ ${DEST}/lang-miniserver_share/temp/
