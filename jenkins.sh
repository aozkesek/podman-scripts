#!/bin/bash

podman run -d --rm \
	--name jenkinscid \
	--network podman \
	--hostname jenkinscid \
	--dns "192.167.55.1" \
	--ip "192.167.55.130" \
	-p 8080:8080 \
	--replace=true \
	--volume devopci:/var/www/jenkins \
	ao/jenkinscid $1 $2 $3 $4
