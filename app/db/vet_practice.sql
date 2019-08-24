DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS pets;

CREATE TABLE vets (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  max_pets INTEGER,
  pet_count INTEGER,
  available_slots INTEGER
);

CREATE TABLE pets (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  specie VARCHAR(255),
  breed VARCHAR(255),
  date_of_birth VARCHAR,
  age INTEGER
);
