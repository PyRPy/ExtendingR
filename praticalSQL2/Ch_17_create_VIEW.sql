-- create view for further query
CREATE or REPLACE VIEW nevada_counties_pop_2019 AS 
	SELECT county_name,
		   state_fips,
		   county_fips,
		   pop_est_2019
	FROM us_counties_pop_est_2019
	WHERE state_name = 'Nevada';

-- query on the view

DROP VIEW navada_counties_pop_2019;

SELECT * 
FROM nevada_counties_pop_2019
ORDER BY county_fips 
LIMIT 5;

-- population changes for each counties
-- need to create 2010 data table
CREATE TABLE us_counties_pop_est_2010 (
    state_fips text,                         -- State FIPS code
    county_fips text,                        -- County FIPS code
    region smallint,                         -- Region
    state_name text,                         -- State name
    county_name text,                        -- County name
    estimates_base_2010 integer,             -- 4/1/2010 resident total population estimates base
    CONSTRAINT counties_2010_key PRIMARY KEY (state_fips, county_fips)
);

COPY us_counties_pop_est_2010
FROM 'C:\Users\Public\SQLdata\us_counties_pop_est_2010.csv'
WITH (FORMAT CSV, HEADER);

DROP VIEW county_pop_change_2019_2010;
CREATE OR REPLACE VIEW county_pop_change_2019_2010 AS 
	SELECT c2019.county_name,
	       c2019.state_name,
		   c2019.state_fips,
           c2019.county_fips,
		   c2019.pop_est_2019 AS pop_2019,
		   c2010.estimates_base_2010 AS pop_2010,
		   round((c2019.pop_est_2019::numeric - c2010.estimates_base_2010) 
				/ c2010.estimates_base_2010 * 100, 1) AS pct_change_2019_2010	   
	FROM us_counties_pop_est_2019 AS c2019
		JOIN us_counties_pop_est_2010 AS c2010 
	ON c2019.state_fips = c2010.state_fips
		AND c2019.county_fips = c2010.county_fips;
		
SELECT county_name,
  	   state_name,
	   pop_2019,
	   pct_change_2019_2010
FROM county_pop_change_2019_2010
WHERE state_name = 'Nevada'
ORDER BY county_fips
LIMIT 5;
-- cannot use "Nevada" in this case above 

