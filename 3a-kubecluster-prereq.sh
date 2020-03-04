#!/bin/bash

set -e
set -x
set -u

IP=$1
HOST=$2

sudo bash -c "echo \"$IP $HOST\" >> /etc/hosts"

sudo kubeadm config images pull





