#!/bin/bash

set -e
set -u 

IFHOME=${1:-false}

curl https://docs.projectcalico.org/manifests/calico.yaml -O

if [ "$IFHOME" == "true" ]; then
	sed -i.bak s#192.168.0.0\/16#10.168.0.0\/16#g calico.yaml
	egrep --color -A 1 CALICO_IPV4POOL_CIDR calico.yaml
else
	echo 'Keeping existing CIDR'
	egrep --color -A 1 CALICO_IPV4POOL_CIDR calico.yaml
fi

kubectl apply -f calico.yaml
