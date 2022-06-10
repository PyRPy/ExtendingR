-- declare a natural key as primary key
create table natural_key_example (
	license_id text constraint license_key primary key,
	first_name text,
	last_name text
);

-- as a table constraint, drop table first
drop table natural_key_example;
create table natural_key_example (
	license_id text, 
	first_name text,
	last_name text,
	constraint license_key primary key (license_id)
);

-- fill in values
INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Gem', 'Godfrey');

INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'John', 'Mitchell');

-- foreign key example
CREATE TABLE licenses (
    license_id text,
    first_name text,
    last_name text,
    CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
    registration_id text,
    registration_date timestamp with time zone,
    license_id text references licenses (license_id),
	constraint registration_key primary key (registration_id, license_id)
);

INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Steve', 'Rothery');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '2022-03-17', 'T229901');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '2022-03-17', 'T000001');

-- speed comparison
-- import NYC address data
drop table new_york_addresses;
create table new_york_addresses (
	longtitude numeric(9,6),
	latitude numeric(9,6),
	street_number text,
	street text,
	unit text,
	postcode text,
	id integer constraint new_york_key primary key
);

copy new_york_addresses 
from 'C:\Users\Public\SQLdata\city_of_new_york.csv'
with (format csv, header);

select count(*)
from new_york_addresses;

-- benchmark queries before adding index
explain analyze select * from new_york_addresses
where street = '52 STREET';

-- add index, and run the query again
create index street_idx on new_york_addresses (street);

explain analyze select * from new_york_addresses
where street = '52 STREET';


