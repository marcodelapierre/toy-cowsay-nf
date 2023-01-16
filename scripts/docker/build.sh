#!/bin/bash

# may need editing
repo="quay.io/marcodelapierre/cowsay"
date_tag="2023.01"
suffix=""
archs="amd64 arm64"

# should NOT need editing
image="${repo}:${date_tag}${suffix}"
os="linux"

docker build -t ${image} .
docker push ${image}
