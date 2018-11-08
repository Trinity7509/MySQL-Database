

SELECT first_name,last_name FROM employees WHERE
first_name LIKE'Sa%';

SELECT * FROM employees;

SELECT first_name,last_name FROM employees WHERE
last_name REGEXP'ei';

SELECT first_name FROM employees WHERE 
department_id IN (3,10) AND YEAR(hire_date) BETWEEN 1995 AND 2005;

SELECT first_name,last_name FROM employees WHERE
job_title NOT LIKE'%engineer%';

SELECT name FROM towns WHERE 
CHAR_LENGTH(name)=6 OR CHAR_LENGTH(name)=5
ORDER BY name;

SELECT town_id,name FROM towns WHERE
name LIKE'M%' OR name LIKE'B%'OR name LIKE'E%'OR name LIKE'K%'
ORDER BY name;

SELECT t.town_id,t.name FROM towns t
WHERE lower(left(t.name,1)) NOT IN('r','b','d')
ORDER BY name;















