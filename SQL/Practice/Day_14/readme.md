# 📊 SQL Day 14: Common Table Expressions (CTEs)

Today's session focused on mastering **CTEs** — a powerful SQL feature that makes complex queries more readable, reusable, and capable of handling recursive (hierarchical) data.

---

## 📑 Table of Contents
1. [What is a CTE?](#-what-is-a-cte)
2. [Simple CTE](#-simple-cte)
3. [CTE with Aggregation](#-cte-with-aggregation)
4. [Multiple CTEs](#-multiple-ctes)
5. [CTE vs Subquery](#-cte-vs-subquery)
6. [Recursive CTE](#-recursive-cte)
7. [Additional Examples](#-additional-examples)
8. [Best Practices](#-best-practices)
9. [Key Takeaways](#-key-takeaways)

---

## 🧠 What is a CTE?

A **Common Table Expression (CTE)** is a temporary, named result set defined using the `WITH` keyword at the beginning of a query. It exists only for the duration of that query and can be referenced like a regular table.

- It does **not** persist after the query completes.
- It can be referenced **multiple times** in the same query — unlike a subquery.
- It supports **recursion**, making it suitable for hierarchical or sequential data.

### General Syntax

```sql
WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
```

---

## 🔷 Simple CTE

Used to isolate filtered or transformed data before the main query consumes it. This separates concerns and keeps the main query clean.

**Example 1 — Get all enrolled students:**

```sql
WITH enrolled_students AS (
    SELECT student_id, student_name, student_course_id
    FROM student
    WHERE student_course_enroll = 'yes'
)
SELECT * FROM enrolled_students;
```

**Example 2 — Get courses tagged as 'analytics':**

```sql
WITH analytics_courses AS (
    SELECT course_id, course_name, course_tag
    FROM course
    WHERE course_tag = 'analytics'
)
SELECT * FROM analytics_courses;
```

> **Tip:** You can also filter further inside the outer `SELECT` — the CTE just scopes the initial result set.

```sql
WITH sample_student AS (
    SELECT * FROM course WHERE course_id IN (101, 102, 106)
)
SELECT * FROM sample_student WHERE course_tag = 'java';
```

---

## 📊 CTE with Aggregation

CTEs can wrap `GROUP BY` and aggregate functions, making the outer query simple and readable.

**Example — Count enrolled students per course, then join with course names:**

```sql
WITH enrollment_count AS (
    SELECT student_course_id, COUNT(*) AS total_enrolled
    FROM student
    WHERE student_course_enroll = 'yes'
    GROUP BY student_course_id
)
SELECT c.course_id, c.course_name, ec.total_enrolled
FROM course c
JOIN enrollment_count ec ON c.course_id = ec.student_course_id;
```

**Why this helps:** Without a CTE, you'd have to nest the aggregation as a subquery inside the `FROM` clause, which is harder to read.

---

## 🔗 Multiple CTEs

Multiple CTEs can be defined in a single `WITH` clause, separated by commas. Each CTE can reference the ones defined before it — this is a clean way to modularise a complex query into logical steps.

**Example — Find students enrolled in analytics-tagged courses:**

```sql
WITH enrolled_students AS (
    SELECT student_id, student_name, student_course_id
    FROM student
    WHERE student_course_enroll = 'yes'
),
analytics_courses AS (
    SELECT course_id, course_name
    FROM course
    WHERE course_tag = 'analytics'
)
SELECT es.student_name, ac.course_name
FROM enrolled_students es
JOIN analytics_courses ac ON es.student_course_id = ac.course_id;
```

> **Note:** Each CTE is separated by a comma. The final `SELECT` statement (with no comma before it) is the main query that consumes the CTEs.

---

## 🔄 CTE vs Subquery

Both approaches often produce identical results, but CTEs are significantly more readable and can be referenced multiple times within the same query.

**Subquery approach (harder to read):**

```sql
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
);
```

**CTE approach (cleaner and reusable):**

```sql
WITH analytics_courses AS (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
)
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (SELECT course_id FROM analytics_courses);
```

### Comparison Table

| Feature | Subquery | CTE |
| :--- | :--- | :--- |
| **Readability** | Hard to follow (nested) | Clear, named blocks |
| **Reusability** | Cannot reference again | Referenced multiple times |
| **Recursion** | Not supported | Fully supported |
| **Performance** | Similar | Similar (same optimizer) |
| **Debugging** | Difficult to isolate | CTE can be tested independently |

---

## 🔁 Recursive CTE

A **Recursive CTE** references itself to process **hierarchical or sequential data** — such as organisational charts, folder trees, bill of materials, or generated number series.

It has two parts joined by `UNION ALL`:
1. **Anchor member** — the starting/base rows (executes once).
2. **Recursive member** — joins back to the CTE itself and runs repeatedly until the termination condition is false.

### Structure

```sql
WITH RECURSIVE cte_name AS (
    -- 1. Anchor member (starting point)
    SELECT ...
    UNION ALL
    -- 2. Recursive member (calls itself)
    SELECT ... FROM cte_name WHERE <termination_condition>
)
SELECT * FROM cte_name;
```

---

### Example 1 — Number Series (1 to 10)

```sql
WITH RECURSIVE number_series AS (
    SELECT 1 AS num                          -- anchor: start at 1
    UNION ALL
    SELECT num + 1                           -- recursive: add 1
    FROM number_series
    WHERE num < 10                           -- stop when num reaches 10
)
SELECT * FROM number_series;
```

**Output:** Rows with values 1 through 10.

---

### Example 2 — Multi-Column Number Series

```sql
WITH RECURSIVE cte AS (
    SELECT 1 AS n, 10 AS p, 20 AS q
    UNION ALL
    SELECT n + 1, p + 1, q + 1
    FROM cte
    WHERE n < 5
)
SELECT * FROM cte;
```

**Output:**

| n | p  | q  |
|---|----|----|
| 1 | 10 | 20 |
| 2 | 11 | 21 |
| 3 | 12 | 22 |
| 4 | 13 | 23 |
| 5 | 14 | 24 |

---

### Example 3 — Employee-Manager Hierarchy

```sql
-- Setup
CREATE TABLE IF NOT EXISTS employee (
    emp_id     INT,
    emp_name   VARCHAR(40),
    manager_id INT           -- NULL = top-level (no manager)
);

INSERT INTO employee VALUES
    (1, 'Alice',   NULL),    -- CEO
    (2, 'Bob',     1),       -- reports to Alice
    (3, 'Charlie', 1),       -- reports to Alice
    (4, 'David',   2),       -- reports to Bob
    (5, 'Eve',     2),       -- reports to Bob
    (6, 'Frank',   3);       -- reports to Charlie

-- Traverse the hierarchy starting from the top
WITH RECURSIVE emp_hierarchy AS (
    -- Anchor: top-level employee (no manager)
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: employees whose manager exists in the previous level
    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employee e
    JOIN emp_hierarchy eh ON e.manager_id = eh.emp_id
)
SELECT * FROM emp_hierarchy
ORDER BY level, emp_id;
```

**Output:**

| level | emp_id | emp_name | manager_id |
|-------|--------|----------|------------|
| 1     | 1      | Alice    | NULL       |
| 2     | 2      | Bob      | 1          |
| 2     | 3      | Charlie  | 1          |
| 3     | 4      | David    | 2          |
| 3     | 5      | Eve      | 2          |
| 3     | 6      | Frank    | 3          |

- **Level 1** → Alice (CEO)
- **Level 2** → Bob, Charlie (direct reports)
- **Level 3** → David, Eve, Frank (second tier)

---

## 🧪 Additional Examples

### CTE with CROSS JOIN

```sql
WITH outcome_cross_join AS (
    SELECT
        c.course_id, c.course_name, c.course_desct,
        s.student_id, s.student_name, s.student_course_enroll
    FROM course c
    CROSS JOIN student s
)
SELECT student_id, student_name, course_id, course_name, student_course_enroll
FROM outcome_cross_join
WHERE student_id = 306;
```

> **Why?** The CTE performs the expensive cross join once. The outer query then applies a simple filter — no need to repeat the join logic.

### Inline Data CTE (no table required)

```sql
WITH ctetest AS (
    SELECT 1 AS col1, 2 AS col2
    UNION ALL
    SELECT 3, 4
)
SELECT col1 FROM ctetest;
```

> **Why?** Useful for unit-testing expressions or generating small reference sets without creating a real table.

---

## ✅ Best Practices

| Practice | Why It Matters |
| :--- | :--- |
| Give CTEs **descriptive names** (`enrolled_students` not `cte1`) | Improves readability and self-documentation |
| Use CTEs instead of **nested subqueries** | Easier to read, test, and maintain |
| For **one-time use**, keep the CTE close to where it's used | Reduces cognitive overhead |
| Always include a **termination condition** in recursive CTEs | Prevents infinite loops |
| Test each CTE **independently** before combining | Makes debugging much faster |

---

## 🚀 Key Takeaways

| Concept | Summary |
| :--- | :--- |
| **Simple CTE** | Isolates filter/transformation logic for cleaner main queries |
| **CTE with Aggregation** | Wraps `GROUP BY` logic so outer queries stay readable |
| **Multiple CTEs** | Chains named result sets — replaces deeply nested subqueries |
| **CTE vs Subquery** | CTEs are reusable, named, and far more maintainable |
| **Recursive CTE** | Handles hierarchies (org charts, trees) and sequential series |

---

> **Next Focus:** Window Functions — `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`, and `PARTITION BY`.
