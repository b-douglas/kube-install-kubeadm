#!/bin/bash

set -e
set -x
set -u

HOST=$1

#NOTE we are setting  CIDR to 192.168.0.0/16 for Calico
# Using the default means we don't need to update the CIDR in calico.yml
sudo kubeadm init --control-plane-endpoint=${HOST} --node-name=${HOST}  --pod-network-cidr=192.168.0.0/16
