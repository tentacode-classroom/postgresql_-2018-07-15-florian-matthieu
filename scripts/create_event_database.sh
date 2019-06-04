#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Executer script SQL
sudo -u postgres psql -f $DIR/../sql/create_database.sql 
