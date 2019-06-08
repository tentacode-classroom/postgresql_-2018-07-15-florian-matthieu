\connect "github_events";
INSERT INTO "actor" (id, login, display_login, url, avatar_url) VALUES (1, 'Zywoo', 'Zywoo','hltv.org', 'hltv.org');
INSERT INTO "repo" (id, name, url) VALUES (1, 'Zinedine', 'hltv.org');
INSERT INTO "issue"(id, title, state) VALUES (1, 'Issue random', 'open');
INSERT INTO "watch_events" (id, id_actor, id_repo, public_status, created_at, action) VALUES (1, 1, 1, true, '2018-07-15T12:00:01Z', 'started') ;
INSERT INTO "issue_events" (id, id_actor, id_repo, public_status, created_at, id_issue, action) VALUES (1, 1, 1, true, '2018-07-15T12:00:01Z', 1, 'opened');
INSERT INTO "push_events" (id, id_actor, id_repo, public_status, created_at, branch, commit_count) VALUES (1, 1, 1, true, '2018-07-15T12:00:01Z', 'branch-example', 5);

SELECT * FROM "watch_events";
SELECT * FROM "issue_events";
SELECT * FROM "push_events";
