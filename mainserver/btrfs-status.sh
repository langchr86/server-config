#!/bin/bash

LOG="/mnt/subvolumes/share-main/btrfs-status.log"


# clear existing file and add header
date > ${LOG}
printf "\n" >> ${LOG}


# BTRFS
printf "\n\n" >> ${LOG}
printf "btrfs device stats /mnt \n==============================\n" >> ${LOG}
btrfs device stats /mnt >> ${LOG}
printf "\n\n" >> ${LOG}
