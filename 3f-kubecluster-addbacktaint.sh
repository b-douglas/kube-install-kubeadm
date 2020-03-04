#!/bin/bash

set -e 
set -x


kubectl taint nodes $(kubectl get nodes | grep master | awk '{print $1}') node-role.kubernetes.io/master=:NoSchedule


kubectl get nodes -o json | jq '.items[].spec.taints'
