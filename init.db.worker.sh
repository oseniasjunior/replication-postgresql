#! /bin/bash

set -e 

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    
    ALTER SYSTEM SET listen_addresses = '*';
    ALTER SYSTEM SET hot_standby = 'on';    
    
    SELECT pg_reload_conf();
EOSQL