CREATE VIEW StudentGrades AS
SELECT s.student_id, s.first_name, s.last_name, e.course_id, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

CREATE VIEW CourseProfessors AS
SELECT c.course_id, c.course_name, p.professor_id, p.first_name, p.last_name, t.semester
FROM Courses c
JOIN Teaches t ON c.course_id = t.course_id
JOIN Professors p ON t.professor_id = p.professor_id;

CREATE VIEW StudentCourses AS
SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, e.semester
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;
