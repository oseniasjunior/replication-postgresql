#! /bin/bash

rm -rf /var/lib/postgresql/data/*
pg_basebackup -R -h master -U replicador -D /var/lib/postgresql/data -P
/usr/local/bin/docker-entrypoint.sh postgres 
