-- =========================================
-- DUPLICATE PRIMARY KEY CHECKS
-- =========================================

SELECT student_id, COUNT(*)
FROM students
GROUP BY student_id
HAVING COUNT(*) > 1;

SELECT course_id, COUNT(*)
FROM courses
GROUP BY course_id
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE EMAIL CHECK
-- =========================================

SELECT email, COUNT(*)
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE ENROLLMENT CHECK
-- =========================================

SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE CONTEST PROBLEM CHECK
-- =========================================

SELECT contest_id, problem_id, COUNT(*)
FROM contest_problems
GROUP BY contest_id, problem_id
HAVING COUNT(*) > 1;

-- =========================================
-- DUPLICATE ATTENDANCE CHECK
-- =========================================

SELECT session_id, student_id, COUNT(*)
FROM attendance
GROUP BY session_id, student_id
HAVING COUNT(*) > 1;

-- =========================================
-- STUDENTS LINKED TO MISSING BATCHES
-- =========================================

SELECT s.student_id, s.batch_id
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;

-- =========================================
-- ENROLLMENTS LINKED TO MISSING STUDENTS
-- =========================================

SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- =========================================
-- ENROLLMENTS LINKED TO MISSING COURSES
-- =========================================

SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

-- =========================================
-- PROBLEMS LINKED TO MISSING COURSES
-- =========================================

SELECT p.problem_id
FROM problems p
LEFT JOIN courses c
ON p.course_id = c.course_id
WHERE c.course_id IS NULL;

-- =========================================
-- TEST RESULTS LINKED TO MISSING SUBMISSIONS
-- =========================================

SELECT tr.result_id
FROM test_results tr
LEFT JOIN submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;