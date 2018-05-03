
DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\i has_many_blogs.sql;