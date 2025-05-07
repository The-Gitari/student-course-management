create database course_management;
create schema Students;
create schema Instructors;
create schema Courses;
create schema Enrollments;

--STUDENTS' TABLE
create table Student
(   student_id INT primary key,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_of_birth DATE
);

-- INSTRUCTORS' TABLE
create table Instructor
 (  instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

--COURSES' TABLE
create table Course
(   course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

--ENROLLMENT TABLE
create table if not exists Enrollment
 (  enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

--INSERT SAMPLE RECORDS
--STUDENTS
INSERT INTO Student values
 (1, 'Aryton', 'Senna', 'asenna@example.com', '2001-02-14'),
 (2, 'Blessed', 'Njugush', 'bnjhugush@example.com', '1999-01-31'),
 (3, 'Lewis', 'Hamilton', 'lhamillton@example.com', '1997-05-06'),
 (4, 'Oscar', 'Piastri','opiastri@example.com','2001-03-15' ),
 (5, 'Lando', 'Norris', 'lnorris@example.com', '2000-04-28'),
 (6, 'Charles', 'Leclerc', 'cleclerc@example.com', '1996-01-03'),
 (7, 'Sebastian', 'Vettel', 'svettel@gmail.com', '1997-12-12'),
 (8, 'Daniel','Riciardo', 'driciaciardo@example.com', '1999-07-14'),
 (9, 'Max', 'Verstapen', 'mverstapen@example.com', '1995-9-30'),
 (10, 'Niki', 'Lauda', 'nlauda@examle.com', '2002-04-28');

--INSTRUCTORS
insert into instructor values
 (1,'Toto', 'Wolf','twolf@example.com'),
 (2,'Zak', 'Brown', 'zbrown@example.com'),
 (3, 'Fred', 'Vasseur', 'fvasseur@example.com');

--COURSES
INSERT INTO Course values
 (101, 'FormulaOne', 'Intro to FormulaOne', 3),
 (202, 'RallyCross', 'Intro to RallyCross',2 ),
 (303, 'SafariRally', 'Intro to SafariRally', 1),
 (404, 'Dakar', 'Intro to Dakar',1),
 (505, 'Nascar', 'Intro to Nascar',2);

--ENROLLMENT
INSERT INTO Enrollment VALUES 
 (10101, 1, 303, '2023-06-29', 'A'),
 (10102, 2, 303, '2025-04-20', 'C'),
 (10103, 3, 101, '2021-12-12', 'A'),
 (10104, 3, 404, '2024-05-06', 'A'),
 (10105, 4, 101, '2025-05-03', 'A'),
 (10106, 5, 505, '2024-09-24', 'B'),
 (10107, 6, 202, '2020-10-10', 'D'),
 (10108, 7, 101, '2023-11-26', 'B'),
 (10109, 7, 303, '2022-03-15', 'C'),
 (10110, 7, 202, '2024-01-31', 'A'),
 (10111, 8, 505, '2021-02-14', 'D'),
 (10112, 8, 404, '2022-2-18', 'C'),
 (10113, 10, 101, '2025-04-28', 'A'),
 (10114, 10, 505, '2021-08-23', 'B'),
 (10115, 10,202, '2020-09-21','C');

--STUDENTS WHO ENROLLED IN AT LEAST ONE COURSE
select distinct student_id from enrollment e ;

--STUDENTS WHO ENROLLED IN MORE THAN TWO COURSES
select student_id
from Enrollment
group by student_id
having COUNT(course_id) > 2;

--COURSES WITH TOTAL ENROLLED STUDENTS
select course_id, count (student_id) as total_students
from enrollment e 
group by course_id;

--AVERAGE GRADE PER COURSE
select course_id,
       AVG(CASE grade
               WHEN 'A' THEN 4
               WHEN 'B' THEN 3
               WHEN 'C' THEN 2
               WHEN 'D' THEN 1
               ELSE 0
           END) AS average_grade
from Enrollment
group by course_id;

--STUDENTS NOT ENROLLED IN ANY COURSE
select *
from Student
WHERE student_id NOT IN (SELECT student_id FROM Enrollment);

--STUDENTS AVERAGE GRADE
select student_id,
       AVG(CASE grade
               WHEN 'A' THEN 4
               WHEN 'B' THEN 3
               WHEN 'C' THEN 2
               WHEN 'D' THEN 1
               ELSE 0
           END) AS avg_grade
from Enrollment
group by student_id;

--COURSES PER INSTRUCTOR
select instructor_id, COUNT(course_id) AS total_courses
from Course
group by instructor_id;

--STUDENTS TAUGHT BY A SPECIFIC INSTRUCTOR
select distinct e.student_id
from Enrollment e
join Course c on e.course_id = c.course_id
join Instructor i on c.instructor_id = i.instructor_id
WHERE i.first_name = 'Toto' AND i.last_name = 'Wolf';

--TOP 3 STUDENTS
select student_id,
       AVG(CASE grade
               WHEN 'A' THEN 4
               WHEN 'B' THEN 3
               WHEN 'C' THEN 2
               WHEN 'D' THEN 1
               ELSE 0
           END) AS avg_grade
from Enrollment
group by student_id
order by avg_grade DESC
limit 3;

--STUDENTS FAILING IN MORE THAN ONE COURSE
select student_id
from Enrollment
where grade = 'F'
group by student_id
having COUNT(*) > 1;

--STUDENT COURSE SUMMARY
create view  student_course_summary as
select s.first_name || ' ' || s.last_name AS student_name,
       c.course_name,
       e.grade
from Enrollment e
join Student s on e.student_id = s.student_id
join Course c on e.course_id = c.course_id;

--ADD INDEX ON Enrollment.Student_id
create index idx_student_id on Enrollment(student_id);



 
