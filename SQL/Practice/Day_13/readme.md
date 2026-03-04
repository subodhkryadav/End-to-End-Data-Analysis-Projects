# 📊 SQL Day 13: Set Operations & CTEs

Welcome to the Day 13 documentation! Today's session focused on mastering vertical data merging using `UNION` operators and introducing complex query simplification using `CTEs`.

---

## 📑 Table of Contents
1. [Database Schema Expansion](#-database-schema-expansion)
2. [SQL Set Operations (Union)](#-sql-set-operations-union)
3. [Union vs. Union All](#-union-vs-union-all)
4. [Common Table Expressions (CTE)](#-common-table-expressions-cte)

---

## 🛠️ Database Schema Expansion
We utilized the `Operation` database and introduced a third entity to demonstrate multi-table data stacking.

### 1. Course Table
* **Focus:** Master list of training programs.
* **Columns:** `course_id`, `course_name`, `course_desct`, `course_tag`.

### 2. Student Table
* **Focus:** Student demographics and enrollment links.
* **Columns:** `student_id`, `student_name`, `student_mobile`, `student_course_enroll`, `student_course_id`.

### 3. Library Table
* **Focus:** Asset management and librarian records.
* **Columns:** `library_id`, `libraryan_name`, `library_books_name`.

---

## 🔗 SQL Set Operations (Union)
Set operations allow us to combine the result sets of two or more `SELECT` statements vertically.



### 1. The UNION Operator
* **Functionality:** Combines result sets and **removes duplicate rows** by default.
* **Requirement:** Aap must ensure the number of columns and the order of data types match across all `SELECT` statements.
* **Observation:** When combining our 35 total records, `UNION` returned 27, filtering out 8 duplicates.

### 2. Vertical vs Horizontal Stacking
* **Joins:** Combine data **Horizontally** (adding more columns to a row).
* **Unions:** Combine data **Vertically** (adding more rows to a result set).

---

## 🔄 Union vs. Union All
A critical distinction in performance and data integrity.

| Feature | UNION | UNION ALL |
| :--- | :--- | :--- |
| **Duplicates** | Removes duplicate records. | Keeps all records, including duplicates. |
| **Performance** | Slower (requires an internal sorting/distinct check). | Faster (simply appends data). |
| **Result Count** | Distinct records only. | Total sum of all rows from all tables. |

---

## 🧠 Common Table Expressions (CTE)
As we move into Day 14, we begin using `WITH` clauses to create temporary result sets.

### Key Benefits:
* **Readability:** Breaks complex queries into simple, named blocks.
* **Reusability:** A CTE can be referenced multiple times within a single query.
* **Hierarchy:** Essential for managing recursive data (e.g., manager-employee relationships).

---

## 🚀 Key Takeaways
| Feature | Benefit |
| :--- | :--- |
| **Data Consolidation** | `UNION` allows aap to create a unified view from disparate tables like Students and Library. |
| **Integrity** | Understanding column-count requirements prevents runtime errors during set operations. |
| **Optimization** | Using `UNION ALL` when duplicates aren't a concern significantly boosts query speed. |

---

> **Next Focus:** Deep dive into Recursive CTEs, Window Functions, and Advanced Subqueries.