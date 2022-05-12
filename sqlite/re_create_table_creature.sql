DROP TABLE IF EXISTS creature;
-- this time addd contraints, such for NA values and PK, FK

CREATE TABLE creature (
creatureId          INTEGER      NOT NULL PRIMARY KEY,
creatureName        VARCHAR(20),
creatureType        VARCHAR(20),
townId VARCHAR(3) REFERENCES town(townId)     -- foreign key
);

INSERT INTO creature VALUES (1,'Bannon','person','p');
INSERT INTO creature VALUES (2,'Myers','person','a');
INSERT INTO creature VALUES (3,'Neff','person','be');
INSERT INTO creature VALUES (4,'Neff','person','b');
INSERT INTO creature VALUES (5,'Mieska','person','d');
INSERT INTO creature VALUES (6,'Carlis','person','p');
INSERT INTO creature VALUES (7,'Kermit','frog','g');
INSERT INTO creature VALUES (8,'Godzilla','monster','t');
INSERT INTO creature VALUES (9,'Thor','superhero','as');
