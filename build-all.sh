#!/usr/bin/bash

# $1 : --delete if you want to delete and re-create the images

clear

echo "re-building ao/alpine:3 ..."
sh rebuild.sh ao/alpine:3 alpine3-build $1
if [[ "$?" != "0" ]]; then exit 1; fi

echo "re-building ao/giteascm:alpine ..."
sh rebuild.sh ao/giteascm:alpine gitea-build $1
if [[ "$?" != "0" ]]; then exit 1; fi

echo "re-building ao/devops:alpine ..."
sh rebuild.sh ao/devops:alpine devops-build $1
if [[ "$?" != "0" ]]; then exit 1; fi

echo "re-building ao/devops:alpine ..."
sh rebuild.sh ao/jenkinsci:alpine jenkins-build $1
if [[ "$?" != "0" ]]; then exit 1; fi

podman images
