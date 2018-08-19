#!/bin/bash

##### this is script for generating selfsigned and  multidomain certificates #######



#### first of all we need create config
CONFIG="/tmp/openssl.${RANDOM}.cnf"
KEY="server.key"
CSR="/tmp/openssl.${RANDOM}.csr"
CRT="server.crt"
DAYS="3650"

echo """
    [req]
    distinguished_name = req_distinguished_name
    req_extensions = v3_req

    [req_distinguished_name]
    countryName = SL
    countryName_default = SL
    stateOrProvinceName = Western
    stateOrProvinceName_default = Western
    localityName = Colombo
    localityName_default = Colombo
    organizationalUnitName = ABC
    organizationalUnitName_default = ABC
    commonName = *.dev.abc.com
    commonName_max = 64

    [ v3_req ]
    # Extensions to add to a certificate request
    basicConstraints = CA:FALSE
    keyUsage = nonRepudiation, digitalSignature, keyEncipherment
    subjectAltName = @alt_names

    [alt_names]
    DNS.1 = *.api.dev.abc.com
    DNS.2 = *.app.dev.abc.com
""" > ${CONFIG}


openssl genrsa -out ${KEY} 2048
openssl req -new -out ${CSR} -key ${KEY} -config ${CONFIG}
sudo openssl x509 -req -days ${DAYS} -in ${CSR} -signkey ${KEY} -out ${CRT} -extensions v3_req -extfile ${CONFIG}



