-- !preview conn=con

-- descending order
SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

SELECT employee_id, first_name, last_name, email
FROM employees
ORDER BY first_name, last_name DESC;

SELECT employee_id, first_name, last_name, email
FROM employees
ORDER BY first_name DESC;

-- sort by column position (in SELECT list)
SELECT employee_id, first_name, last_name, email
FROM employees
ORDER BY 2, 3;

-- sort by multiple column
SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date;

SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary;

SELECT employee_id, first_name, last_name, email
FROM employees
ORDER BY first_name, last_name;

-- sorted by single column
SELECT employee_id, first_name, last_name, email
FROM employees
ORDER BY first_name;

-- data not sorted
SELECT employee_id, first_name, last_name, email
FROM employees;

