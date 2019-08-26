DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS vets;


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
  year_of_birth INTEGER,
  age INTEGER,
  notes VARCHAR(255),
  owner_name VARCHAR(255),
  owner_phone VARCHAR(255),
  owner_address VARCHAR(255),
  vet_id INT4 REFERENCES vets(id) ON DELETE CASCADE
);
