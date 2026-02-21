# SQL Partitioning – README

This file contains the basic types of partitioning in SQL and their functionality.

---

## 1. RANGE Partition

**Functionality:**
Range partition divides table data based on a range of values. Each partition contains rows within a defined range.

**Example Use:**
Partition data based on year, salary, date, etc.

---

## 2. HASH Partition

**Functionality:**
Hash partition distributes data evenly across a fixed number of partitions using a hash function on a column.

**Example Use:**
Used when equal data distribution is required and no specific range exists.

---

## 3. LIST Partition

**Functionality:**
List partition divides data based on predefined discrete values.

**Example Use:**
Partition data based on specific categories like country, state, or department.

---

## 4. KEY Partition

**Functionality:**
Key partition is similar to hash partition but uses an internal hashing function provided by SQL automatically.

**Example Use:**
Used when you want automatic hash partitioning without defining your own hash function.

---

## 5. RANGE COLUMNS Partition

**Functionality:**
Range columns partition is similar to range partition but allows partitioning based on multiple columns.

**Example Use:**
Partition data based on multiple fields like (year, month).

---

## 6. LIST COLUMNS Partition

**Functionality:**
List columns partition is similar to list partition but supports multiple columns.

**Example Use:**
Partition data based on combinations like (country, state).

---

## 7. SUBPARTITION

**Functionality:**
Subpartition means dividing a partition into smaller partitions. It is partition inside partition.

**Example Use:**
First partition by year, then subpartition by month.

---

# Conclusion

Partitioning improves:

- Query performance
- Data management
- Large table handling
- Faster data access

It is mainly used in large databases.