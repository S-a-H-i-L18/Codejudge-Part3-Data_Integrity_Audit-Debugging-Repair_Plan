-- =========================================
-- ROW COUNT VALIDATION
-- =========================================

SELECT 'students' AS table_name, COUNT(*) AS row_count
FROM students;

SELECT 'courses' AS table_name, COUNT(*) AS row_count
FROM courses;

SELECT 'submissions' AS table_name, COUNT(*) AS row_count
FROM submissions;

SELECT 'attendance' AS table_name, COUNT(*) AS row_count
FROM attendance;

-- =========================================
-- DISTINCT PRIMARY KEY COUNTS
-- =========================================

SELECT COUNT(DISTINCT student_id) AS distinct_students
FROM students;

SELECT COUNT(DISTINCT course_id) AS distinct_courses
FROM courses;

SELECT COUNT(DISTINCT submission_id) AS distinct_submissions
FROM submissions;

-- =========================================
-- NULL OR BLANK VALUE CHECKS
-- =========================================

SELECT *
FROM students
WHERE email IS NULL
   OR TRIM(email) = '';

SELECT *
FROM students
WHERE roll_number IS NULL
   OR TRIM(roll_number) = '';

SELECT *
FROM courses
WHERE course_code IS NULL
   OR TRIM(course_code) = '';

-- =========================================
-- EMPTY TABLE CHECK
-- =========================================

SELECT 'regrade_requests' AS table_name
WHERE NOT EXISTS (
    SELECT 1 FROM regrade_requests
);