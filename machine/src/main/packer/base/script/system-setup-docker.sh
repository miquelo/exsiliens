#!/bin/sh

apt-get -y update
apt-get -y install openssh-server

cp /tmp/packer/docker-init.sh /init
chmod 0500 /init
