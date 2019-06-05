#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Executer script SQL
sudo -u postgres psql -f $DIR/../sql/populate_raw_events.sql
