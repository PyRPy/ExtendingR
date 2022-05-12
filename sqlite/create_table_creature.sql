DROP TABLE IF EXISTS creature;

CREATE TABLE creature (
creatureId          INTEGER      NOT NULL PRIMARY KEY,
creatureName        VARCHAR(20),
creatureType        VARCHAR(20),
creatureResideTown  VARCHAR(20)
);

INSERT INTO creature VALUES (1,'Bannon','person','Philly');
INSERT INTO creature VALUES (2,'Myers','person','Anoka');
INSERT INTO creature VALUES (3,'Neff','person','Blue Earth');
INSERT INTO creature VALUES (4,'Neff','person','Bemidji');
INSERT INTO creature VALUES (5,'Mieska','person','Duluth');
INSERT INTO creature VALUES (6,'Carlis','person','Philly');
INSERT INTO creature VALUES (7,'Kermit','frog','Greenville');
INSERT INTO creature VALUES (8,'Godzilla','monster','Tokyo');
INSERT INTO creature VALUES (9,'Thor','superhero','Asgard');