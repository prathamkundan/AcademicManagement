-- This file contains the SQL queries to create the tables in the database.

-- This is the table that holds the users of the system and their passwords.
CREATE TABLE IF NOT EXISTS USERS (
    user_id VARCHAR(12) NOT NULL PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    user_role VARCHAR(7) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    phone_number CHAR(10),
    email VARCHAR(255) NOT NULL,
    CHECK (user_role in ('ADMIN', 'FACULTY', 'STUDENT'))
);
INSERT INTO USERS(user_id, user_name, password, user_role, email) 
VALUES ('admin', 'admin', 'password', 'ADMIN', 'admin@iitrpr.ac.in');

-- Contains information about the departments in the institute.
CREATE TABLE IF NOT EXISTS DEPT (
    dept_id VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) UNIQUE NOT NULL
);

-- Contains information about the students in the institute.
CREATE TABLE IF NOT EXISTS STUDENTS (
    student_id VARCHAR(12) PRIMARY KEY REFERENCES USERS(user_id),
    dept VARCHAR(4) REFERENCES DEPT(dept_id) ,
    batch INTEGER
);

-- Contains information about the faculty members in the institute.
CREATE TABLE IF NOT EXISTS FACULTY (
    faculty_id VARCHAR(12) PRIMARY KEY REFERENCES USERS(user_id),
    dept VARCHAR(4) REFERENCES DEPT(dept_id)
);

-- Contains information about the courses offered by the institute.
CREATE TABLE IF NOT EXISTS COURSE_CATALOGUE (
    course_id VARCHAR(6) PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL UNIQUE,
    course_dept VARCHAR(4) REFERENCES DEPT(dept_id),
    ltp varchar(5) NOT NULL,
    credits INTEGER NOT NULL
);

-- Contains the mandatory prerequisites for a course.
CREATE TABLE IF NOT EXISTS COURSE_PREREQS (
    course_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id),
    prereq_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id)
);

-- This table holds the offerings of each semester.
-- Each course only offered in a semester only occurs once
CREATE TABLE IF NOT EXISTS OFFERINGS (
    course_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id),
    instructor VARCHAR(12) REFERENCES FACULTY(faculty_id),
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    CHECK (semester in (1, 2))
);

-- This table holds the elective options. 
-- If a course has been offered to a department in a particular semester, it will be present in this table.
-- It will also show what kind of elective the course is (program, open, science, humanity) for that department. 
CREATE TABLE IF NOT EXISTS OFFERING_DETAILS (
    course_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id),
    semester INTEGER NOT NULL,
    year INTEGER NOT NULL,
    batch INTEGER NOT NULL,
    dept VARCHAR(4) NOT NULL,
    credit_option VARCHAR(4) NOT NULL,
    CHECK (credit_option in ('PC', 'PE', 'OE', 'HE', 'SE'))
);

-- This table holds the custom CGPA pre-requisites for each course.
CREATE TABLE IF NOT EXISTS OFFERING_CONSTRAINTS (
    course_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id),
    semester INTEGER NOT NULL,
    year INTEGER NOT NULL,
    pre_course_id VARCHAR(6),
    min_grade FLOAT NOT NULL
);

-- This table holds student records for each semester.
CREATE TABLE IF NOT EXISTS RECORD (
    student_id VARCHAR(12) REFERENCES STUDENTS(student_id),
    course_id VARCHAR(6) REFERENCES COURSE_CATALOGUE(course_id),
    semester INTEGER NOT NULL,
    year INTEGER NOT NULL,
    status VARCHAR(20),
    credit_option VARCHAR(4) NOT NULL,
    grade VARCHAR(2),
    CHECK (credit_option in ('PC', 'PE', 'OE', 'HE', 'SE')),
    CHECK (status in ('ENROLLED', 'PASSED', 'FAILED')),
    CHECK (grade in ('A', 'A-', 'B', 'B-', 'C', 'C-', 'D', 'D-', 'E', 'E-', 'F', 'NA'))
);

-- This table holds the credit requirements for students in the university.
CREATE TABLE IF NOT EXISTS UG_REQUIREMENTS (
    dept_id VARCHAR(4) NOT NULL REFERENCES DEPT(dept_id),
    open_el INTEGER NOT NULL,
    program_el INTEGER NOT NULL,
    humanity_el INTEGER NOT NULL,
    science_el INTEGER NOT NULL,
    capstone INTEGER NOT NULL,
    credit_multiplier FLOAT DEFAULT 1.25,
    base_credits INTEGER NOT NULL DEFAULT 24
);

-- This table holds general information such as the ongoing year and semester.
CREATE TABLE IF NOT EXISTS ACADEMIC_INFO (
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    semester_status VARCHAR(16) NOT NULL,
    CHECK (semester in (1, 2)),
    CHECK (semester_status in ('ENROLLING', 'ONGOING', 'GRADING', 'COMPLETED'))
);

CREATE TABLE IF NOT EXISTS CREDIT_INFO (
    base_credits INTEGER NOT NULL DEFAULT 24,
    credit_multiplier FLOAT DEFAULT 1.25
)