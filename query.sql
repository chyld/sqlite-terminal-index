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
    department varchar(10),
    salary integer,
    age integer
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

INSERT INTO students (name, age) VALUES ('shelby', 21);
INSERT INTO students (name, age) VALUES (NULL, NULL);

INSERT INTO courses (id, name, credits) VALUES ('mat101', NULL, NULL);
INSERT INTO courses (id, name, credits) VALUES ('mat102', 'calculus', 5);

INSERT INTO professors (name, department, salary, age) VALUES ('sara', NULL, NULL, NULL);

INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (NULL, NULL, NULL, NULL);
INSERT INTO schedules (student_id, course_id, professor_id, grade) VALUES (1, 'mat101', 1, 97.32);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM schedules;
SELECT * FROM professors;

EXPLAIN QUERY PLAN SELECT * FROM students WHERE id = 1;

EXPLAIN QUERY PLAN SELECT * FROM professors WHERE salary > 1000;

CREATE INDEX salary_index ON professors(salary);

EXPLAIN QUERY PLAN SELECT * FROM professors WHERE salary > 1000;

DELETE FROM students;
DROP TABLE students;

SELECT
   type,
   name,
   tbl_name,
   sql
FROM
   sqlite_master
WHERE
   type= 'index';
