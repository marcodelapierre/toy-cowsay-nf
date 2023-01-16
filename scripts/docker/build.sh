#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"

# should NOT need editing
base="$( grep FROM Dockerfile | cut -d ' ' -f 2 )"
manifest="${repo}:${date_tag}"
archs="amd64 arm64-v8"

for a in $archs ; do
    podman pull \
        --platform linux/${a/-/\/} \
        ${base}

    image="${manifest}-linux-${a}"

    podman build \
        --platform linux/${a/-/\/} \
        --no-cache \
        -t ${image} \
        .

    podman push ${image}
done

podman manifest create \
    ${manifest} \
    eval echo ${manifest}-linux-{${archs/ /,}}

podman manifest push \
    ${manifest}
