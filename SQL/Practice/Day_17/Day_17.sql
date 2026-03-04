-- ---------------------- Day-17 -------------------------------------
-- Today focus on the Normal Forms (1NF, 2NF, 3NF, BCNF, 4NF, 5NF, 6NF)

-- create and use a new database for normal form practice
create database if not exists NormalForms_DB;
use NormalForms_DB;

-- ===================================================================
-- 1NF - First Normal Form
-- ===================================================================
-- Rules:
--   1. Each column must contain atomic (indivisible) values
--   2. Each column must contain values of a single type
--   3. Each row must be unique (primary key should exist)
--   4. No repeating groups or arrays in a column

-- VIOLATION of 1NF: student_courses column has multiple values (not atomic)
create table if not exists students_not_1nf (
    student_id   int,
    student_name varchar(50),
    student_courses varchar(100)   -- stores "Math, Science, English" (NOT atomic)
);

insert into students_not_1nf values
(1, 'Alice', 'Math, Science, English'),
(2, 'Bob',   'Math, History'),
(3, 'Carol', 'Science, English, Art');

-- see the violation
select * from students_not_1nf;

-- SOLUTION: convert to 1NF by separating courses into individual rows
create table if not exists students_1nf (
    student_id   int,
    student_name varchar(50),
    course       varchar(50),
    primary key (student_id, course)
);

insert into students_1nf values
(1, 'Alice', 'Math'),
(1, 'Alice', 'Science'),
(1, 'Alice', 'English'),
(2, 'Bob',   'Math'),
(2, 'Bob',   'History'),
(3, 'Carol', 'Science'),
(3, 'Carol', 'English'),
(3, 'Carol', 'Art');

-- see the 1NF compliant table
select * from students_1nf;

-- ===================================================================
-- 2NF - Second Normal Form
-- ===================================================================
-- Rules:
--   1. Must already be in 1NF
--   2. Every non-key column must be fully dependent on the ENTIRE primary key
--      (no partial dependency allowed)

-- VIOLATION of 2NF: primary key is (order_id, product_id)
-- but product_name depends only on product_id (partial dependency)
create table if not exists orders_not_2nf (
    order_id     int,
    product_id   int,
    product_name varchar(50),   -- depends only on product_id (partial dep)
    quantity     int,
    primary key (order_id, product_id)
);

insert into orders_not_2nf values
(101, 1, 'Laptop',  2),
(101, 2, 'Mouse',   3),
(102, 1, 'Laptop',  1),
(103, 3, 'Keyboard',5);

-- see the violation
select * from orders_not_2nf;

-- SOLUTION: split into two tables to remove partial dependency
create table if not exists products_2nf (
    product_id   int primary key,
    product_name varchar(50)
);

create table if not exists orders_2nf (
    order_id   int,
    product_id int,
    quantity   int,
    primary key (order_id, product_id)
);

insert into products_2nf values
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Keyboard');

insert into orders_2nf values
(101, 1, 2),
(101, 2, 3),
(102, 1, 1),
(103, 3, 5);

-- see the 2NF compliant tables
select * from products_2nf;
select * from orders_2nf;

-- join to get the full picture
select o.order_id, p.product_name, o.quantity
from orders_2nf o
join products_2nf p on o.product_id = p.product_id;

-- ===================================================================
-- 3NF - Third Normal Form
-- ===================================================================
-- Rules:
--   1. Must already be in 2NF
--   2. No transitive dependencies
--      (non-key column must NOT depend on another non-key column)

-- VIOLATION of 3NF: zip_code -> city (transitive dependency through zip_code)
-- employee_id -> zip_code -> city
create table if not exists employees_not_3nf (
    employee_id   int primary key,
    employee_name varchar(50),
    zip_code      varchar(10),
    city          varchar(50)    -- depends on zip_code, not directly on employee_id
);

insert into employees_not_3nf values
(1, 'Alice', '10001', 'New York'),
(2, 'Bob',   '90001', 'Los Angeles'),
(3, 'Carol', '10001', 'New York'),
(4, 'Dave',  '77001', 'Houston');

-- see the violation
select * from employees_not_3nf;

-- SOLUTION: remove transitive dependency by creating a zip table
create table if not exists zip_city_3nf (
    zip_code varchar(10) primary key,
    city     varchar(50)
);

create table if not exists employees_3nf (
    employee_id   int primary key,
    employee_name varchar(50),
    zip_code      varchar(10),
    foreign key (zip_code) references zip_city_3nf(zip_code)
);

insert into zip_city_3nf values
('10001', 'New York'),
('90001', 'Los Angeles'),
('77001', 'Houston');

insert into employees_3nf values
(1, 'Alice', '10001'),
(2, 'Bob',   '90001'),
(3, 'Carol', '10001'),
(4, 'Dave',  '77001');

-- see the 3NF compliant tables
select * from zip_city_3nf;
select * from employees_3nf;

-- join to get full view
select e.employee_id, e.employee_name, z.city
from employees_3nf e
join zip_city_3nf z on e.zip_code = z.zip_code;

-- ===================================================================
-- BCNF - Boyce-Codd Normal Form
-- ===================================================================
-- Rules:
--   1. Must already be in 3NF
--   2. For every functional dependency X -> Y,
--      X must be a super key (stronger version of 3NF)

-- VIOLATION of BCNF:
-- A student can have multiple teachers for a subject
-- A teacher teaches only one subject
-- Functional dependency: teacher -> subject (but teacher is NOT a super key)
create table if not exists student_teacher_not_bcnf (
    student_id int,
    teacher    varchar(50),
    subject    varchar(50),    -- teacher -> subject violates BCNF
    primary key (student_id, teacher)
);

insert into student_teacher_not_bcnf values
(1, 'Mr. Smith',  'Math'),
(1, 'Ms. Jones',  'Science'),
(2, 'Mr. Smith',  'Math'),
(2, 'Mr. Brown',  'English'),
(3, 'Ms. Jones',  'Science');

-- see the violation
select * from student_teacher_not_bcnf;

-- SOLUTION: split to remove the non-superkey functional dependency
create table if not exists teacher_subject_bcnf (
    teacher  varchar(50) primary key,
    subject  varchar(50)
);

create table if not exists student_teacher_bcnf (
    student_id int,
    teacher    varchar(50),
    primary key (student_id, teacher),
    foreign key (teacher) references teacher_subject_bcnf(teacher)
);

insert into teacher_subject_bcnf values
('Mr. Smith', 'Math'),
('Ms. Jones', 'Science'),
('Mr. Brown', 'English');

insert into student_teacher_bcnf values
(1, 'Mr. Smith'),
(1, 'Ms. Jones'),
(2, 'Mr. Smith'),
(2, 'Mr. Brown'),
(3, 'Ms. Jones');

-- see the BCNF compliant tables
select * from teacher_subject_bcnf;
select * from student_teacher_bcnf;

-- join to see full view
select s.student_id, s.teacher, t.subject
from student_teacher_bcnf s
join teacher_subject_bcnf t on s.teacher = t.teacher;

-- ===================================================================
-- 4NF - Fourth Normal Form
-- ===================================================================
-- Rules:
--   1. Must already be in BCNF
--   2. No multi-valued dependencies
--      (a row should not store two or more independent multi-valued facts
--       about an entity in the same table)

-- VIOLATION of 4NF:
-- A person can have multiple hobbies AND multiple phone numbers (independent facts)
-- Storing both together causes redundancy (multi-valued dependency)
create table if not exists person_not_4nf (
    person_id int,
    hobby     varchar(50),
    phone     varchar(20),
    primary key (person_id, hobby, phone)
);

insert into person_not_4nf values
(1, 'Reading',  '9876543210'),
(1, 'Reading',  '9123456789'),
(1, 'Swimming', '9876543210'),
(1, 'Swimming', '9123456789'),
(2, 'Coding',   '9000000001');

-- see the violation (notice the repeated combinations)
select * from person_not_4nf;

-- SOLUTION: separate the two independent multi-valued facts into their own tables
create table if not exists person_hobby_4nf (
    person_id int,
    hobby     varchar(50),
    primary key (person_id, hobby)
);

create table if not exists person_phone_4nf (
    person_id int,
    phone     varchar(20),
    primary key (person_id, phone)
);

insert into person_hobby_4nf values
(1, 'Reading'),
(1, 'Swimming'),
(2, 'Coding');

insert into person_phone_4nf values
(1, '9876543210'),
(1, '9123456789'),
(2, '9000000001');

-- see the 4NF compliant tables
select * from person_hobby_4nf;
select * from person_phone_4nf;

-- ===================================================================
-- 5NF - Fifth Normal Form (Project-Join Normal Form)
-- ===================================================================
-- Rules:
--   1. Must already be in 4NF
--   2. No join dependency
--      (a table cannot be reconstructed from smaller tables
--       unless all those smaller tables share a common key)
--   It handles cases where a table can be decomposed into 3 or more
--   tables but NOT into 2 tables without losing information

-- EXAMPLE: Supplier can supply Parts, and a Project uses certain Parts,
-- but a Supplier supplies to a Project only when they supply that Part
-- This 3-way relationship must stay in one table (5NF)
create table if not exists supplier_project_part_5nf (
    supplier_id  int,
    project_id   int,
    part_id      int,
    primary key (supplier_id, project_id, part_id)
);

insert into supplier_project_part_5nf values
(1, 10, 100),
(1, 10, 200),
(1, 20, 100),
(2, 10, 100),
(2, 20, 200);

-- see the 5NF table
select * from supplier_project_part_5nf;

-- attempt to split into 2-way joins (this LOSES information - violates 5NF)
-- so we keep the 3-way combination intact in this table

-- verify by projecting combinations
select distinct supplier_id, project_id from supplier_project_part_5nf;
select distinct supplier_id, part_id    from supplier_project_part_5nf;
select distinct project_id,  part_id    from supplier_project_part_5nf;

-- ===================================================================
-- 6NF - Sixth Normal Form
-- ===================================================================
-- Rules:
--   1. Must already be in 5NF
--   2. A relation is in 6NF if it has no non-trivial join dependencies AT ALL
--      Each table contains exactly the primary key + ONE non-key attribute
--   6NF is mainly used in temporal databases (handling time-varying data)

-- EXAMPLE: Tracking employee attributes over time (temporal data)
-- Instead of one wide row, each attribute gets its own table with a time range

create table if not exists emp_name_6nf (
    employee_id int,
    valid_from  date,
    valid_to    date,
    emp_name    varchar(50),
    primary key (employee_id, valid_from)
);

create table if not exists emp_salary_6nf (
    employee_id int,
    valid_from  date,
    valid_to    date,
    salary      decimal(10,2),
    primary key (employee_id, valid_from)
);

create table if not exists emp_department_6nf (
    employee_id int,
    valid_from  date,
    valid_to    date,
    department  varchar(50),
    primary key (employee_id, valid_from)
);

insert into emp_name_6nf values
(1, '2020-01-01', '2022-12-31', 'Alice'),
(1, '2023-01-01', '9999-12-31', 'Alice Johnson'),
(2, '2021-06-01', '9999-12-31', 'Bob');

insert into emp_salary_6nf values
(1, '2020-01-01', '2021-12-31', 50000.00),
(1, '2022-01-01', '9999-12-31', 65000.00),
(2, '2021-06-01', '9999-12-31', 55000.00);

insert into emp_department_6nf values
(1, '2020-01-01', '2021-12-31', 'IT'),
(1, '2022-01-01', '9999-12-31', 'Data Engineering'),
(2, '2021-06-01', '9999-12-31', 'HR');

-- see the 6NF tables
select * from emp_name_6nf;
select * from emp_salary_6nf;
select * from emp_department_6nf;

-- join to get the current state of all employees (valid_to = '9999-12-31')
select
    n.employee_id,
    n.emp_name,
    s.salary,
    d.department
from emp_name_6nf n
join emp_salary_6nf     s on n.employee_id = s.employee_id and s.valid_to = '9999-12-31'
join emp_department_6nf d on n.employee_id = d.employee_id and d.valid_to = '9999-12-31'
where n.valid_to = '9999-12-31';

-- ===================================================================
-- SUMMARY: Quick comparison of all Normal Forms
-- ===================================================================
-- 1NF  : Atomic values, no repeating groups, unique rows
-- 2NF  : 1NF + No partial dependency on composite key
-- 3NF  : 2NF + No transitive dependency (non-key -> non-key)
-- BCNF : 3NF + Every determinant must be a super key
-- 4NF  : BCNF + No multi-valued dependencies
-- 5NF  : 4NF + No join dependencies (lossless decomposition)
-- 6NF  : 5NF + No non-trivial join dependencies (temporal databases)
-- ===================================================================
