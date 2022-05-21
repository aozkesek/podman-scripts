#!/usr/bin/bash

# pod
POD="-n devops -p 8080-8081:8080-8081"
VOL_SCD=vol_giteascm_data
VOL_CID=vol_jenkinsci_data

# containers
SCM="--pod devops --replace --name giteascm -v $VOL_SCD:/var/gitrepo"
CID="--pod devops --replace --name jenkinscid -v $VOL_CID:/var/www/jenkins"
VOL="-v vol_stock_apps:/apps"

# create a pod named devops if it doesn't exist
echo "checking | creating devops pod..."
podman pod exists devops || podman pod create $POD
echo "checking | creating $VOL_CID volume..."
podman volume exists $VOL_CID || podman volume create $VOL_CID
echo "checking | creating $VOL_SCD volume..."
podman volume exists $VOL_SCD || podman volume create $VOL_SCD

echo "checking | creating giteascm..."
#podman pod inspect devops|grep "giteascm" || 
podman create $SCM ao/giteascm:alpine

echo "checking | creating jenkinsci..."
#podman pod inspect devops|grep "jenkinscid" ||
podman create $CID $VOL ao/jenkinsci:alpine
