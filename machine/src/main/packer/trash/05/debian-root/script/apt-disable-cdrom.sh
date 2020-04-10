#!/bin/sh

# Disabling CD-ROM entries to avoid prompts to insert a disk

sed -i "/^deb cdrom:/s/^/#/" /etc/apt/sources.list
