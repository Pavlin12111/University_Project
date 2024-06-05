CREATE ROLE db_admin;
GRANT ALL PRIVILEGES ON *.* TO db_admin;

CREATE ROLE professor_role;
GRANT SELECT, INSERT, UPDATE ON TABLE Students TO professor_role;
GRANT SELECT, INSERT, UPDATE ON TABLE Enrollments TO professor_role;

CREATE ROLE student_role;
GRANT SELECT (student_id, first_name, last_name) ON Students TO student_role;
GRANT SELECT (course_id, course_name) ON Courses TO student_role;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT db_admin TO 'admin_user'@'localhost';

CREATE USER 'prof_user'@'localhost' IDENTIFIED BY 'password';
GRANT professor_role TO 'prof_user'@'localhost';

CREATE USER 'stud_user'@'localhost' IDENTIFIED BY 'password';
GRANT student_role TO 'stud_user'@'localhost';
