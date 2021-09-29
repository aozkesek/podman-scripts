#!/bin/bash

podman run -d --rm \
	--name giteascm \
	--network podman \
	--hostname giteascm \
	--dns "192.167.55.1" \
	--ip "192.167.55.140" \
	-p 8081:8081 \
	--replace=true \
	--volume devopsc:/var/gitrepo \
	ao/giteascm $1 $2 $3 $4
