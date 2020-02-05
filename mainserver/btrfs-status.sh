#!/bin/bash

LOG="/mnt/subvolumes/share-main/btrfs-status.log"


# clear existing file and add header
date > ${LOG}
printf "\n\n" >> ${LOG}


printf "btrfs device stats /mnt \n==============================\n" >> ${LOG}
btrfs device stats /mnt >> ${LOG}
printf "\n\n" >> ${LOG}


printf "btrfs device usage /mnt \n==============================\n" >> ${LOG}
btrfs device usage /mnt >> ${LOG}
printf "\n\n" >> ${LOG}


printf "btrfs filesystem show /mnt \n==============================\n" >> ${LOG}
btrfs filesystem show /mnt >> ${LOG}
printf "\n\n" >> ${LOG}


printf "btrfs filesystem df /mnt \n==============================\n" >> ${LOG}
btrfs filesystem df /mnt >> ${LOG}
printf "\n\n" >> ${LOG}


printf "btrfs filesystem usage /mnt \n==============================\n" >> ${LOG}
btrfs filesystem usage /mnt >> ${LOG}
printf "\n\n" >> ${LOG}
