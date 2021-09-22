#!/bin/sh

CMD="redis-cli -h my.redis"

docker run -it --rm --network br192 \
	--hostname my.rediscli --ip 192.168.2.10 \
	redis:alpine $CMD
	
	
	
