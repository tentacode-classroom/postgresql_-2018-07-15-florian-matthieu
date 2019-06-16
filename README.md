# postgresql_-2018-07-15-florian-matthieu


## Scripts

 **⚠ L'ensemble des scripts sont à exécuter en sudo ⚠** 
 
 Ils doivent être éxecuter dans cet ordre :
 
 1. Pour l'installation et la configuration : `setup_postgresql.sh` puis `update_configuration.sh`
 2. Pour récupérer les données : `import_github.sh`
 3. Créer les rôles : `create_users.sh` 
 **On crée les rôles avant la table pour ne pas avoir à créer de table avec l'utilisateur postgres**
 5. Créer la base : `create_event_database.sh`
 6. Importer le json et l'inserer au format SQL : `populate_raw_events.sh` puis `populate_events.sh`
 7. Générer les statistiques : `create_stats.sh`
 8. Générer les fichiers de backup : `backup.sh`
 
 
### Setup postgresql

Le fichier `setup_postgresql.sh` permet d'installer postgresql, version 11

A la fin de l'installation il renvoie la version :
`psql (PostgreSQL) 11.3 (Debian 11.3-1.pgdg90+1)`


### Import github archive

Le fichier `import_github.sh` permet d'importer l'archive github correspondant au jour donné (ici le 15/07/2018).

Les données sont extraites sous format JSON dans le dossier archive du projet.


### Update configuration

Le fichier `update_configuration.sh` permet d'éditer les fichiers de configuration de base postgresql, ici on modifie le port par défaut : `5432 -> 1234`, et de changer la mémoire allouée.


### Create database

Le fichier `create_event_database` permet de mettre en place notre base de données : elle exécute diverses requêtes pour à la fois créer la base et les tables mais aussi d'insérer des données de tests.
Le script renvoie trois Select attestant la bonne insertion des données au sein de la table.

### Create users
Le fichier `create_users.sh` permet de créer les utilisateurs super_admin et github_events et de les associer à leur base de données et de leur attribuer leurs droits respectifs.

 - super_admin va obtenir les droits d'un *superuser* et est propriétaire de la base de données *super_admin*.
 - github_events va obtenir les droits d'un *utilisateur normal* et est propriétaire de la base de données *github_events* 
 
 

### Populate raw events 
Le fichier `populate_raw_events.sh` permet de créer la table *events_raw* dans laquelle il n'y a qu'une seule colonne contenant les données du fichier JSON au format JSONB.
On insère ensuite les données présentent dans notre `archive` en appelant le script PHP `populate_raw_events.php `.
Puis, il affiche les 10 premières les lignes de notre base de données.



### Populate events
Le fichier `populate_events.sh` va permettre d'insérer les données dans la base de données *github_events* grâce au fichier `populate_events.sql`.


### Views
Le fichier `create_stats.sh` va permettre de créer les vues via le fichier `create_stats.sql`. Il va nous montrer le *PushEvents* qui a le plus de commit, puis le statut de notre *IssuesEvents*.

### Backup
Le fichier `backup.sh` va permettre d'effectuer 2 backups de la table *github_events* :
 - Un de la base de données (table, relation, données)
 - Un pour les rôles.
  
## Dossier SQL

L'ensemble des fichiers sql sont écrits au format SQL pour :

1.  Créer =  `create_database.sql`  : La base de donnée,  `create_users.sql`  : Les rôles et utilisateurs,  `create_stats.sql` : Les Vues
2.  Insérer =  `insert_false_data.sql`  `populate_raw_events.sql` `populate_events.sql`
3.  Modifier les configurations =  `update_configuration.sql`  de la base de données

Ces différents fichiers sont appelés depuis les fichiers scripts.


## Dossier ETC
 Les fichiers présents dans ce dossier sont les copies de nos fichiers `.pgpass` et `pg_hba.conf`.
 Le fichier `pgpass` permet aux utilisateurs de se connecter sans écrire de mot de passe.
 Le fichier `pg_hba.conf`  permet de choisir la façon dont l'utilisateur se connecte aux bases de données.

