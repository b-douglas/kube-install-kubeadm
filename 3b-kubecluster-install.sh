#!/bin/bash

set -e
set -x
set -u

HOST=$1
IFHOME=$2

if [ "${IFHOME}" == "true" ]; then
	# If you are in a home network using 192.168.1.1 then the regular CIDR will mess you up.
	# Use the 10.168 CIDR instead
	sudo kubeadm init --control-plane-endpoint=${HOST} --node-name=${HOST}  --pod-network-cidr=10.168.0.0/16
else
	#NOTE we are setting  CIDR to 192.168.0.0/16 for Calico
	# Using the default means we don't need to update the CIDR in calico.yml
	sudo kubeadm init --control-plane-endpoint=${HOST} --node-name=${HOST}  --pod-network-cidr=192.168.0.0/16
fi
