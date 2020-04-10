#!/bin/sh

apt-get -y install unzip

unzip /tmp/packer/glassfish-5.0.1.zip -d /usr/lib
rm /tmp/packer/glassfish-5.0.1.zip

apt-get -y remove unzip

rm -rf /usr/lib/glassfish5/glassfish/domains
rm -rf /usr/lib/glassfish5/glassfish/nodes

sed -ie 's/="..\/domains"/="\/var\/glassfish\/domains"/g' \
/usr/lib/glassfish5/glassfish/config/asenv.conf
sed -ie 's/="..\/nodes"/="\/var\/glassfish\/nodes"/g' \
/usr/lib/glassfish5/glassfish/config/asenv.conf

mkdir /var/glassfish
mkdir /var/glassfish/domains
mkdir /var/glassfish/nodes

useradd \
-d /var/glassfish \
-s /bin/bash \
glassfish

echo "export PATH=$PATH:/usr/lib/glassfish5/glassfish/bin" >> \
/var/glassfish/.bash_profile

chown -R glassfish:glassfish /var/glassfish
chown -R glassfish:glassfish /usr/lib/glassfish5/glassfish

rm -r /tmp/packer
