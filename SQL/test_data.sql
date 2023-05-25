INSERT INTO USERS(user_id, user_name, password, user_role, email)
VALUES ('admin', 'admin', 'password', 'ADMIN', 'admin@iitrpr.ac.in');

INSERT INTO CREDIT_INFO (base_credits, credit_multiplier) VALUES (20, 1.5);

INSERT INTO USERS (user_id, password, user_role, user_name, phone_number, email) values
('ApMu', '1234', 'FACULTY', 'Aparna Mukherjee', '1234567890', 'apmu@iitrpr.ac.in'),
('ShDa', '1234', 'FACULTY', 'Shirshendu Das', '1234567890', 'shda@iitrpr.ac.in'),
('ViGu', '1234', 'FACULTY', 'Vishwanathan Gunturi', '1234567890', 'vigu@iitrpr.ac.in'),
('BaSo', '1234', 'FACULTY', 'Balwinder Sodhi', '1234567890', 'baso@iitrpr.ac.in'),
('NiAu', '1234', 'FACULTY', 'Nitin Auluck', '1234567890', 'niau@iitrpr.ac.in'),
('ArKu', '1234', 'FACULTY', 'Arun Kumar', '1234567890', 'arku@iitrpr.ac.in'),
('KaMo', '1234', 'FACULTY', 'Kaushik Mondal', '1234567890', 'kamo@iitrpr.ac.in'),
('BaKu', '1234', 'FACULTY', 'Balesh Kumar', '1234567890', 'baku@iitrpr.ac.in'),
('SaRo', '1234', 'FACULTY', 'Saikat Roy', '1234567890', 'saro@iitrpr.ac.in'),
('RaSa', '1234', 'FACULTY', 'Ram Sakhsham', '1234567890', 'rasa@iitrpr.ac.in'),
('BaSu', '1234', 'FACULTY', 'Basant Subba', '1234567890', 'basu@iitrpr.ac.in'),
('ShJa', '1234', 'FACULTY', 'Shree Jayadevan', '1234567890', 'sjja@iitrpr.ac.in'),
('AnLo', '1234', 'FACULTY', 'Ansu Louis', '1234567890', 'niau@iitrpr.ac.in'),
('RaRi', '1234', 'FACULTY', 'Rano Ringo', '1234567890', 'niau@iitrpr.ac.in'),
('AsSa', '1234', 'FACULTY', 'Ashish Sahani', '1234567890', 'niau@iitrpr.ac.in'),
('BaSi', '1234', 'FACULTY', 'Balwinder Singh', '1234567890', 'niau@iitrpr.ac.in');

INSERT INTO DEPT (dept_id, dept_name) values 
('CS', 'Comupter Science'),
('EE', 'Electrical'),
('ME', 'Mechanical'),
('MA', 'Mathematics'),
('HS', 'Humanities and Social Sciences');

INSERT INTO COURSE_CATALOGUE (course_id, course_name, course_dept, ltp, credits) values 
('GE103', 'Introduction to Programming', 'CS', '3-1-0', 4),
('GE104', 'Introduction to Electronics Lab', 'EE', '0-0-3', 1),
('GE105', 'Workshop', 'ME', '3-1-0', 3),
('GE106', 'BasicElectronics', 'EE', '3-1-0', 3),
('GE107', 'Introduction to Electronics', 'EE', '3-1-0', 4),
('GE108', 'Introduction to Programming Lab', 'CS', '0-0-3', 1),
('CS101', 'Discrete Mathematics', 'CS', '3-1-0', 4),
('MA101', 'Introduction to Calculus', 'MA', '3-1-0', 3),
('MA102', 'Introduction to Linear Algebra', 'MA', '3-1-0', 3),
('CS201', 'Data Structures', 'CS', '3-1-0', 4),
('CS202', 'Object Oriented Programming', 'CS', '3-1-0', 4),
('CS203', 'Digital Logic Design', 'CS', '3-1-0', 4),
('CS204', 'Computer Organization', 'CS', '3-1-0', 4),
('HS101', 'Professional Ethics', 'HS', '3-1-0', 3),
('HS102', 'Professional English', 'HS', '3-1-0', 3),
('HS104', 'Fantasy Writing', 'HS', '3-1-0', 3),
('HS303', 'Insdustrial Management', 'HS', '3-1-0', 3),
('CS303', 'Operating Systems', 'CS', '3-1-0', 4),
('CS534', 'Advanced Computer Architecture', 'CS', '3-1-0', 4),
('CS301', 'Database Systems', 'CS', '3-1-0', 4);

INSERT into COURSE_PREREQS values ('CS201', 'CS101');
INSERT into COURSE_PREREQS values ('CS202', 'CS201');
INSERT into COURSE_PREREQS values ('CS203', 'CS101');
INSERT into COURSE_PREREQS values ('CS534', 'CS204');

INSERT INTO FACULTY (faculty_id, dept) values 
('ApMu', 'CS'),
('ShDa', 'CS'),
('ViGu', 'CS'),
('BaSo', 'CS'),
('NiAu', 'CS'),
('ArKu', 'MA'),
('KaMo', 'MA'),
('BaKu', 'MA'),
('SaRo', 'EE'),
('RaSa', 'EE'),
('BaSu', 'EE'),
('ShJa', 'HS'),
('AnLo', 'HS'),
('RaRi', 'HS'),
('BaSi', 'ME'),
('AsSa', 'ME');

INSERT INTO OFFERINGS (course_id, instructor, year, semester) values 
('GE103', 'NiAu', 2020, 1),
('CS101', 'ApMu', 2020, 1),
('GE104', 'RaSa', 2020, 1),
('CS204', 'ShDa', 2020, 1),
('GE105', 'BaSo', 2020, 1),
('HS101', 'ShJa', 2020, 1),
('CS303', 'NiAu', 2020, 1),
('CS534', 'ShDa', 2020, 1),
('CS301', 'ViGu', 2020, 1);

INSERT INTO OFFERING_CONSTRAINTS (offering_id, pre_course_id, min_grade) values
(get_offering_id('CS204', 1, 2020), 'CS201', 7.0),
(get_offering_id('CS534', 1, 2020), 'CS201', 7.0),
(get_offering_id('CS534', 1, 2020), 'CS204', 8.0),
(get_offering_id('CS303', 1, 2020), 'CS201', 7.0),
(get_offering_id('CS301', 1, 2020), 'CS201', 7.0),
(get_offering_id('CS301', 1, 2020), 'CS303', 6.0);

INSERT INTO OFFERING_DETAILS (offering_id, batch, dept, credit_option) values
(get_offering_id('CS303', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('CS303', 1, 2020), 2017, 'EE', 'OE'),
(get_offering_id('CS303', 1, 2020), 2017, 'ME', 'OE'),

(get_offering_id('CS301', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('CS204', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('CS204', 1, 2020), 2017, 'ME', 'OE'),

(get_offering_id('CS101', 1, 2020), 2020, 'CS', 'PC'),
(get_offering_id('CS101', 1, 2020), 2019, 'EE', 'OE'),
(get_offering_id('CS101', 1, 2020), 2019, 'ME', 'OE'),

(get_offering_id('CS534', 1, 2020), 2017, 'CS', 'PE'),

(get_offering_id('GE103', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('GE104', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('GE105', 1, 2020), 2018, 'CS', 'PC'),
(get_offering_id('HS101', 1, 2020), 2018, 'CS', 'PC');