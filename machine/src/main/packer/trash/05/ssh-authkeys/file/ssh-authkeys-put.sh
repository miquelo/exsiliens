#!/bin/sh

SSH_DIR="~${1}/.ssh"
SSH_AUTHORIZED_KEYS="`eval echo $SSH_DIR/authorized_keys`"
SSH_AUTHORIZED_KEYS_DIR="`eval echo $SSH_DIR/authorized_keys.d/`"
test -f $SSH_AUTHORIZED_KEYS && \
cat $SSH_AUTHORIZED_KEYS
test -d $SSH_AUTHORIZED_KEYS_DIR && \
test ! -z "$(ls -A $SSH_AUTHORIZED_KEYS_DIR)" && \
cat $SSH_AUTHORIZED_KEYS_DIR/*
