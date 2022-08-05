-- leetcode practice from easy to complex!

--511. Game Play Analysis I
-- # Write your MySQL query statement below
SELECT player_id event_date
from activity
group by player_id
where event_date = min(event_date);


SELECT player_id min(event_date)
from activity
group by player_id;


-- 175. Combine Two Tables
-- # Write your MySQL query statement below
SELECT firstName, lastName, city, state
from person as p left join address as a on p.personId = a.personId;

-- 181. Employees Earning More Than Their Managers
-- # Write your MySQL query statement below
SELECT a.name as Employee
FROM Employee as a
WHERE a.salary > (SELECT b.salary FROM Employee as b WHERE a.managerId = b.id);


-- # Write your MySQL query statement below
-- 182. Duplicate Emails
SELECT distinct p.email as Email
FROM Person as p join Person as b on (p.email = b.email and p.id != b.id);