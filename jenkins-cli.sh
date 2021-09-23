#!/bin/bash

podman run -it --rm \
	--name jenkinscicli \
	--network br192-168 \
	--hostname jenkinscicli \
	--dns "192.167.55.1" \
	--ip "192.167.55.131" \
	--replace=true \
	--volume devopci:/var/www/jenkins \
	ao/devopci-jenkins ash
