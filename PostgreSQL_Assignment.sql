CREATE DATABASE Assignment_02;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50)
);


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);


INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


-- Problem 01
INSERT INTO rangers (name,region) VALUES('Derek Fox','Coastal Plains');

-- Problem 02
SELECT COUNT(DISTINCT species_id) AS "unique_species_count" FROM sightings;

-- Problem 03
SELECT * from sightings
WHERE location ILIKE '%Pass';

-- Problem 04
SELECT r.name, count(*) as "total_sightings " from sightings s
JOIN rangers r ON s.ranger_id = r.ranger_id
GROUP BY r.name;

-- Problem 05
SELECT common_name FROM species s WHERE s.species_id NOT IN (SELECT species_id FROM sightings);

-- Problem 06
SELECT sp.common_name,si.sighting_time,r.name FROM sightings si
JOIN rangers r ON si.ranger_id = r.ranger_id
JOIN species sp ON si.species_id = sp.species_id
ORDER BY si.sighting_time DESC LIMIT 2;

-- Problem 07
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- Problem 08
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 09
DELETE from rangers r WHERE r.ranger_id NOT IN(SELECT s.ranger_id from sightings s);