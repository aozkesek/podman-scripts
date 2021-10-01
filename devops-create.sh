#!/usr/bin/bash

# define command line options
OPS="--pod devops"
SCM="--name giteascm -v scm_data:/var/gitrepo"
CID="--name jenkinscid -v cid_data:/var/www/jenkins"

# create a pod named devops if it doesn't exist
podman pod exists devops || podman pod create -n devops -p "8080:8080" -p "8081:8081"

# create devops containers if they don't exist
podman pod inspect devops|grep "giteascm" || podman create $OPS $SCM ao/giteascm
podman pod inspect devops|grep "jenkinscid" || podman create $OPS $CID ao/jenkinscid

