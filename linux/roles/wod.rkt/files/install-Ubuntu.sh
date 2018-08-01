#!/bin/bash

set -e

HTTP_SERVER="${HTTP_SERVER:-http://k8s.spacecig.com/softs/k8s}"
DEB_RKT="${DEB_RKT:-rkt_1.29.0-1_amd64}"

mkdir -p /etc/kubernetes/downloads

if ! [ -x "$(command -v rkt)" ]; then
    if ! [[ -e /etc/kubernetes/downloads/$DEB_RKT.deb ]]; then
        curl $HTTP_SERVER/$DEB_RKT.tgz > /etc/kubernetes/downloads/$DEB_RKT.tgz
        cd /etc/kubernetes/downloads && tar -xzf /etc/kubernetes/downloads/$DEB_RKT.tgz
        rm -rf /etc/kubernetes/downloads/$DEB_RKT.tgz
    fi
    dpkg -i /etc/kubernetes/downloads/$DEB_RKT.deb
fi