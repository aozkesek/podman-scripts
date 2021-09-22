#!/bin/sh

docker run -d --rm \
	--name docdb \
	--network b2192 \
	--hostname my.mongo \
	--ip 192.167.55.160 \
	--volume devopddb:/data/db \
	-e MONGO_INITDB_ROOT_USERNAME=mongodb \
	-e MONGO_INITDB_ROOT_PASSWORD=m-n.g+db \
	mongo:4

