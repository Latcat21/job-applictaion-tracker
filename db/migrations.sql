DROP DATABASE IF EXISTS application_tracker;
CREATE DATABASE application_tracker;

\c application_tracker

CREATE TABLE jobs(
  id SERIAL PRIMARY KEY,
  title TEXT,
  description TEXT,
  date TEXT
);