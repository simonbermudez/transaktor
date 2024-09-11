#!/bin/bash

docker compose exec db pg_dumpall -c -U user > backups/dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql

# RESTORE
# cat dump_2024-09-11_10_48_45.sql | docker exec -i transactions_project-db-1 psql -U user -d transactions_db