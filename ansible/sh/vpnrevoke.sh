#!/bin/bash
USERLIST="/home/afif/ovpnrevoke.txt"
EASYRSA_DIR="/home/afif/openvpn-ca"
EASYRSA_VARS="/home/afif/openvpn-ca/vars"
EASYRSA_CLIENT_CONFIG="/home/afif/client-configs"

source .$EASYRSA_VARS > /dev/null 2>&1

for i in $(cat $USERLIST)
do
    echo "revoking ovpn user $i"
    cd $EASYRSA_DIR
    ./revoke-full $i > /dev/null 2>&1
    sleep 1
done