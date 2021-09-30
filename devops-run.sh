#!/usr/bin/bash

# define command line options
OPS=" -d --replace --rm "
GITEA="--name giterascm -v scm_data:/var/gitrepo -p 8081:8081 "

podman run $OPS $GITEA ao/giteascm 
