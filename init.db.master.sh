#! /bin/bash

set -e 

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    
    CREATE USER replicador REPLICATION LOGIN ENCRYPTED PASSWORD '123456';

    ALTER SYSTEM SET listen_addresses = '*';
    ALTER SYSTEM SET wal_level = 'replica';
    ALTER SYSTEM SET synchronous_commit = 'on';
    ALTER SYSTEM SET max_wal_senders = '10';
    ALTER SYSTEM SET synchronous_standby_names = '*';

    SELECT pg_reload_conf();

EOSQL