#!/bin/bash

podman run -it --rm \
	--name devopcicli \
	--network br192-168 \
	--hostname devopcicli \
	--dns "192.167.55.1" \
	--ip "192.167.55.131" \
	--replace=true \
	--volume devopci:/var/gocd \
	ao/devopci "/bin/sh"


