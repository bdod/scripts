#!/bin/bash

set -x

[[ -z $1 ]] && echo 'Your need select version of you ubuntu like 14.04 or 16.04 ' && exit 2


OS_version="$1"

wget https://mega.nz/linux/MEGAsync/xUbuntu_${OS_version}/amd64/megacmd-xUbuntu_${OS_version}_amd64.deb
