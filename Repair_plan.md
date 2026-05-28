# Repair Plan

# 1. Duplicate Email Records

Action:

* Manual verification required.

Reason:
Email is a candidate key and duplicate values may indicate identity conflicts.

Example:
student_id 101 and 145 share same email.

---

# 2. Missing Batch References

Action:

* Move invalid records to staging table for review.

Reason:
Foreign key integrity would fail.

Example:
student_id 205 linked to non-existing batch_id.

---

# 3. Invalid Difficulty Values

Action:

* Correct invalid values to nearest valid category.

Example:
difficulty = 'Moderate'
Corrected to:
difficulty = 'Medium'

---

# 4. Negative Scores

Action:

* Set invalid negative scores to NULL and review manually.

Example:
submission_id 330 had score = -5.

---

# 5. Invalid Attendance Status

Action:

* Correct spelling mistakes.

Example:
attendance_status = 'Presents'
Corrected to:
'Present'

---

# 6. Duplicate Enrollment Records

Action:

* Keep earliest row and delete duplicates.

Example:
student_id 12 and course_id 3 duplicated.

---

# 7. Missing Course References

Action:

* Move records into rejected staging table.

Example:
problem_id 90 references missing course_id.

---

# 8. Invalid Contest Timing

Action:

* Manual review required.

Example:
contest_id 5 has end_time before start_time.