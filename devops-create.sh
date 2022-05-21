#!/usr/bin/bash

# pod
POD="-n devops -p 8080-8081:8080-8081"

# containers
SCM="--pod devops --replace --name giteascm -v vol_giteascm_data:/var/gitrepo"
CID="--pod devops --replace --name jenkinscid -v vol_jenkinsci_data:/var/www/jenkins"
VOL="-v vol_stock_apps:/apps"

# create a pod named devops if it doesn't exist
podman pod exists devops || podman pod create $POD

#podman pod inspect devops|grep "giteascm" || 
podman create $SCM ao/giteascm:alpine
#podman pod inspect devops|grep "jenkinscid" || 
podman create $CID $VOL ao/jenkinsci:alpine
