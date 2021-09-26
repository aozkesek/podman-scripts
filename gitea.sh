#!/bin/bash

podman run -d --rm \
	--name giteasc \
	--network br192-168 \
	--hostname giteasc \
	--dns "192.167.55.1" \
	--ip "192.167.55.140" \
	-p 8081:8081 \
	--replace=true \
	--volume devopsc:/var/gitrepo \
	ao/gitea-sc:alpine3 $1 $2 $3 $4
