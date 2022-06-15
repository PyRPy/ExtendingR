-- use subquery in where clause for conditions
SELECT county_name,
	   state_name,
	   pop_est_2019
FROM us_counties_pop_est_2019
WHERE pop_est_2019 >= (
    SELECT percentile_cont(0.9) WITHIN GROUP(ORDER BY pop_est_2019)
    FROM us_counties_pop_est_2019)
ORDER BY pop_est_2019 DESC;

--  Creating and filling a retirees table
CREATE TABLE retirees (
    id int,
    first_name text,
    last_name text
);

INSERT INTO retirees
VALUES (2, 'Janet', 'King'),
       (4, 'Michael', 'Taylor');

-- need to fix
SELECT first_name, last_name
FROM employees
WHERE emp_id in (
	SELECT id
	FROM retirees)
ORDER BY emp_id;

-- Cross tabulations
-- Install the crosstab() function via the tablefunc module

CREATE EXTENSION tablefunc;
CREATE TABLE ice_cream_survey (
    response_id integer PRIMARY KEY,
    office text,
    flavor text
);

COPY ice_cream_survey
FROM 'C:\Users\Public\SQLdata\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

SELECT * 
FROM ice_cream_survey
ORDER BY response_id
LIMIT 5;

Generating the ice cream survey crosstab
SELECT *
FROM crosstab('SELECT office,
                      flavor,
                      count(*)
               FROM ice_cream_survey
               GROUP BY office, flavor
               ORDER BY office',

              'SELECT flavor
               FROM ice_cream_survey
               GROUP BY flavor
               ORDER BY flavor')

AS (office text,
    chocolate bigint,
    strawberry bigint,
    vanilla bigint);