ALTER SYSTEM SET PORT = "1234";
ALTER SYSTEM SET work_mem = '50MB';
SELECT name, setting FROM pg_settings WHERE name LIKE 'port' OR name LIKE 'work_mem';
