-- -- Practical SQL: A Beginner's Guide to Storytelling with Data, 2nd Edition
-- basic math
select 2 * 2;
select 11.0 / 6;
select sqrt(10);
select factorial(5);

select (8+1) / 7.0;

-- use aliases
select county_name as county,
	   state_name as state,
	   pop_est_2019 as pop,
	   births_2019 AS births,
       deaths_2019 AS deaths,
       international_migr_2019 AS int_migr,
       domestic_migr_2019 AS dom_migr,
       residual_2019 AS residual
from us_counties_pop_est_2019
limit 5;

select * from us_counties_pop_est_2019 limit 5;

-- substract two columns
select county_name as county,
	   state_name as state,
	   pop_est_2019 as pop,
	   births_2019 AS births,
       deaths_2019 AS deaths,
	   births_2019 - deaths_2019 as natueral_increase
from us_counties_pop_est_2019
order by state_name, county_name
limit 5;

-- find percentage of something
select county_name as county,
	   state_name as state,
	   round(area_water::numeric / (area_land + area_water) * 100, 2) as pct_water 
from us_counties_pop_est_2019 
order by pct_water desc
limit 5;

-- find column sum and avg
select sum(pop_est_2019) as county_sum,
	   round(avg(pop_est_2019), 0) as county_average 
from us_counties_pop_est_2019;

-- percentile, a big deal in stats
CREATE TABLE percentile_test (
    numbers integer
);

insert into percentile_test (numbers) values
	(1), (2), (3), (4), (5), (6);

select 
	percentile_cont(0.5)
	within group (order by numbers),
	percentile_disc(0.5) 
	within group (order by numbers)
from percentile_test;

-- quantiles
select percentile_cont(array[0.25, 0.5, 0.75]) 
	within group (order by pop_est_2019) as quantiles 
from us_counties_pop_est_2019;

-- vertical display version
select unnest(percentile_cont(array[0.25, 0.5, 0.75]) 
	within group (order by pop_est_2019)) as quantiles 
from us_counties_pop_est_2019;

-- find mode of a distribution
select mode() 
	within group (order by births_2019)
from us_counties_pop_est_2019;








