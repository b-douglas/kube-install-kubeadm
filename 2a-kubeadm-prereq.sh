#!/bin/bash

set -e
set -x

if [ -f "/etc/kubeadm.prereq.isrun" ]; then
    echo "$FILE exists"
    exit 1
else
	echo 'Proceeding to turn off swap'
fi

#Turning SWAP off
sudo swapoff -a
sudo cp /etc/fstab /etc/fstab.kubeadm.backup || FALSE
sudo bash -c 'egrep -vi swap /etc/fstab.kubeadm.backup > /etc/fstab'

# ensure legacy binaries are installed
sudo apt-get install -y iptables arptables ebtables

sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy

#Adding final done file
sudo bash -c 'echo "true" > /etc/kubeadm.prereq.isrun'
