#!/usr/bin/bash

# pod
POD="-n devops -p 8080-8081:8080-8081"

# containers
SCM="--pod devops --replace --name giteascm -v scm_data:/var/gitrepo"
CID="--pod devops --replace --name jenkinscid -v cid_data:/var/www/jenkins"
VOL="-v stock_apps:/apps"

# create a pod named devops if it doesn't exist
podman pod exists devops || podman pod create $POD

#podman pod inspect devops|grep "giteascm" || 
podman create $SCM ao/giteascm
#podman pod inspect devops|grep "jenkinscid" || 
podman create $CID $VOL ao/jenkinscid
