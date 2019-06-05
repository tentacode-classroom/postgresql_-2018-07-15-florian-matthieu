#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Executer script SQL
sudo -u postgres psql -f $DIR/../sql/update_configuration.sql

service postgresql restart

sudo -u postgres psql -c "SELECT name, setting FROM pg_settings WHERE name IN ('port', 'work_mem');"

sudo -u postgres psql -c 'ALTER SYSTEM RESET all'
sudo service postgresql restart
