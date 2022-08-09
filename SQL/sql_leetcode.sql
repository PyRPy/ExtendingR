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

-- 183. Customers Who Never Order
-- # Write your MySQL query statement below
SELECT c.name as Customers
from Customers as c left join Orders as o on c.id = o.customerId
where o.id is null;

-- 196. Delete Duplicate Emails
-- # Please write a DELETE statement and DO NOT write a SELECT statement.
-- # Write your MySQL query statement below
DELETE p from Person as p, Person as b
where p.email = b.email and p.id > b.id;

-- 197. Rising Temperature
-- # Write your MySQL query statement below
select w.id
from Weather as w, Weather as b
where w.temperature > b.temperature and datediff(w.recordDate, b.recordDate) = 1;


584. Find Customer Referee
# Write your MySQL query statement below
select name
from Customer
where (referee_id <> 2) or (referee_id is null);

586. Customer Placing the Largest Number of Orders
# Write your MySQL query statement below
select b.customer_number from
(select customer_number, count(order_number) as cnt from Orders group by customer_number) as b
order by b.cnt desc
limit 1;

SELECT customer_number
FROMorders
GROUPBY customer_number
ORDERBY COUNT(*) DESC LIMIT1;

595. Big Countries
# Write your MySQL query statement below
SELECT name, population, area 
FROM World
where (area >= 3000000) or (population >= 25000000);

596. Classes More Than 5 Students
# Write your MySQL query statement below
select class
from Courses
group by class
having count(student) >= 5;
