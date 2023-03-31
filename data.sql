/* Populate database with sample data. */

-- Insert Agumon

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);

-- Insert Gabumon

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);

-- Insert Pikachu

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);

-- Insert Devimon

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11);

-- Insert remaining animals

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES
    (1, 'Charmander', '2020-02-08', 0, FALSE, -11),
    (2, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),
    (3, 'Squirtle', '1993-04-02', 3, FALSE, -12.13),
    (4, 'Angemon', '2005-06-12', 1, TRUE, -45),
    (5, 'Boarmon', '2005-06-07', 7, TRUE, 20.4),
    (6, 'Blossom', '1998-10-13', 3, TRUE, 17),
    (7, 'Ditto', '2022-05-14', 4, TRUE, 22);

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

-- Modify animals table to add the species_id column
ALTER TABLE animals ADD COLUMN species_id INTEGER;

-- Set the species_id for each animal based on the name
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

-- Modify animals table to add the owner_id column
ALTER TABLE animals ADD COLUMN owner_id INTEGER;

-- Set the owner_id for each animal based on the owner's name
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(species_id, vet_id)
VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Agumon'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Agumon'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2020-07-22'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Gabumon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2021-02-02'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-01-05'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-03-08'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Pikachu'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-05-14'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Devimon'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2021-05-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Charmander'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2021-02-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-12-21'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2020-08-10'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Plantmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2021-04-07'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Squirtle'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2019-09-29'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Angemon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2020-10-03'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Angemon'),
	(SELECT id FROM vets WHERE name = 'Jack Harkness'),
	'2020-11-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-01-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2019-05-15'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-02-27'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Boarmon'),
	(SELECT id FROM vets WHERE name = 'Maisy Smith'),
	'2020-08-03'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Blossom'),
	(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
	'2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
	(SELECT id FROM animals WHERE name = 'Blossom'),
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	'2021-01-11'
);