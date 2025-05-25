CREATE DATABASE conservation_db;



CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);

INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(50),
  	sighting_time TIMESTAMP,
    notes TEXT
);

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- drop table rangers;
-- drop table species;
-- drop table sightings;




-- no - 01
INSERT INTO rangers(ranger_id, name, region)
VALUES('4','Derek Fox', 'Coastal Plains')


-- no-02
SELECT  count(DISTINCT  species_id ) as unique_species_count FROM sightings;


-- no-03
SELECT * FROM sightings WHERE location like '%Pass%';


-- no-04
SELECT r.name, count(s.sighting_id) as total_sightings  FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name


-- no-05
SELECT common_name FROM species
LEFT JOIN sightings s ON species.species_id = s.species_id 
WHERE s.species_id IS NULL;


-- no-06
SELECT sp.common_name, sighting_time, name FROM sightings si
LEFT JOIN species sp ON si.species_id = sp.species_id
LEFT JOIN rangers ra ON si.ranger_id = ra.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;


-- no-07
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(year from  discovery_date)  < 1800


-- no-08
SELECT 
  sighting_id,
  CASE
 	 WHEN EXTRACT(HOUR FROM sighting_time)  < 12  THEN 'Morning'
	 WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) <= 17 THEN 'Afternoon'
     ELSE 'Evening'
     END AS time_of_day
FROM sightings;


-- no-09
DELETE FROM rangers
WHERE NOT EXISTS (
  SELECT 1
  FROM sightings
  WHERE sightings.ranger_id = rangers.ranger_id
);




