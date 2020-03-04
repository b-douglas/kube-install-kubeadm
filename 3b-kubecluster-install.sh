#!/bin/bash

set -e
set -x



kubeadm init --control-plane-endpoint=kubecp-01 --node-name=kubecp-01  --pod-network-cidr=192.168.0.0/16
