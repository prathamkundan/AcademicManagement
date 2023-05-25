\i ./SQL/remove_tables.sql;
\i ./SQL/schema.sql;

-- SELECT cc.course_id, cc.course_name, cc.ltp, cc.credits, o.instructor, od.credit_option
-- FROM offerings o, offering_details od, course_catalogue cc
-- WHERE o.course_id = cc.course_id AND cc.course_id = od.course_id 
-- AND od.batch = 2017 AND od.dept = 'CS' AND od.semester = 1 AND od.year = 2020;  

\i ./SQL/test_data.sql;