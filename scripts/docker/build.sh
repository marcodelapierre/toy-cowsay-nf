#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"
suffix=""
archs="amd64 arm64"

# should NOT need editing
manifest="${repo}:${date_tag}${suffix}"
os="linux"

for arch in $archs ; do
    plat="${os}/${arch}"
    platsuffix="-${plat/\//-}"

    image="${manifest}${platsuffix}"
    docker build --platform ${plat} -t ${image} .
    docker push ${image}
done

docker manifest create \
    ${manifest} \
    eval echo ${manifest}-linux-{${archs/ /,}}

docker manifest push ${manifest}
