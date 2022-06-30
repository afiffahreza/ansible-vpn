#!/bin/bash
USERLIST="/home/afif/ovpnuser.txt"
EASYRSA_DIR="/home/afif/openvpn-ca"
EASYRSA_VARS="/home/afif/openvpn-ca/vars"
EASYRSA_CLIENT_CONFIG="/home/afif/client-configs"

source .$EASYRSA_VARS > /dev/null 2>&1

LOC=$(pwd)
cd $EASYRSA_DIR && echo "dir moved"
. $EASYRSA_VARS && echo "source loaded"
cd $LOC && echo "dir returned"

for i in $(cat $USERLIST)
do
    cd $EASYRSA_DIR
    ./build-key-pass --batch $i
    sleep 1
    cd $EASYRSA_CLIENT_CONFIG
    ./make_config.sh $i
    sleep 1
done