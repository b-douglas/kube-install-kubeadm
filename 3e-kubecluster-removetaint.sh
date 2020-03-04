#!/bin/bash

set -e
set -x

kubectl taint nodes --all node-role.kubernetes.io/master-
