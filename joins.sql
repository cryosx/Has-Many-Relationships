\c has_many_blogs has_many_user;

-- 1
SELECT *
FROM users;

-- 2
SELECT *
FROM posts
WHERE user_id = 100;

-- 3
SELECT users.first_name, users.last_name, posts.*
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.id = 200;

-- 4
SELECT users.username, posts.*
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- 5
SELECT DISTINCT username
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE posts.created_at > '2015-01-01';

-- 6
SELECT username, title, content
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.created_at < '2015-01-01';

-- 7
SELECT posts.title AS "Post Title", comments.*
FROM comments
INNER JOIN posts ON posts.id = comments.post_id;

-- 8
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE posts.created_at < '2015-01-01';

-- 9
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE posts.created_at > '2015-01-01';

-- 10
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE comments.body LIKE '%USB%';

-- 11
SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
INNER JOIN users ON users.id = comments.user_id
WHERE comments.body LIKE '%matrix%';

-- 12
SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
INNER JOIN users ON users.id = comments.user_id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- 13
SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users.username AS comment_author_username, comments.body AS comment_body
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
INNER JOIN users ON users.id = comments.user_id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

-- 14
SELECT COUNT(*)
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
WHERE posts.created_at > '2015-07-14';

-- 15
SELECT DISTINCT users.username
FROM users
INNER JOIN comments ON comments.user_id = users.id
WHERE comments.body LIKE '%programming%';


