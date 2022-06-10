---------------------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data, 2nd Edition
-- by Anthony DeBarros

-- Chapter 10 Code Examples
----------------------------------------------------------------------------
-- import the data from csv files
CREATE TABLE meat_poultry_egg_establishments (
    establishment_number text CONSTRAINT est_number_key PRIMARY KEY,
    company text,
    street text,
    city text,
    st text,
    zip text,
    phone text,
    grant_date date,
    activities text,
    dbas text
);

COPY meat_poultry_egg_establishments
FROM 'C:\Users\Public\SQLdata\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER);

select *
from meat_poultry_egg_establishments
limit 5;

CREATE INDEX company_idx ON meat_poultry_egg_establishments (company);

-- Listing 10-2: Finding multiple companies at the same address
select company,
	   street,
	   city,
	   st, 
	   count(*) as address_count 
FROM meat_poultry_egg_establishments
GROUP BY company, street, city, st 
HAVING count(*) > 1 
ORDER BY company, street, city, st;

-- Listing 10-4: Using IS NULL to find missing values in the st column
SELECT establishment_number,
	   company,
	   city, 
	   st,
	   zip
FROM meat_poultry_egg_establishments 
where st is null;
