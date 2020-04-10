#!/bin/bash

vboxmanage controlvm \
exsiliens-appserver-test poweroff

vboxmanage modifyvm \
exsiliens-appserver-test \
--natpf1 delete "guestssh"

vboxmanage unregistervm \
exsiliens-appserver-test \
--delete
