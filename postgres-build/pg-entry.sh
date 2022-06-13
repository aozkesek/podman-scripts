#!/bin/bash
HBA=$PGDATA/pg_hba.conf

chown -R postgres "$PGDATA"
if [ -z "$(ls -A "$PGDATA")" ]; then
    su postgres -c 'initdb'
    cp $HBA $HBA.org
fi
cp $HBA.org $HBA
echo "host all all $HOSTNAME trust" >> $HBA
su postgres -c 'postgres -h $HOSTNAME -s -i -p 5432 -d 4'
