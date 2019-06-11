#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


#Sauvegarde de la base de donnée github_events
pg_dump --username=super_admin github_events -f $DIR/../backup/backup_github_events.sql

#Sauvegarde des roles uniquement
pg_dumpall --roles-only --username=super_admin -f $DIR/../backup/roles.sql

#On supprime la base de données
psql --username=super_admin -c "DROP DATABASE github_events"


#On restore la base de données supprimer
psql --username=super_admin -f ./backup/backup_github_events.sql

#On vérifie que les données ont bien été restoré
psql --username=super_admin -c "SELECT * FROM events_raw LIMIT 10"
