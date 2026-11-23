
-- Experiment 7: Database Normalization
-- UNF, 1NF, 2NF, 3NF and BCNF

CREATE DATABASE NormalizationLab;
USE NormalizationLab;

-- Initial unnormalized representation
CREATE TABLE StudentCourse_UNF (
    student_id INT,
    student_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100)
);

INSERT INTO StudentCourse_UNF VALUES
(101, 'Aman', 10, 'CSE', 501, 'DBMS', 201, 'Dr. Sharma'),
(101, 'Aman', 10, 'CSE', 502, 'OS', 202, 'Dr. Verma'),
(102, 'Riya', 10, 'CSE', 501, 'DBMS', 201, 'Dr. Sharma'),
(103, 'Karan', 20, 'IT', 503, 'CN', 203, 'Dr. Gupta');

-- First Normal Form (1NF)
CREATE TABLE Student_1NF (
    student_id INT,
    student_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Student_1NF
SELECT * FROM StudentCourse_UNF;

-- Second Normal Form (2NF)
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student
SELECT DISTINCT student_id, student_name, department_id, department_name
FROM Student_1NF;

INSERT INTO Course
SELECT DISTINCT course_id, course_name, instructor_id, instructor_name
FROM Student_1NF;

INSERT INTO Enrollment
SELECT DISTINCT student_id, course_id
FROM Student_1NF;

-- Third Normal Form (3NF)
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Replace redundant department data in Student
INSERT INTO Department
SELECT DISTINCT department_id, department_name
FROM Student;

-- BCNF demonstration
-- Course table stores course and instructor details.
-- Each course is assumed to be taught by one instructor.
-- course_id determines course_name, instructor_id and instructor_name.

-- Display normalized tables
SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;

-- Join normalized tables
SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    c.course_name,
    c.instructor_name
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
JOIN Department d ON s.department_id = d.department_id;
