DROP VIEW most_commits;

CREATE VIEW most_commits AS SELECT push_events.id, name as repo_name, login AS user, created_at, branch, commit_count FROM push_events INNER JOIN repo ON push_events.id_repo = repo.id INNER JOIN actor ON push_events.id_actor = actor.id ORDER BY commit_count DESC LIMIT 15;

SELECT * FROM most_commits;
