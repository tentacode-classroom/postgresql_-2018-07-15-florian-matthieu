#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

psql --username=github_events -f  $DIR/../sql/create_stats.sql
