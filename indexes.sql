CREATE INDEX idx_student_id ON Enrollments (student_id);

CREATE INDEX idx_course_semester ON Teaches (course_id, semester);

CREATE INDEX idx_course_name_prefix ON Courses (course_name(10));
