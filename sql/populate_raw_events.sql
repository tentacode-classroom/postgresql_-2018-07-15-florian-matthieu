\connect github_events

DROP TABLE IF EXISTS "events_raw";
CREATE TABLE "events_raw"(
  data_json		jsonb
);

SELECT * FROM "events_raw";
