-- -------------------------------------------------------------------------------------------------
-- --------------- Creating database----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS employeee;

-- -------------------Creating a Table -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS employees(
	EMPLOYEE_ID VARCHAR(30) NOT NULL PRIMARY KEY,
    FIRST_NAME VARCHAR(20) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    PHONE_NUMBER INT NOT NULL,
    HIRE_DATE INT NOT NULL,
    JOB_ID INT NOT NULL,
    SALARY INT NOT NULL,
    COMMISSION_PCT INT NOT NULL,
    MANAGER_ID INT NOT NULL,
    DEPARTMENT_ID INT NOT NULL
    )

-- Extraced the data

-- ---------------------------------------------------------------------------------------------------
-- what is the First name of all the employees??-------------
SELECT FIRST_NAME FROM employeee.employees;


-- How to create a Column in table?-----------------
ALTER TABLE employees
ADD COLUMN AGE_GROUP VARCHAR(20) NOT NULL;


-- How can we delete or drop the column in a table??-----------
ALTER TABLE employees
DROP COLUMN AGE_GROUP;

SELECT * FROM employeee.employees;


-- Employee details whose first name starts with letter "A"?------------
SELECT * FROM employees
WHERE FIRST_NAME LIKE "A%";


-- Employee details whose last name starts with letter "M" and also first name contains "an" in the name??-----------
SELECT * FROM employees
WHERE FIRST_NAME LIKE "%an%" AND LAST_NAME LIKE "M%";


-- Employee details whose name email ends with a letter "N"?------------------
SELECT * FROM employees
where EMAIL LIKE "%N";

-- Employees who has hired after 11-02-06??-----------------------
SELECT FIRST_NAME, LAST_NAME FROM employees
WHERE HIRE_DATE > 11-02-06;


-- How many employees got hired afte 11-02-06??---------------
SELECT COUNT(*) FROM employees
WHERE HIRE_DATE > 11-02-06;


-- Employee details who has high salary??----------------------
SELECT * FROM employees
ORDER BY SALARY DESC
LIMIT 5;


-- Details of employees who has low salary??-------------------
SELECT * FROM employees
ORDER BY SALARY 
LIMIT 5;


-- Employees whose salart between 5000 and 10000 in decreasing order??-------------------
SELECT * FROM employees
WHERE SALARY BETWEEN 5000 AND 10000
ORDER BY SALARY DESC;


-- How many employees has salary between 5000 and 10000??-------------------
SELECT COUNT(*) FROM employees
WHERE SALARY BETWEEN 5000 AND 10000
ORDER BY SALARY DESC;


-- Employees whose manager id is equal to 114??--------------------------
SELECT * FROM employees
where MANAGER_ID = 114;


-- Employees whose manager id equal to 100 and first name starts with letter "M"?------------------------------
SELECT * FROM employees
where MANAGER_ID = 100 AND FIRST_NAME LIKE "M%";


-- Employees whose employee id between 120 and 180??--------------------------------
SELECT * FROM employees
WHERE EMPLOYEE_ID BETWEEN 120 AND 180;


-- How many employees are present whose employee id between 120 and 180??-------------------------
SELECT COUNT(*) FROM employees
WHERE EMPLOYEE_ID BETWEEN 120 AND 180;


-- Name the distinct job id's of employees??---------------------------
SELECT DISTINCT JOB_ID FROM employees;

-- Add a column
ALTER TABLE employees
ADD COLUMN SALARY_GRP VARCHAR(20) NOT NULL;

-- Adding values to the added column
-- Differentiating the salary as low, medium and hugh.--------------------------------------
UPDATE employees
SET SALARY_GRP = (CASE
WHEN SALARY < 5000 THEN "Low"
WHEN SALARY BETWEEN 5001 AND 10000 THEN "Medium"
ELSE "High"
END);

SELECT * FROM employees;


-- Employee details whose department id eqals to 50 and last name equal to 'Grant'??-------------------
SELECT * FROM employees
WHERE DEPARTMENT_ID = 50 AND LAST_NAME = 'Grant';

-- How many diff department ID's are in the data??---------------------------------------------------
SELECT COUNT( DISTINCT (DEPARTMENT_ID)) AS Dist_depts FROM employees;
 
 
 -- Details of the employees whose salary in the 8000, 7900, 3200, 13000??---------------------------
SELECT * FROM employees
WHERE SALARY IN ( 8000, 7900, 3200, 13000);

-- Deleting the column --------------------------------
ALTER TABLE employees
DROP COMMISSION_PCT;

SELECT * FROM employees;


