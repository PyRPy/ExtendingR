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


