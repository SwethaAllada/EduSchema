CREATE DATABASE EduSchema;

USE EduSchema;

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_description TEXT,
    course_start_date DATE,
    course_end_date DATE,
    course_category VARCHAR(100)
);

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    profile_description TEXT
);

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    enrollment_date DATE NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    progress DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Assessments (
    assessment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    assessment_name VARCHAR(255) NOT NULL,
    assessment_type VARCHAR(50) NOT NULL,
    max_score DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    assessment_id INT NOT NULL,
    score DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id),
    FOREIGN KEY (assessment_id) REFERENCES Assessments(assessment_id)
);

CREATE TABLE Course_Instructors (
    course_instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

INSERT INTO Courses (course_name, course_description, course_start_date, course_end_date, course_category)
VALUES
('Introduction to Computer Science', 'An introductory course to computer science', '2024-09-01', '2024-12-15', 'Computer Science'),
('Advanced Mathematics', 'A course on advanced mathematical concepts', '2024-09-01', '2024-12-15', 'Mathematics'),
('History of Art', 'Exploring the history of art from ancient to modern times', '2024-09-01', '2024-12-15', 'Art'),
('Basic Physics', 'Fundamentals of physics', '2024-09-01', '2024-12-15', 'Physics'),
('Creative Writing', 'Introduction to creative writing', '2024-09-01', '2024-12-15', 'Literature');

INSERT INTO Instructors (first_name, last_name, email, phone_number, profile_description)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'Expert in Computer Science with over 10 years of experience.'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'Mathematics professor with a PhD in Applied Mathematics.'),
('Alice', 'Johnson', 'alice.johnson@example.com', '1112223333', 'Art historian with a focus on the Renaissance period.'),
('Robert', 'Williams', 'robert.williams@example.com', '2223334444', 'Physics professor with research in quantum mechanics.'),
('Emily', 'Davis', 'emily.davis@example.com', '5556667777', 'Creative writing instructor and published author.');

INSERT INTO Students (first_name, last_name, email, phone_number, enrollment_date)
VALUES
('Michael', 'Brown', 'michael.brown@example.com', '1231231234', '2024-08-15'),
('Jessica', 'Taylor', 'jessica.taylor@example.com', '2342342345', '2024-08-16'),
('David', 'Miller', 'david.miller@example.com', '3453453456', '2024-08-17'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '4564564567', '2024-08-18'),
('Daniel', 'Moore', 'daniel.moore@example.com', '5675675678', '2024-08-19');

INSERT INTO Enrollments (student_id, course_id, enrollment_date, progress)
VALUES
(1, 1, '2024-08-15', 0.00),
(2, 2, '2024-08-16', 0.00),
(3, 3, '2024-08-17', 0.00),
(4, 4, '2024-08-18', 0.00),
(5, 5, '2024-08-19', 0.00);

INSERT INTO Assessments (course_id, assessment_name, assessment_type, max_score)
VALUES
(1, 'Midterm Exam', 'Exam', 100.00),
(2, 'Final Exam', 'Exam', 100.00),
(3, 'Research Paper', 'Assignment', 100.00),
(4, 'Lab Report', 'Lab', 100.00),
(5, 'Short Story', 'Assignment', 100.00);

INSERT INTO Grades (enrollment_id, assessment_id, score)
VALUES
(1, 1, 85.50),
(2, 2, 92.00),
(3, 3, 88.00),
(4, 4, 79.50),
(5, 5, 95.00);

INSERT INTO Course_Instructors (course_id, instructor_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


