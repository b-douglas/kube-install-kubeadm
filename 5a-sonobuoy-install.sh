#!/bin/bash

set -e
set -x

VERSION=0.16.3 
OS=linux 
INSTALLDIR=/usr/local
sudo mkdir -p $INSTALLDIR/bin
sudo curl -L "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${VERSION}/sonobuoy_${VERSION}_${OS}_amd64.tar.gz" --output $INSTALLDIR/bin/sonobuoy.tar.gz 
sudo tar -xzf $INSTALLDIR/bin/sonobuoy.tar.gz -C $INSTALLDIR/bin 
sudo chmod 755 $INSTALLDIR/bin/sonobuoy 
sudo chown $(id -u):$(id -g) $INSTALLDIR/bin/*
sudo rm $INSTALLDIR/bin/sonobuoy.tar.gz
