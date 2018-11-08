
USE soft_uni;

SELECT first_name,last_name FROM employees
WHERE first_name LIKE 'Sa%';

SELECT first_name,last_name FROM employees
WHERE last_name REGEXP 'ei';


SELECT first_name FROM employees
WHERE department_id IN(3,10)
AND YEAR(hire_date) BETWEEN 1995 AND 2005;


SELECT first_name,last_name FROM employees
WHERE NOT job_title REGEXP 'engineer';

SELECT name FROM towns
WHERE CHAR_LENGTH(`name`)=5 OR CHAR_LENGTH(`name`)=6 
ORDER BY name ASC;

SELECT town_id,name FROM towns
WHERE LEFT(name,1) IN('M','K','B','E')
ORDER BY name ASC;


SELECT *FROM towns
WHERE NOT LEFT(name,1) IN ('R','B','D')
ORDER BY name ASC;

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT first_name,last_name FROM employees
WHERE YEAR(hire_date)>2000; 

SELECT first_name,last_name FROM employees
WHERE CHAR_LENGTH(`last_name`)=5;

USE geography;

SELECT country_name,iso_code FROM countries 
WHERE CHAR_LENGTH(lower(country_name))-CHAR_LENGTH((REPLACE(lower(country_name),'a','')))>=3 
ORDER BY  iso_code;
USE geography;

SELECT peak_name,river_name,LOWER(CONCAT(peak_name,substring(river_name,2))) AS `mix` 
FROM peaks,rivers
WHERE RIGHT(peak_name,1)=LEFT(river_name,1)
ORDER BY mix ;

USE diablo;

SELECT name,DATE_FORMAT(`start`, '%Y-%m-%d') AS 'start' FROM games
WHERE YEAR(start) IN(2011,2012)
ORDER BY start ,
name  LIMIT 50;


SELECT user_name,substring(email,position('@'IN email)+1) AS `Email Provider`
FROM users
ORDER BY `Email Provider`,
user_name;


SELECT user_name,ip_address FROM users
WHERE ip_address LIKE '___.1_%._%.___'
ORDER BY user_name ;

SELECT `name` AS 'game',
(CASE 
WHEN EXTRACT(HOUR FROM start)>=0 AND EXTRACT(HOUR FROM start)<12 
THEN 'Morning'
WHEN EXTRACT(HOUR FROM start)>=12 AND EXTRACT(HOUR FROM start)<18
THEN 'Afternoon'
WHEN EXTRACT(HOUR FROM start)>=18 AND EXTRACT(HOUR FROM start)<24
THEN 'Evening'
END) 
AS 'Part of the Day',
(CASE
WHEN duration<=3 THEN 'Extra Short'
WHEN duration>3 AND duration<=6 THEN 'Short'
WHEN duration>6 AND duration<=10 THEN 'Long'
ELSE 'Extra Long'
END) Duration
FROM games;  

USE orders;

SELECT product_name,order_date,
ADDDATE(`order_date`, INTERVAL 3 DAY) AS 'pay_due',
ADDDATE(`order_date`, INTERVAL 1 MONTH) AS 'deliver_due'
FROM orders;


