START TRANSACTION;

INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, grade)
VALUES (1, 1, 101, 'Fall 2024', 'A');

UPDATE Courses SET enrollment_count = enrollment_count + 1 WHERE course_id = 101;

COMMIT;

ROLLBACK;
