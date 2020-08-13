#!/bin/bash

sleep 60

# main-share snapshots
btrfs-snap -r -c -p -B /mnt/snapshots/share-main /mnt/subvolumes/share-main daily 60
