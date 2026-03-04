# Today's focus CASE Statement

---

## 1. Basic CASE Statement

**Functionality:**
The CASE statement works like an if-else condition in SQL. It checks a condition and returns a value based on whether it is true or false.

**Example Use:**
Check if the course name is "fsds" and return a custom message accordingly.

---

## 2. Multiple WHEN Conditions

**Functionality:**
Multiple WHEN clauses can be added inside a single CASE statement to handle more than one condition at a time.

**Example Use:**
Check both "fsds" and "fsda" course names and return different messages for each.

---

## 3. CASE with Functions

**Functionality:**
Functions like LENGTH() can be used inside a CASE statement to apply logic based on computed values.

**Example Use:**
Check the length of the course name and return a message based on how long the name is.

---

## 4. CASE with Arithmetic

**Functionality:**
Arithmetic operators like modulo (%) can be used inside CASE conditions to apply number-based logic.

**Example Use:**
Check if the course launch year is divisible by 2 or 3 and label it accordingly.

---

## 5. CASE with UPDATE Statement

**Functionality:**
CASE can be combined with an UPDATE statement to update column values based on different conditions in a single query.

**Example Use:**
Update course names from short codes like "RL" and "DL" to their full names using CASE.

---

## 6. CASE for NULL Handling

**Functionality:**
CASE can be used to detect NULL values in a column and replace them with a meaningful default value during an update.

**Example Use:**
Replace NULL values in the course_name column with "Missing course_name".

---

# Conclusion

The CASE statement is useful for:

- Applying conditional logic inside SELECT queries
- Updating multiple rows with different values in one query
- Handling NULL values cleanly
- Replacing complex if-else logic with readable SQL

It is one of the most flexible and commonly used features in SQL.
