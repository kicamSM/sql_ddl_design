-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL 
  --each planet has one galaxy but one galaxy can have many planets (one to many)
  --each planet orbits around one star but each star can many planets orbiting around (one to many)
);

CREATE TABLE orbital_stars
(
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
  -- this one probably didn't need to be its own table but I decided to seperate it becuase its talking about stars and I thought this might be more clear
);

CREATE TABLE planets_oribital_stars
(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets ON DELETE CASCADE,
  orbital_stars_id INTEGER REFERENCES orbital_stars ON DELETE CASCADE
);


CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT
  --this one did need to be seperated because one planet can have many moons and one moon can have many planets (many to many relationship)
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets ON DELETE CASCADE,
  moons_id INTEGER REFERENCES moons ON DELETE CASCADE
);



INSERT INTO planets
  (name, galaxy)
VALUES
  ('Earth', 'Milky Way'),
  ('Mars', 'Milky Way'),
  ('Venus', 'Milky Way'),
  ('Neptune', 'Milky Way'),
  ('Proxima Centauri b', 'Milky Way'),
  ('Gliese 876 b', 'Milky Way');

  
INSERT INTO orbital_stars
  (orbital_period_in_years, orbits_around)
  VALUES
  (1.00, 'The Sun'),
  (1.88, 'The Sun'),
  (0.62, 'The Sun'),
  (164.8, 'The Sun'),
  (0.03, 'Proxima Centauri'),
  (0.23, 'Gliese 876');

    
INSERT INTO moons
  (name)
  VALUES
  ('{"The Moon"}'),
  ('{"Phobos", "Deimos"}'),
  ('{}'),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('{}'),
  ('{}');