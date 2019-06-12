#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Executer script SQL
psql --username=super_admin -f $DIR/../sql/create_database.sql

psql --username=super_admin -f $DIR/../sql/insert_false_data.sql

