-- !preview conn=con

--SELECT * FROM employees LIMIT 10;

-- limit results
SELECT first_name
FROM employees
LIMIT 5 OFFSET 5;

SELECT first_name
FROM employees
LIMIT 5;

-- distinct values
SELECT DISTINCT department_id, salary
FROM employees
ORDER BY department_id, salary;

SELECT DISTINCT department_id, salary  
FROM employees;

SELECT DISTINCT salary
FROM employees;

-- retrieve all columns
SELECT *
FROM employees;

-- retrieve multiple columns
SELECT first_name, last_name, email
FROM employees;

-- retrieve single column
SELECT first_name
FROM employees;