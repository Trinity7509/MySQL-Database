USE gringotts;

SELECT  
COUNT(id) AS 'count' 
FROM wizzard_deposits ;

SELECT 
MAX(magic_wand_size) AS 'longest_magic_wand'
FROM wizzard_deposits;
-------
/*WRONG !!
*/

SELECT deposit_group,magic_wand_size AS 'longest_magic_wand'
FROM wizzard_deposits 
GROUP BY deposit_group

HAVING  MAX(magic_wand_size)
ORDER BY AVG(magic_wand_size) ;
/*WRONG !!
*/
------
/*LAB!!
*/
USE restaurant;

SELECT department_id, SUM(salary) AS 'Total Salary'
FROM employees AS e
GROUP by department_id 
HAVING SUM(salary) <25000;


SELECT department_id,COUNT(id) AS 'Number of employees'
FROM employees AS e
GROUP by department_id;

SELECT department_id,ROUND(AVG(salary),2) AS 'Average Salary'
FROM employees AS e
GROUP BY department_id;

SELECT department_id,ROUND(MIN(salary),2) AS 'Min Salary'
FROM employees AS e
GROUP BY department_id
HAVING MIN(salary)>800;

USE restaurant;

SELECT COUNT(category_id) AS 'count'
FROM products AS p
WHERE price>8
GROUP by category_id
HAVING  category_id=2;

SELECT category_id, 
ROUND(AVG(price),2) AS 'Average Price',
ROUND(MIN(price),2) AS 'Cheapest Product',
Round(MAX(price),2) AS 'Most Expensive Product'
FROM products AS p
GROUP BY category_id;
/*LAB!!
*/
-----
USE gringotts;



SELECT deposit_group,
MAX(magic_wand_size) AS 'longest_magic_wand'
FROM wizzard_deposits
GROUP BY  deposit_group
HAVING AVG(magic_wand_size)
ORDER BY MAX(magic_wand_size) ASC,
deposit_group ASC;

SELECT `deposit_group`,
MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM `wizzard_deposits`
GROUP BY  `deposit_group`
ORDER BY`longest_magic_wand` ASC,
`deposit_group` ASC;


SELECT `deposit_group`
FROM `wizzard_deposits`
GROUP BY  `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;

SELECT `deposit_group`,
SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY`total_sum` ASC;

SELECT `deposit_group`,
SUM(`deposit_amount`)  AS `total_sum` FROM `wizzard_deposits`
WHERE `magic_wand_creator`='Ollivander family'
GROUP BY `deposit_group` ASC;


SELECT `deposit_group`,
SUM(`deposit_amount`)  AS `total_sum` FROM `wizzard_deposits`
WHERE `magic_wand_creator`='Ollivander family'
GROUP BY `deposit_group` 
HAVING `total_sum`<150000
ORDER BY `total_sum` DESC ;

SELECT `deposit_group`, 
`magic_wand_creator`, 
MIN(`deposit_charge`) AS `min_deposit_charge`
FROM `wizzard_deposits`
GROUP BY `deposit_group`,
`magic_wand_creator`
ORDER BY `magic_wand_creator`ASC,
`deposit_group` ASC;

 SELECT 
 (CASE
 WHEN `age`BETWEEN 0 AND 10 THEN '[0-10]'
 WHEN `age`BETWEEN 11 AND 20 THEN '[11-20]'
 WHEN `age`BETWEEN 21 AND 30 THEN '[21-30]'
 WHEN `age`BETWEEN 31 AND 40 THEN '[31-40]'
 WHEN `age`BETWEEN 41 AND 50 THEN '[41-50]'
 WHEN `age`BETWEEN 51 AND 60 THEN '[51-60]'
  WHEN `age`>60 THEN '[61+]'
 END)
 AS `age_group`, COUNT(*) AS `wizard_count`
 
 FROM `wizzard_deposits`
 GROUP BY `age_group`
ORDER BY `age_group`ASC;


SELECT SUBSTRING(`first_name`,1,1) 
AS `first_letter`
FROM `wizzard_deposits`
WHERE  `deposit_group`='Troll Chest'
GROUP  BY `first_letter`
ORDER BY `first_letter`;

USE gringotts;


SELECT  `deposit_group`,
`is_deposit_expired`,
AVG(`deposit_interest`) AS 'average_interest'
FROM `wizzard_deposits`
WHERE `deposit_start_date`>'1985-01-01'
GROUP BY `deposit_group`,`is_deposit_expired`
ORDER BY `deposit_group`DESC,`is_deposit_expired`;
 
 
 USE soft_uni;
 
 SELECT `department_id`, 
 MIN(`salary`) AS 'minimum_salary'
 FROM `employees`
 WHERE  `hire_date`>'2000-01-01'
 GROUP BY `department_id`
 HAVING `department_id` IN(2,5,7) 
 ORDER BY `department_id` ASC;
 

SELECT `department_id`,
(CASE 
WHEN `department_id`=1 THEN AVG(`salary`)+5000
ELSE AVG(`salary`)
END)
 AS 'avg_salary'
 
FROM `employees`
WHERE `salary`> 30000 AND  `manager_id`!=42
GROUP BY `department_id`
ORDER BY `department_id` ;

USE  soft_uni;

SELECT `department_id`, MAX(`salary`) AS `max_salary`
FROM `employees`

GROUP BY `department_id`
HAVING NOT`max_salary`BETWEEN 30000 AND 70000
ORDER BY  `department_id`ASC

;


SELECT COUNT(`salary`) AS 'count' 
FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `department_id`, 
SUM(`salary`) AS 'total_salary'
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;
 
 

 



