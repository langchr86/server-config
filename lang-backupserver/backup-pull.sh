#!/bin/bash

# main-share backup pull
rsync -a --delete --stats clang@192.168.0.11:/mnt/subvolumes/share-main/ /mnt/subvolumes/share-main
