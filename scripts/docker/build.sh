#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"
suffix=""
archs="amd64 arm64"

# should NOT need editing
manifest="${repo}:${date_tag}${suffix}"
plat="$( podman info | grep OsArch | cut -d ' ' -f 4 )"
arch="$( echo $plat |cut -d / -f 2 )"
archsuffix="-${plat/\//-}"
if [ "$arch" == "arm64" ] ; then
    podman="podman"
else
    podman="docker"
fi

image="${manifest}${archsuffix}"
$podman build -t ${image} .
$podman push ${image}
