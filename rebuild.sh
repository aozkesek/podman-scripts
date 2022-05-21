#!/usr/bin/bash

usage()
{
    echo $1
    echo "rebuild.sh <image-name[:version]> <build-source-folder>"
    exit 1
}

if [[ "$1" == "" ]]; then usage "image-name missed"; fi
if [[ "$2" == "" ]]; then usage "build-source-folder missed"; fi

if [[ -d "$2" ]]; then
    #delete if it exists
    if [[ "$3" == "--delete" ]]; then
	podman image exists $1 && podman image rm --force $1
    fi
    # then re-build
    podman build $2 --tag $1
else
    usage "$2 does not exist"
fi
