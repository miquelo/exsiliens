#!/bin/sh

PARAM_USERNAME="$1"
PARAM_PUBLIC_KEY_TYPE="$2"
PARAM_PUBLIC_KEY="$3"

BASE_DIR="/var/ssh-authkeys"
SSH_PUBLIC_KEY="$BASE_DIR/pubkey"
SSH_USER_DIR="$BASE_DIR/$PARAM_USERNAME"

if [ "$PARAM_USERNAME" = "ssh-authkeys" ]
then

  test -f $SSH_PUBLIC_KEY || \
  echo "$PARAM_PUBLIC_KEY_TYPE $PARAM_PUBLIC_KEY" > \
  $SSH_PUBLIC_KEY
  cat $SSH_PUBLIC_KEY
  
else

  test -d $SSH_USER_DIR && \
  test ! -z "$(ls -A $SSH_USER_DIR)" && \
  cat $SSH_USER_DIR/*
  
fi
