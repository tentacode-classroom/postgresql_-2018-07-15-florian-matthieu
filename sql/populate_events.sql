\connect github_events

TRUNCATE TABLE actor CASCADE;
TRUNCATE TABLE repo CASCADE;
TRUNCATE TABLE push_events CASCADE;

INSERT INTO actor (id, login, display_login, url, avatar_url)
SELECT CAST (data_json -> 'actor' ->> 'id' AS BIGINT), CAST(data_json -> 'actor' -> 'login' AS VARCHAR), CAST (data_json -> 'actor' -> 'display_login' AS VARCHAR), CAST (data_json -> 'actor' -> 'url' AS VARCHAR), CAST (data_json -> 'actor' -> 'avatar_url' AS VARCHAR)
FROM events_raw
ON CONFLICT DO NOTHING;
 
INSERT INTO repo (id, name, url)
SELECT CAST (data_json -> 'repo' -> 'id' AS BIGINT), CAST (data_json -> 'repo' -> 'name' AS VARCHAR), CAST (data_json -> 'repo' -> 'url' AS VARCHAR)
FROM events_raw
ON CONFLICT DO NOTHING;

INSERT INTO push_events ( id, id_actor, id_repo, public_status, created_at, branch, commit_count)
SELECT CAST (data_json ->> 'id' AS BIGINT), CAST (data_json -> 'actor' -> 'id' AS BIGINT), CAST(data_json -> 'repo' -> 'id' AS BIGINT), CAST (data_json -> 'public' AS BOOLEAN), CAST (data_json ->> 'created_at' AS TIMESTAMP), CAST (data_json -> 'payload' -> 'ref' AS VARCHAR), CAST (data_json -> 'payload' -> 'size' AS INTEGER)
FROM events_raw
WHERE data_json ->> 'type' = 'PushEvent';
