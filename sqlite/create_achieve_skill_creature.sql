DROP TABLE IF EXISTS skill;

CREATE TABLE skill (
skillCode          VARCHAR(3)      NOT NULL PRIMARY KEY,
skillDescription   VARCHAR(20)
);

DROP TABLE IF EXISTS creature;

CREATE TABLE creature (
creatureId          INTEGER      NOT NULL PRIMARY KEY,
creatureName        VARCHAR(20),
creatureType        VARCHAR(20),
creatureResideTown  VARCHAR(20)
);

DROP TABLE IF EXISTS achievement;

CREATE TABLE achievement (
creatureId         INTEGER,
skillCode          VARCHAR(3),
proficiency        INTEGER,
PRIMARY KEY (creatureId, skillCode),
FOREIGN KEY (creatureId) REFERENCES creature (creatureId),
FOREIGN KEY (skillCode) REFERENCES skill (skillCode)
);

INSERT INTO creature VALUES (1,'Bannon','person','Philly');
INSERT INTO creature VALUES (3,'Neff','person','Blue Earth');
INSERT INTO creature VALUES (5,'Mieska','person','Duluth');

INSERT INTO skill VALUES ('A', 'float');
INSERT INTO skill VALUES ('E', 'swim');
INSERT INTO skill VALUES ('O', 'sink');
INSERT INTO skill VALUES ('U', 'walk on water');
INSERT INTO skill VALUES ('Z', 'gargle');

INSERT INTO achievement VALUES (1, 'A', 1);
INSERT INTO achievement VALUES (1, 'E', 3);
INSERT INTO achievement VALUES (5, 'Z', 3);
INSERT INTO achievement VALUES (3, 'Z', 1);