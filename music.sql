-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT UNIQUE NOT NULL,
   --each song has one title date and each title has one song (one to one)
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
  --each song has one release date but each release date could have many songs (one to many)
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  -- songs_id INTEGER REFERENCES songs ON DELETE SET NULL,
  --each artist has many songs each song can have many artists many to many 
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs ON DELETE CASCADE,
  artists_id INTEGER REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
  --each album has many songs and each song could be in many albums (many to many)
  -- songs_id INTEGER REFERENCES songs ON DELETE SET NULL,
);

CREATE TABLE songs_albums
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs ON DELETE CASCADE,
  albums_id INTEGER REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  --each song could have many producers and each producer could have many songs (many to many )
  -- songs_id INTEGER REFERENCES songs ON DELETE SET NULL,
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs ON DELETE CASCADE,
  producers_id INTEGER REFERENCES producers ON DELETE CASCADE
);


INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('MMMBop', 238, '04-15-1997'),
  ('Bohemian Rhapsody', 355, '10-31-1975'),
  ('One Sweet Day', 282, '11-14-1995'),
  ('Shallow', 216, '09-27-2018'),
  ('How You Remind Me', 223, '08-21-2001'),
  ('New York State of Mind', 276, '10-20-2009'),
  ('Dark Horse', 215, '12-17-2013'),
  ('Moves Like Jagger', 201, '06-21-2011'),
  ('Complicated', 244, '05-14-2002'),
  ('Say My Name', 240, '11-07-1999');


INSERT INTO artists
  (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'), 
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'), 
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'), 
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');


INSERT INTO albums
  (name)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

    INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');
