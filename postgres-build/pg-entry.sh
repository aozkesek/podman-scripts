#!/bin/bash
chown -R postgres "$PGDATA"
if [ -z "$(ls -A "$PGDATA")" ]; then
    su postgres -c 'initdb'
    echo "host all all $HOSTNAME trust" >> $PGDATA/pg_hba.conf
fi
su postgres -c 'postgres -h $HOSTNAME -s -i -p 5432 -d 4'
