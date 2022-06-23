PRAGMA foreign_keys = ON;

DROP TABLE if exists question_follows;
DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists questions;
DROP TABLE if exists users;


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
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    parent_id INTEGER,
     
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)

);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_liked INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_liked) REFERENCES questions(id)
);

INSERT INTO 
users (fname, lname)
VALUES
('Diana', 'Chirica'),
('Victor', 'Cheng')
('Amin','Babar');

INSERT INTO 
questions (title, body, author_id)
VALUES
('SQL', 'Is it going to be on the assessment?', (SELECT id FROM users WHERE fname = 'Diana')),
('SQL', 'Why do we even need foreign keys?', (SELECT id FROM users WHERE fname = 'Victor'));

INSERT INTO 
question_follows (user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'Diana'), (SELECT id FROM questions WHERE id = 1)),
((SELECT id FROM users WHERE fname = 'Victor'), (SELECT id FROM questions WHERE id = 2));

INSERT INTO 
question_likes(user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'Diana'), SELECT question_liked FROM questions WHERE id = 1),
((SELECT id FROM users WHERE fname = 'Victor'), SELECT question_liked FROM questions WHERE id = 2),
((SELECT id FROM users WHERE fname = 'Amin'), SELECT question_liked FROM questions WHERE id = 3);


INSERT INTO
replies (question_id, body, user_id, parent_id)
VALUES
((SELECT id FROM questions WHERE id = 1), 'The logic, and the syntax, will be.', (SELECT id FROM user WHERE id = 3), (SELECT id FROM user WHERE id = 1)),
((SELECT id FROM questions WHERE id = 2), 'To connect the tables.', (SELECT id FROM user WHERE id = 3), (SELECT id FROM user WHERE id = 2)),
((SELECT id FROM questions WHERE id = 2), 'OK.', (SELECT id FROM user WHERE id = 2), (SELECT id FROM user WHERE id = 3));

