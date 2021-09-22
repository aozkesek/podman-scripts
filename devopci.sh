#!/bin/bash

podman run -it --rm \
	--name devopci \
	--network br192-168 \
	--hostname devopci \
	--dns "192.167.55.1" \
	--ip "192.167.55.130" \
	-p 8010:8010 \
	--replace=true \
	--volume devopci:/var/buildbot \
	ao/devopci $1 $2 $3
