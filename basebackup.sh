#! /bin/bash

echo "parando o serviço do postgresql"
/etc/init.d/postgresql stop

echo "remover a pasta data existente do postgresql"
rm -rf /var/lib/postgresql/data/*

echo "inicializando o base backup"
pg_basebackup -R -h master -U replicador -D /var/lib/postgresql/data -P

echo "terminado a rotina de backup"
