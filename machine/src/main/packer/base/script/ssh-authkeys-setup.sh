#!/bin/sh

apt-get -y --only-upgrade install openssh-server

SEARCH_PATTERN="#PubkeyAuthentication yes"
REPLACE_PATTERN="PubkeyAuthentication yes"
sed -ie "s/$SEARCH_PATTERN/$REPLACE_PATTERN/g" \
/etc/ssh/sshd_config

SEARCH_PATTERN="#AuthorizedKeysCommand none"
REPLACE_PATTERN="AuthorizedKeysCommand \/usr\/bin\/ssh-authkeys %u %t %k"
sed -ie "s/$SEARCH_PATTERN/$REPLACE_PATTERN/g" \
/etc/ssh/sshd_config

SEARCH_PATTERN="#AuthorizedKeysCommandUser nobody"
REPLACE_PATTERN="AuthorizedKeysCommandUser ssh-authkeys"
sed -ie "s/$SEARCH_PATTERN/$REPLACE_PATTERN/g" \
/etc/ssh/sshd_config

mkdir -p /var/ssh-authkeys
useradd -r \
-s /usr/bin/ssh-authkeys-put \
-d /var/ssh-authkeys \
ssh-authkeys
chown -R ssh-authkeys /var/ssh-authkeys
touch /var/ssh-authkeys/.hushlogin

cp /tmp/packer/ssh-authkeys.sh /usr/bin/ssh-authkeys
chmod 0505 /usr/bin/ssh-authkeys
chown root /usr/bin/ssh-authkeys

cp /tmp/packer/ssh-authkeys-put.sh /usr/bin/ssh-authkeys-put
chmod 0500 /usr/bin/ssh-authkeys-put
chown ssh-authkeys /usr/bin/ssh-authkeys-put

mkdir -p /var/run/sshd
chmod 0700 /var/run/sshd

rm -r /tmp/packer
