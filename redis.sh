#!/bin/sh

REDIS_DIR="$HOME/workspaces/docker/dredis/conf"
CMD="redis-server /usr/local/etc/redis/redis.conf"

docker run -d --rm --name cachedb --network br192 \
	--hostname my.redis --ip 192.168.2.5 \
	-v $REDIS_DIR:/usr/local/etc/redis \
	redis:alpine $CMD
	
	
	
	
