#!/bin/bash

set -e
set -x

echo "172.30.10.29  kubecp-01" >> /etc/hosts



kubeadm config images pull





