#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"
suffix=""
archs="amd64 arm64"

# should NOT need editing
manifest="${repo}:${date_tag}${suffix}"

podman manifest create \
    ${manifest} \
    eval echo ${manifest}-linux-{${archs/ /,}}

podman manifest push ${manifest} docker://${manifest}
