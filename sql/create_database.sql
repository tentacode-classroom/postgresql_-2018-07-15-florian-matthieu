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

CREATE TABLE "issue" (
  id			integer PRIMARY KEY,
  title			varchar(255),
  state			varchar(255)
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
  branch		varchar(255),
  commit_count		integer
) INHERITS ("events");

CREATE TABLE "issue_events" (
  id_issue		integer REFERENCES issue,
  action		varchar(255)
) INHERITS ("events");
