#!/bin/bash

set -e 
set -x

if [ -f "/etc/kubeadm.prereq.isrun" ]; then
    echo "$FILE exists"
    exit 1
else
	sudo echo "true" > /etc/kubeadm.prereq.isrun
fi

#Turning SWAP off
sudo swapoff -a
sudo cp /etc/fstab /etc/fstab.kubeadm.backup || FALSE
sudo egrep -vi swap /etc/fstab > /etc/fstab

sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy
