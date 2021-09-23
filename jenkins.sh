#!/bin/bash

podman run -d --rm \
	--name jenkinsci \
	--network br192-168 \
	--hostname jenkinsci \
	--dns "192.167.55.1" \
	--ip "192.167.55.130" \
	-p 8080:8080 \
	--replace=true \
	--volume devopci:/var/www/jenkins \
	ao/devopci-jenkins
