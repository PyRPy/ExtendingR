-- use python with postgreSQL
CREATE EXTENSION plpython3u;


SELECT name, default_version, installed_version 
FROM pg_available_extensions 
WHERE name LIKE('plpy*');