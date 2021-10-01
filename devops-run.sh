#!/usr/bin/bash

# define command line options
OPS=" -d --replace --rm "
GITEA="--name giteascm -v scm_data:/var/gitrepo -h giteascm --expose 8081 -p 8081:8081 "
JENKINS="--name jenkinscid -v cid_data:/var/www/jenkins -h jenkinscid -p 8080:8080 "

podman run $OPS $GITEA ao/giteascm && \
podman run $OPS $JENKINS ao/jenkinscid

