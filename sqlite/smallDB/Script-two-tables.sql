-- https://runestone.academy/ns/books/published/MasteringDatabases/13MatchJoin/00MJIntro.html?mode=browsing

-- two tables
 SELECT C1.creatureId AS C1_creatureId,
        C1.creatureName AS C1_creatureName,
        C1.creatureType AS C1_creatureType,
        C1.reside_townId AS C1_reside_townId,
        C1.idol_creatureId AS C1_idol_creatureId,
        C2.creatureId AS C2_creatureId,
        C2.creatureName AS C2_creatureName,
        C2.creatureType AS C2_creatureType,
        C2.reside_townId AS C2_reside_townId,
        C2.idol_creatureId AS C2_idol_creatureId
 FROM creature C1, creature C2;
 
SELECT creature.*, skill.* 
from creature, skill;

-- Achievement with its Skill data
-- reduce by removing B.skillCode
SELECT A.*, B.skillDescription,
			B.maxProficiency, B.minProficiency,
			B.origin_townId
from achievement A, skill B			-- times
WHERE A.skillCode = B.skillCode 	-- equality match filter 
;

/*
 * Find each Achievement with its Skill data where the Skill was 
 * achieved in the same town that it originated in.
 */

SELECT A.*, B.skillDescription,
			B.maxProficiency,
			B.minProficiency
FROM achievement A, skill B
where A.skillCode  = B.skillCode 
AND A.test_townId  = B.origin_townId 
;

/*
Find each Aspiration with its Creature data.
*/

SELECT a.*, b.creatureName, b.creatureType,
			b.reside_townId, b.idol_creatureId
from aspiration a , creature b
WHERE a.creatureId = b.creatureId
;

DROP TABLE IF EXISTS sameTownCreatureSkillPair;

-- same reside_townId as origin_townId Creature-Skill Pair
-- reduce by removing B.townId
CREATE TABLE sameTownCreatureSkillPair AS
SELECT A.*, B.skillCode, B.skillDescription,
            B.maxProficiency, B.minProficiency
FROM Creature A, Skill B       -- times
WHERE A.reside_townId = B.origin_townId   -- equality match filter
;

SELECT A.*, B.aspiredProficiency 
from sameTownCreatureSkillPair A, aspiration B
WHERE A.creatureId = B.creatureId 
and A.skillCode = B.skillCode 
and A.reside_townId = B.desired_townId 
;
-- above queries worked somehow this time!!!

-- query --
-- 13.9. Same Base A and B
-- Find each Skill with its TeamSkill data
-- or Find each TeamSkill with its Skill data

SELECT S.*, TS.teamSize
FROM skill S, teamSkill TS
WHERE S.skillCode = TS.skillCode;

-- What creatures have achieved and aspired to the same Skill?
DROP TABLE IF EXISTS achievingCreatureSkillPair;

-- 13.10
-- achieving Creature-Skill Pair
CREATE TABLE achievingCreatureSkillPair AS
SELECT distinct creatureId, skillCode
FROM Achievement
;

SELECT A.*, B.aspiredProficiency,
            B.desired_townId
FROM achievingCreatureSkillPair A, Aspiration B
WHERE A.creatureId = B.creatureId
AND   A. skillCode = B.skillCode
;

-- 13.11 
-- Find each creature with its idol creature data
SELECT c1.creatureId as c1_creatureId,
	   c1.creatureName as c1_creatureName,
	   C1.creatureType AS C1_creatureType,
        C1.reside_townId AS C1_reside_townId,
        C1.idol_creatureId AS C1_idol_creatureId,
        C2.creatureName AS idol_creatureName,
        C2.creatureType AS idol_creatureType,
        C2.reside_townId AS idol_reside_townId,
        C2.idol_creatureId AS idol_idol_creatureId
	   
from creature c1, creature c2
WHERE c1.idol_creatureId  = c2.creatureId ;

-- Find each ordered pair of creatures that reside in the same town
-- 13.12
SELECT C1.creatureId as C1_creatureId,
	   C1.creatureName as C1_creatureName,
	   C1.creatureType AS C1_creatureType,
       C1.reside_townId AS C1_reside_townId, -- different than c2
       C1.idol_creatureId AS C1_idol_creatureId,
       C2.creatureId AS C2_creatureId,
       C2.creatureName AS C2_creatureName,
       C2.creatureType AS C2_creatureType,
       C2.idol_creatureId AS C2_idol_creatureId	   
FROM creature C1, creature C2
WHERE C1.reside_townId = C2.reside_townId ;

-- Outer join
-- check what's in the table or tables
SELECT * 
FROM creature;

SELECT distinct(creatureId)
FROM achievement;

-- 14.1 outer join 
drop table if exists CreatureNJAchievement;

CREATE table CreatureNJAchievement as 
select c.*, a.proficiency , a.skillCode , a.achDate 
from creature c 
inner join achievement a 
on c.creatureId = a.creatureId ;

SELECT * FROM CreatureNJAchievement
order by creatureId;

-- the question you ask is: where is Carlis in Id = 6 ?

-- Find each Creature with its possibly null Achievement data.
DROP TABLE if exists CreatureLOJAchievement;
CREATE table CreatureLOJAchievement as 
select c.*, a.proficiency , a.skillCode , a.achDate 
from creature c 
left outer join achievement a 
on c.creatureId  = a.creatureId ;

SELECT * FROM CreatureLOJAchievement
order by creatureId;

SELECT creatureId, COUNT(skillCode)
from CreatureLOJAchievement 
group by creatureId;

SELECT creatureId, count(DISTINCT skillCode)
from CreatureLOJAchievement 
group by creatureId;
-- this time Carlis is kept in the table above when counting skills

-- Find each same creatureId and same reside_townId as test_townId Creature with its possibly null Achievement data.
-- another condition added
DROP TABLE if exists CreatureLOJAchievement_w;
CREATE table CreatureLOJAchievement_w as 
select c.*, a.proficiency , a.skillCode , a.achDate 
from creature c 
left outer join achievement a 
on (c.creatureId = a.creatureId and c.reside_townId=a.test_townId)
;
SELECT *
FROM CreatureLOJAchievement_w
order by creatureId;

-- How many skills have been achieved by a creature in the same achievement test town as the reside town of the creature?
SELECT creatureId, reside_townId, COUNT(skillCode) as skillcount
from CreatureLOJAchievement_w
group by creatureId, reside_townId;

-- 14.1.3. Right Outer Join
-- no right join in SQLite
select c.creatureId, a.achId , a.skillCode , a.proficiency , a.test_townId 
FROM creature c left join achievement a 
on c.creatureId =a.creatureId 
UNION ALL 
SELECT a.creatureId,
		a.achId, b.skillCode, a.proficiency , a.test_townId 
from skill b left join achievement a 
on a.skillCode = b.skillCode 
;

 
