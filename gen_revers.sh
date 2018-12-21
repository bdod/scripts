#!/bin/bash

#### this is script for realize revers.connection 2.0, 
#### it generating script for reverse ssh connection which you
#### need to share for customer, you can do it over http
#### on server side run python -m Http.Server 8080
#### on customer side run curl -sS http://you.server.com:8080/<scriptname> | bash
#### need create local user before running


SERVER_USER='<you user for revers connection>'
SERVER='<server>'
SERVER_PORT='<you server_port>'
REVERSE_SCRIPT=revers

ssh-keygen -t rsa -N "" -f tmp.key
[[ -d /home/$SERVER_USER/.ssh ]] || mkdir -p /home/$SERVER_USER/.ssh
cat tmp.key.pub > /home/$SERVER_USER/.ssh/authorized_keys

cat <<EOF > ${REVERSE_SCRIPT}
#!/bin/bash

pubkeyl="$(cat $HOME/.ssh/id_rsa.pub)"
private_keyr="$(cat tmp.key)"

echo "\$pubkeyl" >> \$HOME/.ssh/authorized_keys


kill -0 \$SSH_AGENT_PID || eval \$(ssh-agent)
echo "\$private_keyr" > tmp.key
ssh-add -t 10 tmp.key
ssh rm -rf tmp.key

ssh -f -N -R $SERVER_PORT:127.0.0.1:22 $SERVER_USER@$SERVER

EOF
rm -rf tmp.key

