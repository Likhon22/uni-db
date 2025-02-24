CREATE DATABASE  Uni_Db; 

CREATE TABLE students (

    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(255) NOT NULL,
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(100)
   
);
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER
);



CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER  REFERENCES  students (student_id),
    course_id INTEGER  REFERENCES courses (course_id)
);


INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


INSERT INTO courses (course_name, credits) VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);



-- query  1

INSERT INTO students(student_name,age,email,frontend_mark,backend_mark) VALUES ('Likhon',24,'likhon@example.com',50,50);


-- query 2
SELECT student_name FROM students as s JOIN enrollments AS e ON s.student_id = e.student_id JOIN courses AS c ON  e.course_id=c.course_id WHERE c.course_name='Next.js';

-- query 3
UPDATE students SET status ='Awarded' WHERE (frontend_mark+backend_mark)=(SELECT MAX(frontend_mark+backend_mark)FROM students);

-- query 4

DELETE FROM courses WHERE course_id NOT IN  (SELECT DISTINCT course_id FROM  enrollments);

-- query 5

SELECT * FROM students LIMIT 2 OFFSET 1;

-- query 6

SELECT course_name,COUNT(s.student_id) FROM students as s JOIN enrollments AS e ON s.student_id = e.student_id
 JOIN courses AS c ON  e.course_id=c.course_id GROUP BY course_name;

 -- query 7

SELECT avg(age) as average_age FROM students;

-- query 8

SELECT * FROM students WHERE email LIKE '%example.com';