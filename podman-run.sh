#!/bin/bash

podman run -it --rm --replace=true --name $1 ao/$1$2 $3
