#!/usr/bin/bash

# pod
POD="-n stocks -p 6380:6380"

# containers 
RDS="--pod stocks --replace --name redissrv -v vol_stock_redis_data:/data "
PGS="--pod stocks --replace --name postgresrv -v vol_stock_pg_data:/var/data "
APP="--pod stocks --replace --name stockapp -v vol_stock_apps:/apps --expose 6380"
ARG="--env APP_OPTS=\"-Dserver.port=6380\""

# stocks app
CMD="/apps/stocks/app/bin/app "

podman pod exists stocks || podman pod create $POD
podman create $RDS redis:alpine
podman create $PGS postgres:alpine
podman create $APP $ARG ao/appserver:3.11 $CMD

