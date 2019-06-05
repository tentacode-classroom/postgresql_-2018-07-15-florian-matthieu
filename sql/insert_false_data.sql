\connect "github_events";
INSERT INTO "actor" (id, login, display_login, gravatar_id, url, avatar_url) VALUES (1, 'Zywoo', 'Zywoo', NULL, 'teambigd.eu', 'teambigd.eu');
INSERT INTO "repo" (id, name, url) VALUES (1, 'Zinedine', 'teambigd.eu');
INSERT INTO "watch_events" (id, id_actor, id_repo, public_status, created_at, action) VALUES (1, 1, 1, true, '2018-07-15T12:00:01Z', 'started') ;

SELECT * FROM "watch_events";
