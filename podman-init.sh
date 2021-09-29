#!/usr/bin/bash

# create common volumes
#podman volume create devopsc 
#podman volume create devopci 

# create common network
podman network rm podman
podman network create podman \
	--driver bridge \
	--subnet 192.167.55.0/24 \
	--ip-range 192.167.55.129/25 \
	--gateway 192.167.55.1
