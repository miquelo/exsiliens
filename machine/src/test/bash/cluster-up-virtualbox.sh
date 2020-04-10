#!/bin/bash

vboxmanage import \
../../../target/packer/output/appserver/exsiliens-appserver.ovf \
--vsys 0 \
--vmname exsiliens-appserver-test

vboxmanage modifyvm \
exsiliens-appserver-test \
--natpf1 "guestssh,tcp,,2201,,22"

vboxmanage startvm \
exsiliens-appserver-test \
--type headless
