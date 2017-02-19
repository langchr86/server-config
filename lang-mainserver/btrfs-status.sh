#!/bin/bash

LOG="/mnt/subvolumes/share-main/status.log"

date > ${LOG} 
btrfs device stats /mnt >> ${LOG}
