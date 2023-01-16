#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"
archs="amd64 arm64"

# should NOT need editing
manifest="${repo}:${date_tag}"
plat="$( podman info | grep OsArch | cut -d ' ' -f 4 )"
arch="$( echo $plat |cut -d / -f 2 )"
suffix="-${plat/\//-}"

image="${manifest}${suffix}"
podman build -t ${image} .
podman push ${image}
