DROP DATABASE super_admin;
DROP ROLE super_admin;

CREATE ROLE super_admin LOGIN PASSWORD '12345' SUPERUSER;
CREATE DATABASE super_admin OWNER super_admin;
