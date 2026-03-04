# Today's Focus: Pivoting in SQL (Using IF + Aggregation Functions)

---

## 1. What is Pivoting?

**Functionality:**
Pivoting is a technique to transform row-level data into columns. In MySQL, since there is no native `PIVOT` keyword, it is achieved using the `IF()` (or `CASE`) function combined with aggregate functions inside a `GROUP BY` query.

**Example Use:**
An `order_table` with columns `order_id`, `employed_id`, and `vendor_id` can be pivoted so that each `employed_id` becomes a separate column showing its corresponding `vendor_id` value.

---

## 2. Basic Pivot Using IF()

**Functionality:**
The `IF(condition, value_if_true, value_if_false)` function is used to conditionally return a value only when the row matches a specific category. Combined with `SELECT`, it spreads categorical row values across multiple columns.

**Example Use:**
```sql
SELECT order_id,
  IF(employed_id = 258, vendor_id, NULL) AS "258",
  IF(employed_id = 254, vendor_id, NULL) AS "254"
FROM order_table;
```
Each column now shows the vendor only for the matching employee, and `NULL` for all others.

---

## 3. Error 1055 — GROUP BY Without Aggregation

**Functionality:**
When pivoting with `GROUP BY`, MySQL throws **Error 1055** if non-grouped columns are referenced in `SELECT` without an aggregate function. This happens because `sql_mode=only_full_group_by` requires all non-key columns to be aggregated.

**Example Use:**
```sql
-- This causes Error 1055:
SELECT student_name,
  IF(student_course = 'fsda', student_marks, NULL) AS "fsda"
FROM students
GROUP BY student_name;
```
**Fix:** Wrap the `IF()` expression inside an aggregate function like `MAX()`, `MIN()`, `SUM()`, `AVG()`, or `COUNT()`.

---

## 4. Pivot with MAX()

**Functionality:**
`MAX()` returns the highest value among all matching rows for each group. When there is only one row per group-column combination, it simply returns that value. If there are duplicates (same student, same course), `MAX()` picks the highest mark.

**Example Use:**
```sql
SELECT student_name,
  MAX(IF(student_course = 'fsda', student_marks, NULL)) AS "fsda",
  MAX(IF(student_course = 'fsds', student_marks, NULL)) AS "fsds"
FROM students
GROUP BY student_name;
```
For a student with two entries in `fsda` (marks 99 and 100), `MAX()` returns `100`.

---

## 5. Pivot with MIN()

**Functionality:**
`MIN()` returns the lowest value among all matching rows for each group. It is the counterpart of `MAX()` and is useful when the smallest value is the required result.

**Example Use:**
```sql
SELECT student_name,
  MIN(IF(student_course = 'fsda', student_marks, NULL)) AS "fsda",
  MIN(IF(student_course = 'fsds', student_marks, NULL)) AS "fsds"
FROM students
GROUP BY student_name;
```
For a student with marks 99 and 100 in `fsda`, `MIN()` returns `99`.

---

## 6. Pivot with AVG()

**Functionality:**
`AVG()` calculates the average of all matching values for each group-column combination. It is useful when you want to see the mean performance across duplicate entries.

**Example Use:**
```sql
SELECT student_name,
  AVG(IF(student_course = 'fsda', student_marks, NULL)) AS "fsda"
FROM students
GROUP BY student_name;
```
For marks 99 and 100 in `fsda`, `AVG()` returns `99.5`.

---

## 7. Pivot with SUM()

**Functionality:**
`SUM()` adds up all matching values for each group-column combination. It is useful when you want the cumulative total instead of a single representative value.

**Example Use:**
```sql
SELECT student_name,
  SUM(IF(student_course = 'fsda', student_marks, NULL)) AS "fsda"
FROM students
GROUP BY student_name;
```
For marks 99 and 100 in `fsda`, `SUM()` returns `199`.

---

## 8. Pivot with COUNT()

**Functionality:**
`COUNT()` counts how many non-NULL values exist for each group-column combination. It reveals how many times a student appeared in a particular course.

**Example Use:**
```sql
SELECT student_name,
  COUNT(IF(student_course = 'fsda', student_marks, NULL)) AS "fsda"
FROM students
GROUP BY student_name;
```
A student with two entries in `fsda` gets a count of `2`; a student with no entry gets `0`.

---

## 9. Combined Pivot — Total Marks + Subject-wise Marks

**Functionality:**
A real-world use case where both the overall total and individual subject marks are shown in a single row per student. `SUM(student_marks)` provides the grand total while `MAX(IF(...))` provides each subject's mark. Results are ordered by total marks descending to highlight top performers.

**Example Use:**
```sql
SELECT
  student_name,
  SUM(student_marks)                                    AS "Total_Marks",
  MAX(IF(student_course = 'fsda', student_marks, 0))   AS "FSDA",
  MAX(IF(student_course = 'fsds', student_marks, 0))   AS "FSDS",
  MAX(IF(student_course = 'big_data', student_marks, 0)) AS "Big_Data",
  MAX(IF(student_course = 'machine_learning', student_marks, 0)) AS "ML"
FROM students
GROUP BY student_name
ORDER BY Total_Marks DESC;
```
This produces a clean report with one row per student showing all relevant metrics together.

---

# Conclusion

Pivoting in MySQL is achieved by combining `IF()` with aggregate functions inside a `GROUP BY` query:

- **Basic IF()** — Spreads row values across columns conditionally
- **Error 1055** — Always wrap `IF()` in an aggregate function when using `GROUP BY`
- **MAX()** — Returns the highest value per group-column (picks max on duplicates)
- **MIN()** — Returns the lowest value per group-column (picks min on duplicates)
- **AVG()** — Returns the mean value per group-column
- **SUM()** — Returns the cumulative total per group-column
- **COUNT()** — Returns how many entries exist per group-column
- **Combined Pivot** — Mix `SUM()` for totals and `MAX(IF())` for individual values in one query

Pivoting is a powerful way to reshape data for reporting and analysis directly inside SQL without needing external tools.
