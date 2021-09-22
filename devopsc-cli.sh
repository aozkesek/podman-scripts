#!/bin/bash

podman run -it --rm \
	--name devopsccli \
	--network br192-168 \
	--hostname devopsc \
	--dns "192.167.55.1" \
	--ip "192.167.55.141" \
	--replace=true \
	--volume devopsc:/var/gitrepo \
	ao/devopsc "/bin/sh"
