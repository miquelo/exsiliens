#!/bin/sh

# Disable CD-ROM entries to avoid prompts to insert a disk

sed -i "/^deb cdrom:/s/^/#/" /etc/apt/sources.list

# Update APT

apt-get -y update

# Disable SUDO

apt-get remove -y sudo
rm -r /etc/sudoers*

# Clean APT

apt-get -y autoremove
