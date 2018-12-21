#!/bin/bash

[[ -z $1 ]] && echo 'usage <DIR> <OUTPUT>' && exit 127
[[ -z $2 ]] && echo 'usage <DIR> <OUTPUT>' && exit 127


DIR=$1
OUTPUT=$2
[[ $PASSPHRASE ]] || PASSPHRASE='p@55word'

if [ -d $DIR ]; then
        rm -r $DIR
fi

mkdir -p $DIR

tar -pczf $OUTPUT $DIR

gpg --yes --batch --passphrase=$PASSPHRASE -c $OUTPUT

rm -rf $OUTPUT
