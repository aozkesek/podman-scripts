#!/bin/bash

podman run -it --rm \
	--name devopsc \
	--network br192-168 \
	--hostname devopsc \
	--dns "192.167.55.1" \
	--ip "192.167.55.140" \
	-p 8080:8080 \
	--replace=true \
	--volume devopsc:/var/gitrepo \
	ao/devopsc
