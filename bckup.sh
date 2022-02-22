#!/bin/bash

backupFolder="/run/media/"

sudo mount /dev/sdb1 /run/media/

tar --listed-incremental=$backupFolder/snapshot.file -cJpf $backupFolder/home-backup-`date +%d-%m-%Y`.tar.xz /home/rangelgbr/

