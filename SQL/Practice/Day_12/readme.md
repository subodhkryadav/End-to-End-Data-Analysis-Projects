# 📊 SQL Day 12: Joins, Indexing & Data Operations

Welcome to the Day 12 documentation! Today's session focuses on establishing relationships between tables using Joins and optimizing data retrieval performance using Indexing.

---

## 📑 Table of Contents
1. [Database Schema](#-database-schema)
2. [SQL Joins](#-sql-joins)
3. [Indexing & Optimization](#-indexing--optimization)
4. [Advanced Query Analysis](#-advanced-query-analysis)

---

## 🛠️ Database Schema
We initialized the `Operation` database and created two primary tables to demonstrate relational data mapping.

### 1. Course Table
Stores information regarding available certifications and subjects.
* **Columns:** `course_id`, `course_name`, `course_desc`, `course_tag`.

### 2. Student Table
Stores personal details and enrollment status.
* **Columns:** `student_id`, `student_name`, `student_mobile`, `student_course_enroll`, `student_course_id`.

---

## 🔗 SQL Joins
Joins allow us to combine rows from two or more tables based on a related column between them.

### 1. INNER JOIN
* **Functionality:** Returns records that have matching values in both tables.
* **Use Case:** Finding a list of students who are actively enrolled in existing courses.

### 2. LEFT JOIN (Left Outer Join)
* **Functionality:** Returns all records from the left table (Course), and the matched records from the right table (Student).
* **Use Case:** Identifying courses that have zero enrollments (where student data returns `NULL`).

### 3. RIGHT JOIN (Right Outer Join)
* **Functionality:** Returns all records from the right table (Student), and the matched records from the left table (Course).
* **Use Case:** Spotting students who have entered a course ID that does not exist in the master course list.

---

## ⚡ Indexing & Performance
Indexing is a powerful technique used to speed up the selection of rows by creating a pointer-based lookup system.

### Index Types Covered:
* **Simple Index:** Created on a single column (e.g., `course_id`) to accelerate basic search queries.
* **Composite Index:** Created on multiple columns (e.g., `course_id`, `course_name`) for complex filtering.
* **Unique Index:** Ensures that all values in a column remain distinct while providing the speed benefits of an index.

---

## 🔍 Advanced Query Analysis
To ensure our database stays efficient, we use optimization commands:

* **SHOW INDEXES:** Displays all active indexes on a specific table.
* **EXPLAIN:** Provides a roadmap of how the SQL engine executes a query (Checking for "Full Table Scans" vs. "Index Scans").
* **ANALYZE TABLE:** Refreshes table statistics to help the query optimizer make better execution choices.

---

## 🚀 Key Benefits
| Feature | Benefit |
| :--- | :--- |
| **Relational Integrity** | Joins ensure data consistency across different entities. |
| **Search Speed** | Indexing reduces query latency from seconds to milliseconds. |
| **Transparency** | `EXPLAIN` helps developers debug and fix slow-running queries. |

---

> **Next Focus:** Common Table Expressions (CTE), Unions, and Advanced Subqueries.