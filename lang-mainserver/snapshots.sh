#!/bin/bash

# main-share snapshots
btrfs-snap -r -c -p -t 86400 -B /mnt/snapshots/share-main /mnt/subvolumes/share-main daily 14
