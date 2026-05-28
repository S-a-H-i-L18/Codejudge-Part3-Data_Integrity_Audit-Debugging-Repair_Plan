-- =========================================
-- CREATE STAGING TABLE
-- =========================================

CREATE TABLE students_staging AS
SELECT *
FROM students;

-- =========================================
-- BEFORE REPAIR
-- =========================================

SELECT *
FROM students_staging
WHERE email IS NULL;

-- =========================================
-- REPAIR NULL EMAIL
-- =========================================

UPDATE students_staging
SET email = 'unknown@example.com'
WHERE email IS NULL;

-- =========================================
-- AFTER REPAIR
-- =========================================

SELECT *
FROM students_staging
WHERE email IS NULL;

-- =========================================
-- INVALID DIFFICULTY BEFORE
-- =========================================

SELECT *
FROM problems
WHERE difficulty = 'Moderate';

-- =========================================
-- CREATE PROBLEM STAGING
-- =========================================

CREATE TABLE problems_staging AS
SELECT *
FROM problems;

-- =========================================
-- REPAIR DIFFICULTY
-- =========================================

UPDATE problems_staging
SET difficulty = 'Medium'
WHERE difficulty = 'Moderate';

-- =========================================
-- AFTER REPAIR
-- =========================================

SELECT *
FROM problems_staging
WHERE difficulty = 'Moderate';

-- =========================================
-- NEGATIVE SCORE FIX
-- =========================================

CREATE TABLE submissions_staging AS
SELECT *
FROM submissions;

UPDATE submissions_staging
SET score = NULL
WHERE score < 0;

-- =========================================
-- INVALID ATTENDANCE FIX
-- =========================================

CREATE TABLE attendance_staging AS
SELECT *
FROM attendance;

UPDATE attendance_staging
SET attendance_status = 'Present'
WHERE attendance_status = 'Presents';

-- =========================================
-- DUPLICATE ENROLLMENT FIX
-- =========================================

CREATE TABLE enrollments_staging AS
SELECT *
FROM enrollments;

DELETE FROM enrollments_staging
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM enrollments_staging
    GROUP BY student_id, course_id
);