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

607. Sales Person
# Write your MySQL query statement below
select s.name
from SalesPerson as s
where s.sales_id not in  (select o.sales_id from Orders as o where o.com_id in
(select c.com_id from Company as c where c.name = "RED"));

620. Not Boring Movies
# Write your MySQL query statement below
select id, movie, description, rating
from Cinema 
where (id % 2 = 1) and (description <> "boring") 
order by rating desc;

627. Swap Salary
# Write your MySQL query statement below
update Salary
set sex = case when sex = "m" then "f" when sex = "f" then "m" end;

1050. Actors and Directors Who Cooperated At Least Three Times
# Write your MySQL query statement below
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(timestamp) >= 3;

1084. Sales Analysis III
-- group by having, with function max() and min()
# Write your MySQL query statement below
select distinct p.product_id, p.product_name
from Product as p
where p.product_id not in (select s.product_id from Sales as s where (s.sale_date > '2019-03-31') or (s.sale_date < '2019-01-01'));

# Write your MySQL query statement below
select distinct p.product_id, p.product_name
from Product as p
left join Sales as s on p.product_id = s.product_id
group by s.product_id
having max(s.sale_date) <= '2019-03-31' and min(s.sale_date) >= '2019-01-01';

511. Game Play Analysis I
-- min(date)
# Write your MySQL query statement below
select player_id, min(event_date) as first_login
from Activity
group by player_id;

1141. User Activity for the Past 30 Days I
-- again datediff, past or ahead
SELECTactivity_date ASday, COUNT(DISTINCT user_id) ASactive_users 
FROMActivity
WHEREDATEDIFF("2019-07-27", activity_date) <30
GROUP BYactivity_date

# Write your MySQL query statement below
select activity_date as day, count(distinct user_id) as active_users
from Activity
where datediff('2019-07-27', activity_date) < 30 and activity_date <='2019-07-27'
group by activity_date;

1148. Article Views I
-- order by
# Write your MySQL query statement below
select distinct author_id as id
from Views
where author_id = viewer_id
order by author_id asc;

1179. Reformat Department Table
select id, 
	sum(case when month = 'jan' then revenue else null end) as Jan_Revenue,
	sum(case when month = 'feb' then revenue else null end) as Feb_Revenue,
	sum(case when month = 'mar' then revenue else null end) as Mar_Revenue,
	sum(case when month = 'apr' then revenue else null end) as Apr_Revenue,
	sum(case when month = 'may' then revenue else null end) as May_Revenue,
	sum(case when month = 'jun' then revenue else null end) as Jun_Revenue,
	sum(case when month = 'jul' then revenue else null end) as Jul_Revenue,
	sum(case when month = 'aug' then revenue else null end) as Aug_Revenue,
	sum(case when month = 'sep' then revenue else null end) as Sep_Revenue,
	sum(case when month = 'oct' then revenue else null end) as Oct_Revenue,
	sum(case when month = 'nov' then revenue else null end) as Nov_Revenue,
	sum(case when month = 'dec' then revenue else null end) as Dec_Revenue
from department
group by id;

1407. Top Travellers
# Write your MySQL query statement below
select u.name, ifnull(r.distance,0) as travelled_distance
from Users as u left join (select user_id, sum(distance) as distance from Rides group by user_id ) as r
on u.id = r.user_id
order by r.distance desc, u.name asc;

1581. Customer Who Visited but Did Not Make Any Transactions
SELECTcustomer_id, COUNT(*) ascount_no_trans
FROM Visits
WHEREvisit_id NOT IN(SELECT DISTINCTvisit_id FROMTransactions)
GROUP BYcustomer_id;


select v.customer_id, count(*) as count_no_trans
from Visits as v
where v.visit_id not in
(select distinct visit_id from Transactions)
group by v.customer_id;

1587. Bank Account Summary II
Write an SQL query to report the name and balance of users with a 
balance higher than 10000. The balance of an account is equal to the 
sum of the amounts of all transactions involving that account.

select name, sum(t.amount) as balance
from users as u join Transactions as t on u.account = t.account
group by t.account
having balance > 10000;

1667. Fix Names in a Table
Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
selectCONCAT(UCASE(LEFT('CHRIS', 1)),SUBSTRING(lower('CHRIS'),2));

# Write your MySQL query statement below
select user_id, concat(upper(left(name, 1)), substring(lower(name), 2)) as name
from Users
order by user_id;

1693. Daily Leads and Partners
Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.

# Write your MySQL query statement below
select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by make_name, date_id

1729. Find Followers Count
Write an SQL query that will, for each user, return the number of followers.
Return the result table ordered by user_id.
select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id;

1741. Find Total Time Spent by Each Employee
select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by event_day, emp_id;

1757. Recyclable and Low Fat Products
-- to test conditions
select product_id
from Products
where low_fats = "Y" and recyclable = "Y";
