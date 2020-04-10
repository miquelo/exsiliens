#!/bin/sh

# Setup SSH for root account

echo 'root:root' | chpasswd

echo 'StrictModes no' >> /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
