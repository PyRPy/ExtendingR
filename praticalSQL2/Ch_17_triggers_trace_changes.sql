-- track change automatically
-- Listing 17-19: Creating the grades and grades_history tables

CREATE TABLE grades (
    student_id bigint,
    course_id bigint,
    course text NOT NULL,
    grade text NOT NULL,
PRIMARY KEY (student_id, course_id)
);

INSERT INTO grades
VALUES
    (1, 1, 'Biology 2', 'F'),
    (1, 2, 'English 11B', 'D'),
    (1, 3, 'World History 11B', 'C'),
    (1, 4, 'Trig 2', 'B');
	
CREATE TABLE grades_history (
	student_id bigint NOT NULL,
	course_id bigint NOT NULL,
	change_time timestamp with time zone NOT NULL,
	course text NOT NULL,
	old_grade text NOT NULL,
	new_grade text NOT NULL,
	PRIMARY KEY (student_id, course_id, change_time)
);

-- Listing 17-20: Creating the record_if_grade_changed() function
CREATE OR REPLACE FUNCTION record_if_grade_changed() 
	RETURNS trigger AS 
$$
BEGIN
	IF NEW.grade <> OLD.grade THEN 
	INSERT INTO grades_history (
		student_id,
		course_id,
		change_time,
		course,
		old_grade,
		new_grade)
	VALUES 
		(OLD.student_id,
		 OLD.course_id,
		 now(),
		 OLD.course,
		 OLD.grade,
		 NEW.grade);
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grades_update
	AFTER UPDATE
	ON grades
	FOR EACH ROW 
	EXECUTE PROCEDURE record_if_grade_changed();
	
-- check change history
SELECT * FROM grades_history;

-- view the table grades again
SELECT * FROM grades ORDER BY student_id, course_id;

- change the grade
UPDATE grades
SET grade = 'A'
WHERE student_id = 1 and course_id = 3;

-- check the change record
SELECT * FROM grades_history;