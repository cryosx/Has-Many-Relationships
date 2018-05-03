\c has_many_blogs has_many_user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE IF NOT EXISTS users
(
  id serial NOT NULL PRIMARY KEY,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS posts
(
  id serial NOT NULL PRIMARY KEY,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id integer NOT NULL REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS comments
(
  id serial PRIMARY KEY,
  body character varying(510) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id integer NOT NULL REFERENCES users (id),
  post_id integer NOT NULL REFERENCES posts (id)
);

\i scripts/blog_data.sql