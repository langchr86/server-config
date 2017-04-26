#!/bin/bash

sleep 30

# main-share backup pull
rsync -a --delete --stats clang@192.168.0.6:/mnt/subvolumes/share-main/ /mnt/subvolumes/share-main
