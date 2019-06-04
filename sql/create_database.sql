DROP DATABASE IF EXISTS "github_events";

CREATE DATABASE "github_events";
\connect "github_events";


CREATE TABLE "actor" (
  id 			integer PRIMARY KEY,
  login			varchar(255),
  display_login		varchar(255),
  gravatar_id		integer,
  url			varchar(255),
  avatar_url		varchar(255)
);

CREATE TABLE "repo" (
  id			integer PRIMARY KEY,
  name			varchar(255),
  url			varchar(255)
);

CREATE TABLE "events" (
  id    		integer PRIMARY KEY,
  id_actor      	integer REFERENCES actor,
  id_repo       	integer REFERENCES repo,
  public_status        	boolean,
  created_at    	timestamp
);

CREATE TABLE "watch_events" (
  action		varchar(255)
) INHERITS ("events");

CREATE TABLE "push_events" (
  ref			varchar(255),
  size			integer
) INHERITS ("events");
