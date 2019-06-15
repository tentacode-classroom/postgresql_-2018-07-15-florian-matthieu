#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rm -rf $DIR/../backup
mkdir -p $DIR/../backup
#Sauvegarde de la base de donnée github_events
pg_dump --username=super_admin github_events -f $DIR/../backup/backup_github_events.sql

#Sauvegarde des roles uniquement
pg_dumpall --roles-only --username=super_admin -f $DIR/../backup/roles.sql
