-- Create Table

CREATE TABLE person(
cus_id INT,
cus_name varchar(100),
city varchar(100)
)

-- Insert Data on the Table

INSERT INTO person(cus_id, cus_name, city)
VALUES
(101, 'Ali', 'Mumbai'),
(102, 'Rup', 'Kolkata'),
(103, 'Sumon', 'Bhihar'),
(104, 'Ricky', 'Noida');


-- Reading Data

select * from person;


-- Updating the data on the Table

update person
set city = 'London'
where cus_id = 100


-- Delete Data from a Table

delete from person
where cus_id = 100



-------------------------------------------------Section_3---------------------------------------------------------------------------

.Data Type
.Constraint  - Primary Key, NOT NULL, Default, Serial, Unique


create table employees(
epm_id serial primary key,
fname varchar(100),
lname varchar(100),
email_id varchar(100) unique,
dept varchar(100),
salary decimal(10,2) default 30000.00,
hire_date date not null default current_date
);



-- 👥 Insert sample employee records

INSERT INTO employees (fname, lname, email_id, dept, salary, hire_date) VALUES
('John',    'Doe',      'john.doe@example.com',     'IT',        45000.00, '2022-06-01'),
('Jane',    'Smith',    'jane.smith@example.com',   'HR',        38000.00, '2021-09-15'),
('Ahmed',   'Ali',      'ahmed.ali@example.com',    'Finance',   50000.00, '2023-01-10'),
('Priya',   'Sharma',   'priya.sharma@example.com', 'Marketing', 42000.00, '2022-12-20'),
('David',   'Lee',      'david.lee@example.com',    'IT',        47000.00, '2021-07-30'),
('Sara',    'Khan',     'sara.khan@example.com',    'HR',        39000.00, '2023-03-05');


select * from employees

insert into employees(fname, lname, email_id, dept)
values
('Mohammad', 'Ali', 'mohammadalisk01@gmail.com', 'IT')




-------------------------------------------------------Section_4------------------------------------------------------------------------
-- Data Refining
.Clauses
    .Where
	.Distinct
	.Order By
	.Limit
	.Like

select * from employees
where salary >= 40000




select * from employees
where dept = 'IT' or dept = 'Finance'


-- IN Operator
select * from employees where dept in('IT','Finance');


-- Between

select * from employees where salary between 30000 and 50000;


 -- Distinct

 select distinct dept from employees


 -- Order By
 
 select * from employees order by salary desc;

-- Limit

select * from employees order by salary desc limit 3;



-- Like

select * from employees where fname like 'R%';




------------------------------------------------------ Section_5----------------------------------------------------------------------
-- Aggregate Function

   .Count
   .Sum
   .Avg
   .Min
   .Max



-- Count

select * from employees

-- Sum

select sum(salary) as total_salary from employees;



-- AVG

select round(avg(salary),2) from employees;



-- Min

select round(min(salary),2) from employees;


-- Max

select round(max(salary),2) from employees;


-------------------------------------------------Group By ---------------------------------------------------------------------------

select dept , count(*) from employees group by dept;




-------------------------------------------------Section_6----------------------------------------------------------------------------

-- String Function


-- Concat

select concat(fname, ' ', lname) as full_name from employees;



-- Substring

select substring('Hey Buddy', 1, 4);


-- Replace

select replace('Hey Buddy','Hey','Hello');



select replace(dept,'IT', 'Tech') from employees;

select * from employees;



-- Use Update

UPDATE employees
SET dept = REPLACE(dept, 'IT', 'Tech');



-- Upper & Lower

select upper(fname) from employees;

select lower(fname) from employees;



-- Trim  
select trim('   Mohammad   ');

select length('Mohammad');


-- Position Function

select position('on' in 'onothing');





-- ----------------------------------------------Practice Exercises------------------------------------------------------------------
select * from employees;
select concat_ws(':',epm_id, fname, lname, dept, round(salary)) from employees
where epm_id = 1;


select concat_ws(':', epm_id, concat(fname, ' ', lname), dept, round(salary)) from employees
where epm_id = 1

---------------------------------------------------Practice-------------------------------------------------------------------

select distinct dept from employees;

2.
select * from employees order by salary desc;

3. 

select * from employees limit 3;

4.

select * from employees where fname like('A%');

5.

select * from employees where length(lname) = 4;



----------------------------------------------------Exercise_2-------------------------------------------------------------------

1.

select count(*) from employees;

2.

select dept,count(*) from employees group by dept;

3.

select min(salary) from employees;

4.

select max(salary) from employees;


5.

select sum(salary) from employees where dept = 'Tech';

select * from employees;


6.

select dept, round(avg(salary)) as avg_salary from employees group by dept order by avg_salary desc;




-------------------------------------------------Section_7--------------------------------------------------------------------

-- ALTER Query

select * from person

-- Add column

ALTER TABLE person
add column age int default 28;


-- Drop Column

Alter table person
drop column age;

-- Rename Column

ALTER TABLE person
rename column cus_name to name;



-- Change to Table name 

ALTER TABLE person
RENAME TO
persons;

SELECT * FROM persons;


----------------------------------------------Constraint Check-------------------------------------------------------------------

select * from persons;

select * from employees



---------------------------------------------Case Study--------------------------------------------------------------------------

ALTER TABLE employees
ADD COLUMN bonus NUMERIC(10,2);

UPDATE employees
SET bonus = CASE
    WHEN salary > 0 THEN ROUND(salary * 0.10, 2)
    ELSE 0.00
END;

select * from employees


alter table employees
drop column bonus;


alter table employees
add column bonus numeric(10,2);

update employees
set bonus = case
            when salary > 0 then round(salary*.10)
			else 00
end;

select * from employees;


alter table employees
add column emp_type varchar(100);

update employees
set emp_type = case
               when salary >= 50000 then 'High'
			   when salary between 40000 and 50000 then 'Mid'
			   else 'Low'
end;

select * from employees;


select emp_type, count(emp_type) from employees
group by emp_type;


-- Another way to solve this problem
select 
case
when salary >= 50000 then 'High'
when salary between 40000 and 50000 then 'Mid'
else 'Low'
end as sal_cat,count(*)
from employees
group by sal_cat;



---------------------------------------------------------Section__8--------------------------------------------------------------

-- Upderstan Relationship

select * from details;
select * from employees;



----------------------------------------------------------Practice---------------------------------------------------------------
-- Create table
CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Add data on the table

INSERT INTO customers (cust_id, name, email) VALUES
(1, 'Alice Johnson', 'alice1@example.com'),
(2, 'Bob Smith', 'bob2@example.com'),
(3, 'Charlie Brown', 'charlie3@example.com'),
(4, 'David Lee', 'david4@example.com'),
(5, 'Eva Adams', 'eva5@example.com'),
(6, 'Frank Miller', 'frank6@example.com'),
(7, 'Grace Thomas', 'grace7@example.com'),
(8, 'Hannah Lewis', 'hannah8@example.com'),
(9, 'Ian Scott', 'ian9@example.com'),
(10, 'Julia Harris', 'julia10@example.com'),
(11, 'Kevin Clark', 'kevin11@example.com'),
(12, 'Laura Young', 'laura12@example.com'),
(13, 'Michael Allen', 'michael13@example.com'),
(14, 'Nina Walker', 'nina14@example.com'),
(15, 'Oscar Hall', 'oscar15@example.com'),
(16, 'Paula Wright', 'paula16@example.com'),
(17, 'Quinn Baker', 'quinn17@example.com'),
(18, 'Rachel King', 'rachel18@example.com'),
(19, 'Sam Green', 'sam19@example.com'),
(20, 'Tina Nelson', 'tina20@example.com'),
(21, 'Umar Perez', 'umar21@example.com'),
(22, 'Vera Cox', 'vera22@example.com'),
(23, 'Will Reed', 'will23@example.com'),
(24, 'Xena Kelly', 'xena24@example.com'),
(25, 'Yusuf Brooks', 'yusuf25@example.com'),
(26, 'Zara Ward', 'zara26@example.com'),
(27, 'Adam Barnes', 'adam27@example.com'),
(28, 'Bella Ross', 'bella28@example.com'),
(29, 'Carline Price', 'carline29@example.com'),
(30, 'Derek Bell', 'derek30@example.com'),
(31, 'Ella James', 'ella31@example.com'),
(32, 'Felix Russell', 'felix32@example.com'),
(33, 'Gina Griffin', 'gina33@example.com'),
(34, 'Harry Wood', 'harry34@example.com'),
(35, 'Irene Patterson', 'irene35@example.com'),
(36, 'Jack Cooper', 'jack36@example.com'),
(37, 'Kim Foster', 'kim37@example.com'),
(38, 'Leo Morgan', 'leo38@example.com'),
(39, 'Mia Rivera', 'mia39@example.com'),
(40, 'Nate Torres', 'nate40@example.com'),
(41, 'Olivia Jenkins', 'olivia41@example.com'),
(42, 'Peter Stone', 'peter42@example.com'),
(43, 'Queenie Sims', 'queenie43@example.com'),
(44, 'Ray Hunt', 'ray44@example.com'),
(45, 'Sophie Mills', 'sophie45@example.com'),
(46, 'Tommy Spencer', 'tommy46@example.com'),
(47, 'Uma Doyle', 'uma47@example.com'),
(48, 'Victor Chapman', 'victor48@example.com'),
(49, 'Wendy Lowe', 'wendy49@example.com'),
(50, 'Xavier Walters', 'xavier50@example.com');


-- Create Orders Table-----------------------------

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    amount NUMERIC(10, 2),
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);


-- Add data on Orders Table----------------------------

INSERT INTO orders (order_id, date, amount, cust_id) VALUES
(1, '2024-01-01', 250.00, 1),
(2, '2024-01-02', 150.50, 2),
(3, '2024-01-03', 300.00, 3),
(4, '2024-01-04', 450.75, 4),
(5, '2024-01-05', 120.00, 5),
(6, '2024-01-06', 99.99, 6),
(7, '2024-01-07', 520.30, 7),
(8, '2024-01-08', 175.45, 8),
(9, '2024-01-09', 399.00, 9),
(10, '2024-01-10', 600.10, 10),
(11, '2024-01-11', 320.00, 11),
(12, '2024-01-12', 89.90, 12),
(13, '2024-01-13', 730.75, 13),
(14, '2024-01-14', 210.00, 14),
(15, '2024-01-15', 154.40, 15),
(16, '2024-01-16', 475.90, 16),
(17, '2024-01-17', 199.99, 17),
(18, '2024-01-18', 349.50, 18),
(19, '2024-01-19', 289.30, 19),
(20, '2024-01-20', 420.00, 20),
(21, '2024-01-21', 150.00, 21),
(22, '2024-01-22', 305.25, 22),
(23, '2024-01-23', 398.40, 23),
(24, '2024-01-24', 580.00, 24),
(25, '2024-01-25', 310.50, 25),
(26, '2024-01-26', 295.75, 26),
(27, '2024-01-27', 430.60, 27),
(28, '2024-01-28', 210.00, 28),
(29, '2024-01-29', 199.99, 29),
(30, '2024-01-30', 600.00, 30),
(31, '2024-01-31', 340.00, 31),
(32, '2024-02-01', 275.50, 32),
(33, '2024-02-02', 220.00, 33),
(34, '2024-02-03', 99.99, 34),
(35, '2024-02-04', 185.75, 35),
(36, '2024-02-05', 309.90, 36),
(37, '2024-02-06', 445.25, 37),
(38, '2024-02-07', 580.00, 38),
(39, '2024-02-08', 230.60, 39),
(40, '2024-02-09', 310.10, 40),
(41, '2024-02-10', 189.90, 41),
(42, '2024-02-11', 505.00, 42),
(43, '2024-02-12', 425.75, 43),
(44, '2024-02-13', 290.80, 44),
(45, '2024-02-14', 340.00, 45),
(46, '2024-02-15', 245.90, 46),
(47, '2024-02-16', 399.99, 47),
(48, '2024-02-17', 499.50, 48),
(49, '2024-02-18', 620.00, 49),
(50, '2024-02-19', 205.20, 50);


update orders
set order_id = order_id + 1000

select * from customers

select * from orders



--------------------------------------------------JOIN----------------------------------------------------------------------------

-- Typyes of Join

.Cross join
.Inner Join
.Left Join
.Right Join































































