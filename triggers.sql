DELIMITER //

CREATE TRIGGER before_insert_student
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.date_of_birth > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Date of birth cannot be in the future';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_insert_enrollment
AFTER INSERT ON Enrollments
FOR EACH ROW
BEGIN
    UPDATE Courses SET enrollment_count = enrollment_count + 1 WHERE course_id = NEW.course_id;
END;
//

DELIMITER ;

-- Update тригер before
DELIMITER //

CREATE TRIGGER before_update_grade
BEFORE UPDATE ON Enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade NOT IN ('A', 'B', 'C', 'D', 'F') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid grade value';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_update_professor
AFTER UPDATE ON Professors
FOR EACH ROW
BEGIN
    UPDATE Teaches SET professor_name = NEW.first_name WHERE professor_id = NEW.professor_id;
END;
//

DELIMITER ;
