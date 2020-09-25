DROP DATABASE IF EXISTS application_tracker;
CREATE DATABASE application_tracker;

\c application_tracker

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  password_digest VARCHAR(60)
);


CREATE TABLE jobs(
  id SERIAL PRIMARY KEY,
  company TEXT,
  title TEXT,
  description TEXT,
  date DATE,
  user_id INTEGER REFERENCES users(id)
);

