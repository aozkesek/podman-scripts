#!/usr/bin/bash

usage()
{
    echo "rebuild.sh <image-name[:version]> <build-source-folder>"
    exit 1
}

if [[ "$1" == "" ]]; then usage; fi
if [[ "$2" == "" ]]; then usage; fi

if [[ -d "$2" ]]; then
    #delete if it exists
    podman image exists $1 && podman image rm --force $1
    # then re-build
    podman build $2 --tag $1
else
    usage
fi
