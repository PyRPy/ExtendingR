-- create a table
CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,                         -- State FIPS code
    county_fips text,                        -- County FIPS code
    region smallint,                         -- Region
    state_name text,                         -- State name	
    county_name text,                        -- County name
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                       -- Area (Water) in square meters
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)
    pop_est_2018 integer,                    -- 2018-07-01 resident total population estimate
    pop_est_2019 integer,                    -- 2019-07-01 resident total population estimate
    births_2019 integer,                     -- Births from 2018-07-01 to 2019-06-30
    deaths_2019 integer,                     -- Deaths from 2018-07-01 to 2019-06-30
    international_migr_2019 integer,         -- Net international migration from 2018-07-01 to 2019-06-30
    domestic_migr_2019 integer,              -- Net domestic migration from 2018-07-01 to 2019-06-30
    residual_2019 integer,                   -- Residual for 2018-07-01 to 2019-06-30
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)	
);

-- show an empty table
select * 
from us_counties_pop_est_2019;

copy us_counties_pop_est_2019
from 'C:\Users\Public\SQLdata\us_counties_pop_est_2019.csv'
with (format csv, header);

select * 
from us_counties_pop_est_2019;

select county_name, state_name, area_land
from us_counties_pop_est_2019
order by area_land desc
limit 3;

-- create another table
CREATE TABLE supervisor_salaries (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    town text,
    county text,
    supervisor text,
    start_date text,
    salary numeric(10,2),
    benefits numeric(10,2)
);

copy supervisor_salaries (town, supervisor, salary)
from 'C:\Users\Public\SQLdata\supervisor_salaries.csv'
with (format csv, header);

-- check the data
select * 
from supervisor_salaries
order by id 
limit 2;

-- export a query to a csv file
copy (
	select county_name, state_name
	from us_counties_pop_est_2019
	where county_name ilike '%mill%'
)
to 'C:\Users\Public\SQLdata\us_counties_mill_export_query.csv'
with (format csv, header);

-- how to import stocks data
create table spy_tbl (
	Date1 date,
	Open1 decimal,
	High decimal,
	Low  decimal,
	Close1 decimal,
	AdjClose decimal ,
	Volume integer
);

select * 
from spy_tbl;

drop table spy_tbl;

copy spy_tbl (Date1, Open1, High, Low, Close1, AdjClose, Volume)
from 'C:\Users\Public\StocksCSV\SPY.csv'
with (format csv, header);

select * 
from spy_tbl
limit 5;

select *
from spy_tbl
where date1 between '2021-01-01' and '2022-06-03';



