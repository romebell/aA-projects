PRAGMA foreign_keys = ON;
DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;



CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  UNIQUE (user_id, question_id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)

);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  UNIQUE (user_id, question_id)
);

INSERT INTO 
  users (fname, lname)
VALUES 
  ('Ned', 'Turner'),
  ('Kush', 'Patel'),
  ('Billy', 'Bob');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Where''s pizza?', 'Hungry student needs pizza', 2),
  ('Where''s assessment?', 'Student is ready for test', 3),
  ('Where''s computer?', 'Students needs laptop', 1);

INSERT INTO
  replies (question_id, author_id, body)
VALUES 
  (1, 2, 'Pizza is coming ... tomorrow ... maybe.'),
  (2, 3, 'A03 is on Monday ... maybe.'),
  (3, 1, 'In front of you ... I think.'),
  (3, 1, 'recursion ... I think.');