#!/bin/bash

mkdir -p /var/backups/inotify
if echo $1 | grep -qP "\..*\.sw(p|x|px)$"; then
    # Ignore temporary Vim swap files
    exit 0
fi

# Copy the file with directory structure, append timestamp
cp -p --parents $1 /var/backups/inotify
mv /var/backups/inotify$1 /var/backups/inotify$1_$(date +'%Y.%m.%d_%H:%M:%S')
