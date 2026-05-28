# Before and After Evidence

# 1. NULL Email Repair

Before:
Students existed with NULL email values.

Repair:
Updated NULL emails to placeholder value in staging table.

After:
No NULL email values remained in students_staging.

---

# 2. Difficulty Repair

Before:
Some problems had invalid difficulty value 'Moderate'.

Repair:
Updated to 'Medium'.

After:
No rows remained with invalid difficulty.

---

# 3. Negative Score Repair

Before:
Negative scores existed.

Repair:
Scores below zero were replaced with NULL.

After:
No negative scores remained.

---

# 4. Attendance Status Repair

Before:
attendance_status contained invalid value 'Presents'.

Repair:
Corrected to 'Present'.

After:
Only valid attendance statuses remained.

---

# 5. Duplicate Enrollment Repair

Before:
Duplicate enrollment rows existed.

Repair:
Duplicate rows removed using GROUP BY and MIN(rowid).

After:
Each student-course combination became unique.