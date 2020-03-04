#!/bin/bash

set -e
set -x

curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
