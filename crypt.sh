#!/bin/bash

DISK='/dev/sdb1'
NAME='data'
KEY="$NAME.key"


#head -c 256 /dev/random > $KEY
#cryptsetup luksFormat --key-file $KEY $DISK
cryptsetup luksOpen   --key-file $KEY $DISK $NAME
mount /dev/mapper/$NAME /$NAME

