#!/bin/bash

set -u 
set -e
set -x

CP=$1
NODE=$2
TOKEN=$3
SHA=$5

sudo kubeadm join ${CP}:6443  --node-name ${NODE} --token ${TOKEN} --discovery-token-ca-cert-hash ${SHA}
