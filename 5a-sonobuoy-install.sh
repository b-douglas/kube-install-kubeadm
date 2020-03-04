#!/bin/bash

set -e
set -x


VERSION=0.16.3 
OS=linux 
INSTALLDIR=/usr/local
mkdir -p $INSTALLDIR/bin
curl -L "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${VERSION}/sonobuoy_${VERSION}_${OS}_amd64.tar.gz" --output $INSTALLDIR/bin/sonobuoy.tar.gz 
tar -xzf $INSTALLDIR/bin/sonobuoy.tar.gz -C $INSTALLDIR/bin 
chmod 755 $INSTALLDIR/bin/sonobuoy 
chown ubuntu:ubuntu $INSTALLDIR/bin/*
rm $INSTALLDIR/bin/sonobuoy.tar.gz
