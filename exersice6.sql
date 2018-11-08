USE soft_uni;

SELECT e.employee_id,e.job_title,e.address_id,a.address_text
FROM `employees` AS e
JOIN `addresses` AS a ON e.address_id=a.address_id
ORDER BY e.address_id ASC LIMIT 5;

SELECT e.first_name,e.last_name,(t.name) AS 'town',a.address_text
FROM employees AS e
JOIN addresses AS a ON e.address_id=a.address_id
JOIN towns AS t ON a.town_id=t.town_id
ORDER BY first_name ASC,
last_name LIMIT 5;

SELECT e.employee_id,e.first_name,e.last_name,(d.name) AS 'department_name'
FROM employees AS e
JOIN departments AS d ON e.department_id=d.department_id
WHERE d.name='Sales'
ORDER BY e.employee_id DESC;

SELECT e.employee_id,e.first_name,e.salary,(d.name) AS 'department_name'
FROM employees AS e
JOIN departments AS d ON e.department_id=d.department_id
WHERE e.salary>15000
ORDER BY e.department_id DESC LIMIT 5;

SELECT e.employee_id,e.first_name
FROM employees AS e
LEFT JOIN employees_projects AS ep ON e.employee_id=ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC LIMIT 3;

SELECT e.first_name,e.last_name,e.hire_date,(d.name) AS 'department_name'
FROM employees AS e
LEFT JOIN departments AS d ON e.department_id=d.department_id
WHERE DATE(e.hire_date)>'1999-01-01' AND d.name IN('Sales','Finance')
ORDER BY e.hire_date ASC;

SELECT e.employee_id,e.first_name,(p.name) AS 'project_name'
FROM employees AS e
JOIN employees_projects AS ep ON e.employee_id=ep.employee_id
JOIN projects AS p ON ep.project_id=p.project_id
WHERE DATE(p.start_date)>'2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name ASC,
p.name ASC LIMIT 5;


SELECT e.employee_id,e.first_name,
(CASE
WHEN YEAR(p.start_date)>=2005 THEN  NULL
ELSE p.name
END) AS 'project_name'
FROM employees AS e
JOIN employees_projects AS ep ON e.employee_id=ep.employee_id
JOIN projects AS p ON ep.project_id=p.project_id
WHERE e.employee_id =24
ORDER BY p.name ASC;

SELECT e.employee_id,e.first_name,e.manager_id,m.first_name
FROM employees AS e
JOIN employees AS m ON e.manager_id=m.employee_id
WHERE e.manager_id IN(3,7)
ORDER BY e.first_name ASC;

SELECT e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS 'employee_name',
CONCAT(m.first_name,' ',m.last_name) AS 'manager_name',
d.name AS 'department_name'
FROM employees AS e
JOIN employees AS m ON e.manager_id=m.employee_id
JOIN departments AS d ON e.department_id=d.department_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id LIMIT 5;


SELECT AVG(e.salary) AS 'min_average_salary'
FROM employees AS e

GROUP BY e.department_id
ORDER BY `min_average_salary` LIMIT 1
;

USE geography;

SELECT mc.country_code,m.mountain_range,p.peak_name,p.elevation
FROM mountains_countries  AS mc
JOIN mountains AS m ON mc.mountain_id=m.id
JOIN peaks AS p ON mc.mountain_id=p.mountain_id
WHERE mc.country_code='BG' AND p.elevation>2835 
ORDER BY p.elevation DESC;

SELECT mc.country_code,COUNT(m.mountain_range) AS 'mountain_range'
FROM mountains_countries  AS mc
JOIN mountains AS m ON mc.mountain_id=m.id
WHERE mc.country_code IN('US','RU','BG')
GROUP BY mc.country_code
ORDER BY `mountain_range` DESC;


SELECT c.country_name,
 r.river_name
FROM countries AS c
LEFT  JOIN countries_rivers AS cr ON c.country_code=cr.country_code
LEFT JOIN rivers AS r ON r.id=cr.river_id
JOIN continents AS cn ON c.continent_code=cn.continent_code
WHERE cn.continent_code='AF'
ORDER BY c.country_name ASC LIMIT 5;

SELECT COUNT(mc.country_code) AS 'country_count'

FROM mountains_countries AS mc
WHERE mc.country_code IS NULL;









