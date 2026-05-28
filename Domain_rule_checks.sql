-- =========================================
-- NEGATIVE SCORE CHECK
-- =========================================

SELECT *
FROM submissions
WHERE score < 0;

-- =========================================
-- INVALID DIFFICULTY VALUES
-- =========================================

SELECT *
FROM problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- =========================================
-- INVALID SUBMISSION STATUS
-- =========================================

SELECT *
FROM submissions
WHERE status NOT IN (
    'Accepted',
    'Wrong Answer',
    'Runtime Error',
    'Compilation Error',
    'Time Limit Exceeded'
);

-- =========================================
-- INVALID LANGUAGE VALUES
-- =========================================

SELECT *
FROM submissions
WHERE language NOT IN (
    'Python',
    'Java',
    'C++',
    'JavaScript'
);

-- =========================================
-- INVALID ATTENDANCE STATUS
-- =========================================

SELECT *
FROM attendance
WHERE attendance_status NOT IN (
    'Present',
    'Absent',
    'Late'
);

-- =========================================
-- END TIME BEFORE START TIME
-- =========================================

SELECT *
FROM contests
WHERE end_time < start_time;

-- =========================================
-- RESOLVED TIME BEFORE REQUESTED TIME
-- =========================================

SELECT *
FROM regrade_requests
WHERE resolved_at < requested_at;

-- =========================================
-- EXECUTED TIME BEFORE REQUESTED TIME
-- =========================================

SELECT *
FROM operation_requests
WHERE executed_at < requested_at;

-- =========================================
-- SUBMISSION BEFORE ENROLLMENT DATE
-- =========================================

SELECT
    s.submission_id,
    s.submitted_at,
    e.enrolled_on
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submitted_at < e.enrolled_on;