# Today's focus Normal Forms (1NF, 2NF, 3NF, BCNF, 4NF, 5NF, 6NF)

---

## 1. First Normal Form (1NF)

**Functionality:**
1NF requires that every column in a table holds atomic (indivisible) values and that there are no repeating groups or arrays stored in a single column. Each row must be uniquely identifiable.

**Example Use:**
A student table storing multiple courses as a comma-separated string in one column violates 1NF. The fix is to split each course into a separate row so every value is atomic.

---

## 2. Second Normal Form (2NF)

**Functionality:**
2NF builds on 1NF and eliminates partial dependencies. In a table with a composite primary key, every non-key column must depend on the **entire** composite key, not just a part of it.

**Example Use:**
An orders table with a composite key of (order_id, product_id) where product_name depends only on product_id violates 2NF. The fix is to move product_name into a separate products table keyed by product_id alone.

---

## 3. Third Normal Form (3NF)

**Functionality:**
3NF builds on 2NF and removes transitive dependencies. A non-key column must not depend on another non-key column — it must depend directly and only on the primary key.

**Example Use:**
An employees table where zip_code determines city creates a transitive dependency (employee_id → zip_code → city). The fix is to move zip_code and city into a separate zip table.

---

## 4. Boyce-Codd Normal Form (BCNF)

**Functionality:**
BCNF is a stricter version of 3NF. For every functional dependency X → Y in the table, X must be a super key. It handles anomalies that 3NF sometimes misses when there are multiple overlapping candidate keys.

**Example Use:**
A student-teacher-subject table where teacher → subject holds but teacher is not a super key violates BCNF. The fix is to split teacher-subject into its own table and keep only the student-teacher relationship in the original table.

---

## 5. Fourth Normal Form (4NF)

**Functionality:**
4NF builds on BCNF and eliminates multi-valued dependencies. A table should not contain two or more independent multi-valued facts about the same entity stored together, as this creates unnecessary data redundancy.

**Example Use:**
A person table storing both hobbies and phone numbers together forces every hobby to repeat for every phone number. The fix is to store hobbies and phone numbers in two separate tables, each with only the person_id and one attribute.

---

## 6. Fifth Normal Form (5NF)

**Functionality:**
5NF (also called Project-Join Normal Form) builds on 4NF and removes join dependencies. A table is in 5NF if it cannot be decomposed into smaller tables without losing information. It handles complex three-way (or more) relationships.

**Example Use:**
A supplier-project-part table representing the constraint "Supplier S supplies Part P to Project J only if S can supply P and J uses P" cannot be safely split into two-way join tables without losing data. The three-way table must be kept intact.

---

## 7. Sixth Normal Form (6NF)

**Functionality:**
6NF is the most advanced normal form and is primarily used in temporal databases. A table is in 6NF when it has no non-trivial join dependencies at all — meaning each table contains only the primary key plus exactly one non-key attribute, along with time range columns (valid_from, valid_to) to track changes over time.

**Example Use:**
An employee record that changes over time can be split into separate tables for name, salary, and department, each with its own time period. This allows tracking the history of each attribute independently without mixing unrelated changes.

---

# Conclusion

The Normal Forms provide a systematic approach to designing clean, consistent, and redundancy-free relational databases:

- **1NF** — Atomic values, no repeating groups
- **2NF** — No partial dependencies on composite keys
- **3NF** — No transitive dependencies between non-key columns
- **BCNF** — Every determinant must be a super key
- **4NF** — No multi-valued independent facts in one table
- **5NF** — No lossless join dependencies (three-way relationships)
- **6NF** — No non-trivial join dependencies (ideal for temporal data)

Applying normalisation step by step produces tables that are easier to maintain, update, and query without running into insertion, update, or deletion anomalies.
