#!/bin/sh

# Disable SUDO

apt-get remove -y sudo
rm -r /etc/sudoers*
