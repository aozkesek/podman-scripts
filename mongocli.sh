#!/bin/sh

CMD="mongo --host my.mongo -u mongodb -p m-n.g+db"

docker run -it --rm --network br192 \
	--hostname my.mongocli --ip 192.168.2.11 \
	mongo:4 $CMD

