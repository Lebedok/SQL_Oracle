select * from employees;

select min_salary , max_salary from jobs;

--This is single line comment
/*
This is multiple line comment in sql
*/
select *from employees
where department_id=50;

-- 

select department_name from departments
where department_id=50;

select department_name from departments
where department_id=30;

select department_name from departments
where department_id=10 or department_id=30 or department_id=50;

select department_id from departments;

select department_name from departments
where department_id=10 or department_id=20 or department_id=30 or department_id=40 or department_id=50;

select department_name from departments
where department_id in (10,30,50,70,100);

select department_name from departments
where department_id between 10 and 100;

select * from employees
where department_id=50 and job_id='ST_MAN';

select * from employees
where department_id=50 or job_id='ST_MAN';

select * from employees
where department_id=60 or job_id='ST_CLERK';

/*
Print all the employees who has department id is 70 or selery more than 5000
*/

select *from employees
where department_id=70 or salary > 5000 and  employee_id>180;

select *from employees
where department_id=70 and  salary > 5000;

/*
write query to find the employees who is not displayed after preious query
*/

select * from employees
where department_id!=70 or salary < 5000 and employee_id >180;


select * from employees
where department_id!=70 and salary > 5000 and employee_id>180;

select * from employees
WHERE department_id is null;

select * from employees
where department_id is not null;

select * from employees
where not department_id=70;

-- print all the employees whom salary is between 60000 to 100000 and hire date is after June 7, 1997

select * from employees
where salary between 6000 and 100000 and hire_date>'07-JUN-97';


--concatination
select first_name ||  ' ' || last_name as fullname from employees;


--print all lastnames and add them to tem @gmail.com to generate gmail for everyone 
select last_name || '@gmail.com'  as gmailaccount FROM employees;

-- print data by ascending and descending order 

select * from employees
order by first_name DESC;

select * from employees
order by first_name ASC;

-- print all the employees who is earning more than 5000 and order the result by the hire date descending order 
select * from employees
WHERE salary > 5000 
order by hire_date desc , first_name asc; 

select first_name , commission_pct from employees
order by commission_pct asc, first_name desc;


-- Starts with capital 'A' 
select * from employees
where first_name like 'A%'
order by first_name;

-- ends with a
select * from employees
where first_name like '%a'
order by first_name;

-- find data which contains tt 
select * from employees
where first_name like '%tt%'
order by first_name;

select * from employees
where first_name like '%t_p%'
order by first_name;


-- list all empl who startted working in FEB, MAR ,APR 
select * from employees
where hire_date like '%FEB%' or hire_date like'%MAR%' or hire_date like'%APR%'
order by hire_date;


-- list all employees whose last name contains two lower case a; 
select * from employees 
where last_name like '%a%a%';

select first_name from employees
where employee_id=154;

select * from employees
where commission_pct is not null
order by commission_pct asc;


-- print all the first names who has third and forth letter is ll. Like Sally 

select * from employees 
where first_name like '__ll%';


-------------------SINGLE EROW FUNCTIONS---------------------
--UPPER, LOWER , INITCAP

select UPPER(last_name) from employees;
select last_name from employees;

select lower(first_name) from employees;

select initcap (lower(email)) from employees;

select initcap(email)from employees;  

select upper(department_id) from employees;


----CONCAT------
select concat('Techtorial - ' , first_name) as TECHTORIAL from employees;
select 'Techtorial - ' || first_name as Techtorial from employees;  -- same as concat

---- LENGTH---
select length(region_name) from regions;
select length (region_id)from regions;

----SUBSTR--- in SQL substring will count from 1 NOT 0. 
select substr(first_name,3,2) as substring from employees --3 starting char , 1 how many char after 3 you want see
order by substring;

---------instr-------
select city from locations;
select instr(city,'a') from locations;

select length(city)from locations
where instr (city , 'a')>0;


--  return first name and last name combined as lower case with the space 
--- and find the index number of 'ka'  from combined firstname and lastname 
select instr(lower(first_name ||' '|| last_name ),'ka') as full_name from employees
where instr(lower(first_name ||' '|| last_name ),'ka')>0 ;

----ROUND-----
select * from employees
where commission_pct is not null;


select round(commission_pct,1)from employees
where commission_pct is not null;

select round(3.1265,2)from employees; --- result: 3.13 

select round(3.1265)from employees;   ---- result: 3


---------TRUNC-----------
select trunc(3.1254,2) from employees;  --- 3.12
select trunc(3.1254) from employees; -------3 

----------MOD --------- it gives remainder
select mod(salary,2)from employees;

select mod (5,2) from locations;
select mod(13,3) from regions;


-- print all employee name is odd number 

SELECT first_name, employee_id FROM employees 
WHERE mod(employee_id,2) = 1;

-----------REPLACE-------------
select replace(first_name,'e','TT') from employees;

-- replace all the 'a' with "***" from last name if the last name lenght is even number and print last name  
select  replace( last_name,'a','***') from employees
where mod(length(last_name),2)=0;

--- MULTIPLE ROW FUNCTIONS------
--AVG, COUNT, MAX, MIN , SUM

select round(avg(salary),2)from employees;

select count(*)from employees;

select count(location_id)from locations;

-- print count of employees if the employee name has more than 4 character 
select count (*) from employees
where length (first_name)>7;

--MAX and MIN 
select first_name, salary from employees
order by salary;

select max(salary) from employees;

------ MAX salary---------
select first_name from employees
where salary=(select max(salary)from employees);

---------second MAX salary---------
select first_name from employees
where salary=(select max(salary)from employees where salary!=(select max(salary)from employees));


select max(first_name) from employees; -- it will give last first_name sorted by alphabetical order 
SELECT max (hire_date) from employees; -- it will give latest date. In this example last person who is hired 

-- print last name of the employee who is hired last to the company 
select last_name from employees
where hire_date=(select max(hire_date) from employees);


-----MIN----
select min(salary)from employees;
SELECT min(hire_date) from employees;


-- print job id  of the employee who is hired first 
select job_id from employees
where hire_date=(select min(hire_date) from employees);

---- SUM----
select sum(salary)from employees;



