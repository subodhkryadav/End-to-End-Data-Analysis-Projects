# SQL Day 15: Triggers

## Topics Covered
- Before / After Insert
- Before / After Update
- Before / After Delete

---

## What is a Trigger?

A **Trigger** is an automatic SQL action that fires when a specified event (`INSERT`, `UPDATE`, `DELETE`) occurs on a table.

```sql
CREATE TRIGGER trigger_name
BEFORE | AFTER  INSERT | UPDATE | DELETE
ON table_name FOR EACH ROW
BEGIN
    -- logic here
END;
```

---

## 6 Types of Triggers

| # | Type | When it fires |
|---|------|---------------|
| 1 | BEFORE INSERT | Before a new row is inserted |
| 2 | AFTER INSERT | After a new row is inserted |
| 3 | BEFORE UPDATE | Before an existing row is updated |
| 4 | AFTER UPDATE | After an existing row is updated |
| 5 | BEFORE DELETE | Before a row is deleted |
| 6 | AFTER DELETE | After a row is deleted |

---

## OLD and NEW Keywords

| Keyword | Available in | Description |
|---------|-------------|-------------|
| `NEW` | INSERT, UPDATE | The new row value being written |
| `OLD` | UPDATE, DELETE | The existing row value before change/delete |

---

## Examples

### Before Insert — Auto-fill date and user

```sql
DELIMITER //
CREATE TRIGGER before_insert_trigger
BEFORE INSERT ON course FOR EACH ROW
BEGIN
    SET NEW.create_date = NOW();
    SET NEW.user_info = USER();
END //
DELIMITER ;
```

### Before Insert — Mirror to a reference table

```sql
DELIMITER //
CREATE TRIGGER insert_before_both_table
BEFORE INSERT ON course FOR EACH ROW
BEGIN
    SET NEW.create_date = SYSDATE();
    SET NEW.user_info = USER();
    INSERT INTO ref_course VALUES(NOW(), USER());
END //
DELIMITER ;
```

### After Delete — Archive deleted rows using OLD

```sql
DELIMITER //
CREATE TRIGGER to_delete_other_tables
AFTER DELETE ON test1 FOR EACH ROW
BEGIN
    INSERT INTO test3(c1, c2, c3) VALUES(OLD.c1, OLD.c2, OLD.c3);
END //
DELIMITER ;
```

### Before vs After Update — OLD vs NEW values

```sql
-- AFTER UPDATE: log what the value WAS (OLD)
DELIMITER //
CREATE TRIGGER after_update_log
AFTER UPDATE ON test11 FOR EACH ROW
BEGIN
    INSERT INTO test12(c1, c2, c3) VALUES(OLD.c1, OLD.c2, OLD.c3);
END //
DELIMITER ;

-- BEFORE UPDATE: log what the value WILL BE (NEW)
DELIMITER //
CREATE TRIGGER before_update_log
BEFORE UPDATE ON test11 FOR EACH ROW
BEGIN
    INSERT INTO test12(c1, c2, c3) VALUES(NEW.c1, NEW.c2, NEW.c3);
END //
DELIMITER ;
```

---

## Key Takeaways

- Use **BEFORE** triggers to modify incoming data before it's saved (e.g., auto-fill columns).
- Use **AFTER** triggers to react to changes (e.g., logging, syncing other tables).
- Use `OLD` to access the row's value **before** the change.
- Use `NEW` to access the row's value **after** the change.
- A single trigger can affect **multiple tables** inside its `BEGIN...END` block.

---


