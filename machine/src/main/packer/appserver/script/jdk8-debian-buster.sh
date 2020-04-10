#!/bin/sh

# https://installvirtual.com/install-java-8-on-debian-10-buster/

apt-get -y install gnupg2 software-properties-common wget

wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | \
apt-key add -
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
apt update -y
apt install adoptopenjdk-8-hotspot -y

apt-get -y remove gnupg2 software-properties-common wget