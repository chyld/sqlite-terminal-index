CREATE TABLE students (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(10),
    age integer
);

CREATE TABLE courses (
    id varchar(5) NOT NULL PRIMARY KEY,
    name varchar(10),
    credits integer
);

CREATE TABLE professors (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(10) NOT NULL,
    department varchar(10)
);

CREATE TABLE schedules (
    student_id integer,
    course_id varchar(5),
    professor_id integer,
    grade numeric(4,2),
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(course_id) REFERENCES courses(id),
    FOREIGN KEY(professor_id) REFERENCES professors(id)
);

INSERT INTO students (name, age) VALUES ('Shelby', 21);
INSERT INTO students (name, age) VALUES ('Jack', 22);
INSERT INTO students (name, age) VALUES ('Benny', 23);
INSERT INTO students (name, age) VALUES ('Rachael', 23);
INSERT INTO students (name, age) VALUES ('Bonnie', 21);

INSERT INTO courses (id, name, credits) VALUES ('MAT101', 'Algebra', 4);
INSERT INTO courses (id, name, credits) VALUES ('MAT102', 'Calculus', 5);
INSERT INTO courses (id, name, credits) VALUES ('MAT103', 'Linear Algebra', 5);
INSERT INTO courses (id, name, credits) VALUES ('HIS101', 'World History', 3);
INSERT INTO courses (id, name, credits) VALUES ('FIN101', 'Introduction to Finance', 3);

INSERT INTO professors (name, department) VALUES ('Sara', 'Mathematics');
INSERT INTO professors (name, department) VALUES ('Harris', 'Mathematics');
INSERT INTO professors (name, department) VALUES ('Pamela', 'History');
INSERT INTO professors (name, department) VALUES ('Daniel', 'Finance');

INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (1, 'MAT101', 1, 97);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (1, 'MAT102', 1, 92);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (1, 'FIN101', 4, 88);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (2, 'MAT101', 1, 97);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (2, 'MAT103', 1, 92);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (2, 'HIS101', 3, 88);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (3, 'MAT102', 2, 79);

SELECT name AS first_name FROM students LIMIT 2 OFFSET 1;
SELECT * FROM students WHERE age >= 22;
SELECT * FROM courses WHERE id LIKE 'MAT%';
SELECT * FROM courses WHERE id LIKE '%101' AND credits = 3;
SELECT * FROM professors WHERE department IN ('Mathematics', 'History');
SELECT * FROM students ORDER BY age DESC;
SELECT count(id) AS total_students, max(age) AS max_age FROM students;
SELECT avg(grade) AS average_math_grade FROM schedules WHERE course_id LIKE 'MAT%';
SELECT count(*) AS student_count, age FROM students GROUP BY age;

SELECT stu.name, stu.age, cou.name, cou.credits, pro.name, pro.department, sch.grade
FROM schedules sch
JOIN students stu ON sch.student_id = stu.id
JOIN courses cou ON sch.course_id = cou.id
JOIN professors pro ON sch.professor_id = pro.id
WHERE stu.age IN (21, 22);
