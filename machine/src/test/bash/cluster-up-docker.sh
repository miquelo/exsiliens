#!/bin/bash

docker run -d \
-p 2201:22 \
-p 4848:4848 \
--name exsiliens-appserver-test \
--hostname exsiliens-appserver \
exsiliens/appserver:0.1

sleep 1s

ssh -l ssh-authkeys -p 2201 localhost glassfish pubkey $(cat ~/.ssh/id_rsa.pub)
