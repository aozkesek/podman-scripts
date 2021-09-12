#!/bin/bash

podman run -it --rm \
	--name bash-cli \
	--network br192-168 \
	--hostname bashcli \
	--dns "192.167.55.1" \
	--ip "192.167.55.150" \
	--replace=true \
	ao/devop:f34 \
	"/usr/bin/bash"