#!/bin/bash

docker compose exec db pg_dumpall -c -U user > backups/dump_`date +%Y-%m-%d"_"%H_%M_%S`.sql