#!/usr/bin/bash

OPS="-n devops -p 8080:8080 -p 8081:8081"
SCM="--pod devops --name giteascm -v scm_data:/var/gitrepo"
CID="--pod devops --name jenkinscid -v cid_data:/var/www/jenkins"

# create a pod named devops if it doesn't exist
podman pod exists devops || podman pod create $OPS

# create devops containers if they don't exist
podman pod inspect devops|grep "giteascm" || podman create $SCM ao/giteascm
podman pod inspect devops|grep "jenkinscid" || podman create $CID ao/jenkinscid

