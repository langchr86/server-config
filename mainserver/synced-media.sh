#!/bin/bash


DEST="clang@192.168.0.8:/share/synced_media"

rsync -a --delete --stats "/mnt/subvolumes/share-main/Audios/Alben/" "${DEST}/audios/Alben/"
rsync -a --delete --stats "/mnt/subvolumes/share-main/Audios/Singles/" "${DEST}/audios/Singles/"
rsync -a --delete --stats "/mnt/subvolumes/share-main/Audios/Soundtracks/" "${DEST}/audios/Soundtracks/"
rsync -a --delete --stats "/mnt/subvolumes/share-main/Audios/Various/" "${DEST}/audios/Various/"

rsync -a --delete --stats "/mnt/subvolumes/share-main/Bücher/TechnischeLiteratur/" "${DEST}/books/technology/"
rsync -a --delete --stats "/mnt/subvolumes/share-main/Bücher/Magazine/" "${DEST}/books/magazines/"

rsync -a --delete --stats "/mnt/subvolumes/share-main/Backups/lang-ct2014/lang-ct2014_Daten/Daten/Archiv/08-14 FHNW/" "${DEST}/fhnw_archive/"
