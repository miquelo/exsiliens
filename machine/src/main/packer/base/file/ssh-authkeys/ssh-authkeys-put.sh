#!/bin/bash

ARGS=( ${@:2} )

ARG_USERNAME="${ARGS[0]}"
ARG_AUTH_KEY_NAME="${ARGS[1]}"
ARG_AUTH_KEY="${ARGS[2]} ${ARGS[3]} ${ARGS[4]}"

BASE_DIR="/var/ssh-authkeys"

case "${#ARGS[@]}" in

"0")
echo "Removing all..."
rm -r $BASE_DIR/*
echo "Done. See you."
;;

"1")
echo "Removing $ARG_USERNAME authorized keys..."
rm -rf $BASE_DIR/$ARG_USERNAME
echo "Done."
;;

"2")
echo "Removing $ARG_USERNAME authorized key $ARG_AUTH_KEY_NAME..."
rm -f $BASE_DIR/$ARG_USERNAME/$ARG_AUTH_KEY_NAME
echo "Done."
;;

*)
echo "Adding authorized key $ARG_AUTH_KEY_NAME on user $ARG_USERNAME..."
echo "$ARG_AUTH_KEY"
mkdir -p $BASE_DIR/$ARG_USERNAME
echo "$ARG_AUTH_KEY" > $BASE_DIR/$ARG_USERNAME/$ARG_AUTH_KEY_NAME
echo "Done."
;;

esac
