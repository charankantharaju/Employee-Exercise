create table employee(
emp_id SERIAL PRIMARY KEY,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
dept VARCHAR(100),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

select*from employee

INSERT INTO employee (emp_id, fname, lname, email, dept, salary, hire_date)
VALUES(10,'Vijay','Nair','vijay.nair@gmail.com','Marketing',50000.00,'2020-04-13');


select * from employee
where dept = 'HR' or dept = 'Finance';

select * from employee
where dept = 'IT' and salary <= 50000;


select * from employee
where salary != 60000;

select * from employee
where dept in ('IT','Finance', 'HR');

select * from employee
where dept not in ('IT','Finance', 'HR');

-- find employee whose salary is more than 40k and less than 65k
select * from employee
where
salary between 50000 and 60000;

-- distinct
select distinct dept from employee;

-- order by
select * from employee order by emp_id desc ;

-- limit
select * from employee limit 3;

-- starts with 'A' 
select * from employee where fname like 'P%'

-- Ends with 'a' 
select * from employee where fname like '%a'

-- Contains "I"
select * from employee where fname like '%i%'

-- second character A 
select * from employee where fname like '_a%'

-- This query retrieves all rows from the employee table where the fname (first name) column matches exactly five characters.

select * from employee where fname like '_____';

-- second character A & last character L
select * from employee where fname like '_a__l%';

-- how to find total number of employees
select count(emp_id) from employee; 

-- sum of all the salaries 
select sum(salary) from employee;  

-- average 
select avg(salary) from employee;

--minimum
select min(salary) from employee;

--maximum
select max(salary) from employee;

-- group by
select dept from employee
 group by dept;

-- this will show us how many people are working in each group
select dept,count(emp_id) from employee
 group by dept;

-- this will show us the salary given by each department
select dept,sum(salary),count(emp_id) from employee
 group by dept;


-- TASKS 
-- Find all employees who work in the Marketing department and have a salary greater than 45,000.
select * from employee 
where dept = 'Marketing' and salary > 45000

--Retrieve employees whose last name ends with "r".
select * from employee
where lname like'%r'

-- Show all employees who were hired before 2019-01-01.
select * from employee
where hire_date < '2019-01-01';

--List employees whose salaries are between 40,000 and 70,000, but not equal to 50,000
select * from employee 
where salary between 40000 and 70000
and salary <> 50000;

-- Average salary per department
select dept,avg(salary) from employee 
group by dept;

-- top 2 highest-paid employees
select* from employee
order by salary desc
limit 2;

--Count employees in Finance
select count(emp_id) from employee
where dept = 'Finance'


-- First name has 6 characters and starts with A
select * from employee 
where fname like 'A____';


-- Duplicate email IDs (if any)

select email, count (*)
from employee
group by email
having count(*)>1

select fname, count (*)
from employee
group by fname
having count(*)>1

-- Concat
select emp_id, concat (fname, ' ',lname)as full_name, dept from employee
-- Concat with seperator
select emp_id, concat_ws ('-',fname,lname,salary)as full_name, dept from employee


-- Substring 
select * from employee 

select replace(dept,'IT','TECH')from employee;

-- Reverse 
select reverse (fname) from employee;


-- Length
select length('charan');
select length (fname) from employee;

-- find the alphabet's greater than 5 
select * from employee 
where length (fname)>5;

-- find the email id greater than 25 characters 
select * from employee 
where length (email)>25;

-- upper & lower
select upper(fname) from employee
select lower(fname) from employee

-- left , right
select left ('hello world',2); -- he
select right ('hello world',5);-- world

--  Trim & position 
select length ('    alrigth    ')
select length(trim ('    alrigth    '));

select position ('ra' in 'charan')
select position('om' in 'thomas')

-- Extract the first three characters from fname in the employee table.
select substring (fname,1, 3) from employee

-- Replace all occurrences of "Manager" with "Lead" in job_title:
select replace (dept, 'Finance', 'Finance-dept')from employee
select * from employee

-- Display lname in reverse order:
select reverse (lname) from employee 

-- List employees whose dept name has exactly 4 characters:
select * from employee 
where length (dept)= 4;

-- Retrieve employees where fname is shorter than 4 characters:
select * from employee 
where length (fname)< 4;

--Find employees whose email is not 10 alphabets:
select * from employee 
where length (email)<> 10;

-- List all email addresses in uppercase:
select upper (email)from employee ;

--Show fname in lowercase where length > 7:
select lower(fname) from employee where length (fname) >7;

--Show the last two characters of dept:
select right (dept, 2) from employee ;

--Use LEFT to extract the first letter of last names and group by this initial:
select left (lname,1) from employee;

-- Show position of '@' in emails:
select position ('@' in email) from employee

-- Display records where fname contains 'an':
select * from employee
where position ('an' in fname) > 0 ;

--Find employees whose email contains their fname:
select * from employee 
where position (fname in email )>0;

-- Concatenate fname and lname with a hyphen:
select concat (fname,'-', lname)as fullname_hypen from employee

select concat_ws ('-',fname, lname)from employee  

-- 1:Raj:Sharma:IT
select concat_ws (':',emp_id,fname, lname, dept)from employee

-- 1:RajSharma:IT
select concat_ws(':',emp_id, concat_ws(' ', fname, lname), dept,salary)from employee 

-- 4:suman:FINANCE
select concat_ws(':',emp_id, fname, upper(dept)) from employee
where emp_id = 4;

-- I1 Raju H2 Priya
select concat(left(dept,1) , emp_id),fname from employee

-- find different types of department in database
select distinct dept from employee;

--display records with high-low salary
select*from employee 
order by salary desc;

-- how to see top 3 records from a table
select * from employee
limit 3;

-- show records where first name starts with "A";
select * from employee 
where fname like 'A%';

-- show records where length of the lname is 4 character
select * from employee 
where length(lname) = 4;

--find total no. of employees in database 
select count(*) from employee

-- find no.of employees in each department 
select count(*) from employee 
group by dept ;

--find lowest salary paying 
select * from employee 
where salary =(select min(salary)from employee );

--find highest salary paying 
select * from employee 
where salary = (select max (salary) from employee);

-- find total salary paying in IT dept
select  sum(salary) from employee
where dept = 'IT';

-- avg salary paying in each dept 
select avg(salary) from employee
group by dept;


-- adding extra column 
alter table employee 
add column age int default 18 ;
select * from employee


alter table employee 
drop column age;
select * from employee

-- How to rename a column or table name ?
alter table employee 
rename fname to full_name
select * from employee;

alter table employee
rename lname to last_name

alter table employee
rename dept to department
