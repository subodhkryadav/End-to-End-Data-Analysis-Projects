-- --------------------------------- Day- 14 ------------------------------------------------
-- Today focus on the ->

-- |--> CTE (Common Table Expressions)
-- |--> Simple CTE
-- |--> Multiple CTEs
-- |--> Nested CTE
-- |--> Recursive CTE

-- Use the existing Operation database
use Operation;

-- ============================================================
-- SECTION 1: SIMPLE CTE
-- ============================================================

-- A CTE is a temporary named result set defined using the WITH keyword.
-- It exists only for the duration of the query.

-- Syntax:
-- WITH cte_name AS (
--     SELECT ...
-- )
-- SELECT * FROM cte_name;

-- Example 1: Get all students who are enrolled in a course
WITH enrolled_students AS (
    SELECT student_id, student_name, student_course_id
    FROM student
    WHERE student_course_enroll = 'yes'
)
SELECT * FROM enrolled_students;

-- Example 2: Get all courses that belong to the 'analytics' tag
WITH analytics_courses AS (
    SELECT course_id, course_name, course_tag
    FROM course
    WHERE course_tag = 'analytics'
)
SELECT * FROM analytics_courses;


-- ============================================================
-- SECTION 2: CTE WITH AGGREGATION
-- ============================================================

-- Find the total number of students enrolled per course_id
WITH enrollment_count AS (
    SELECT student_course_id, COUNT(*) AS total_enrolled
    FROM student
    WHERE student_course_enroll = 'yes'
    GROUP BY student_course_id
)
SELECT * FROM enrollment_count;

-- Join the CTE result back with the course table to get course names
WITH enrollment_count AS (
    SELECT student_course_id, COUNT(*) AS total_enrolled
    FROM student
    WHERE student_course_enroll = 'yes'
    GROUP BY student_course_id
)
SELECT c.course_id, c.course_name, ec.total_enrolled
FROM course c
JOIN enrollment_count ec ON c.course_id = ec.student_course_id;


-- ============================================================
-- SECTION 3: MULTIPLE CTEs (chained with comma)
-- ============================================================

-- You can define multiple CTEs in one WITH clause, separated by commas.
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


-- ============================================================
-- SECTION 4: CTE vs SUBQUERY (same result, better readability)
-- ============================================================

-- Using a subquery (harder to read):
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
);

-- Using a CTE (cleaner and reusable):
WITH analytics_courses AS (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
)
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (SELECT course_id FROM analytics_courses);


-- ============================================================
-- SECTION 5: RECURSIVE CTE
-- ============================================================

-- A Recursive CTE calls itself to process hierarchical or sequential data.
-- Syntax:
-- WITH RECURSIVE cte_name AS (
--     -- Anchor member (starting point)
--     SELECT ...
--     UNION ALL
--     -- Recursive member (repeating logic)
--     SELECT ... FROM cte_name WHERE <condition>
-- )
-- SELECT * FROM cte_name;

-- Example: Generate a number series from 1 to 10
WITH RECURSIVE number_series AS (
    SELECT 1 AS num          -- anchor: start at 1
    UNION ALL
    SELECT num + 1           -- recursive: increment by 1
    FROM number_series
    WHERE num < 10           -- termination condition
)
SELECT * FROM number_series;

-- Example: Create an employee-manager hierarchy table
CREATE TABLE IF NOT EXISTS employee (
    emp_id   INT,
    emp_name VARCHAR(40),
    manager_id INT           -- NULL means top-level (no manager)
);

INSERT INTO employee VALUES
    (1, 'Alice',   NULL),    -- CEO
    (2, 'Bob',     1),       -- reports to Alice
    (3, 'Charlie', 1),       -- reports to Alice
    (4, 'David',   2),       -- reports to Bob
    (5, 'Eve',     2),       -- reports to Bob
    (6, 'Frank',   3);       -- reports to Charlie

-- Traverse the hierarchy starting from the top (Alice)
WITH RECURSIVE emp_hierarchy AS (
    -- Anchor: start with the top-level employee (no manager)
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: find employees whose manager_id matches a previous row
    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employee e
    JOIN emp_hierarchy eh ON e.manager_id = eh.emp_id
)
SELECT * FROM emp_hierarchy
ORDER BY level, emp_id;
-- Level 1 = Alice (CEO)
-- Level 2 = Bob, Charlie (direct reports)
-- Level 3 = David, Eve, Frank (second tier)


-- ============================================================
-- SECTION 6: QUICK COMPARISON
-- ============================================================

-- | Feature         | Subquery        | CTE                  |
-- |-----------------|-----------------|----------------------|
-- | Readability     | Hard to read    | Easy to read         |
-- | Reusability     | Cannot reuse    | Can reference again  |
-- | Recursion       | Not possible    | Supported            |
-- | Performance     | Similar         | Similar (optimizer)  |


-- example no. 1
With sample_student as (
	select * from course where course_id in (101,102,106)
)
select * from sample_student where course_tag='java';

-- on the cross join perform the cte
with outcome_cross_join as(
select c.course_id,c.course_name,c.course_desct,
s.student_id,s.student_name,s.student_course_enroll from course c
cross join student s)
select student_id,student_name,course_id,course_name,student_course_enroll from outcome_cross_join where student_id=306;

-- another example
with ctetest as (
	select 1 as col1 , 2 as col2
    union all 
    select 3,4
)
select col1 from ctetest;

-- Now go the next cte that name is CTE Recursive
with recursive cte(n) as(
	select 1 union all select n+1 from cte where n<5)
select * from cte;

-- another example of the recursive cte
with recursive cte as(
	select 1 as n, 10 as p ,20 as q 
    union all
    select n+1,p+1,q+1 from cte where n<5)
select * from cte;





select * from course;

