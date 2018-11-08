CREATE DATABASE exercise_one;
USE exercise_one;

CREATE TABLE passports(
passport_id INT PRIMARY KEY,
passport_number VARCHAR(50)
);

CREATE TABLE persons(
person_id INT PRIMARY KEY,
first_name VARCHAR(50),
salary DECIMAL(7,2),
passport_id INT UNIQUE,
CONSTRAINT fk_persons_passports FOREIGN KEY
(passport_id) REFERENCES passports(passport_id)
);

INSERT INTO passports  VALUES
(101,'N34FG21B'),(102,'K65LO4R7'),(103,'ZE657QP2');

INSERT INTO persons VALUES 
(1,'Roberto',43300,102),
(2,'Tom',56100,103),
(3,'Yana',60200,101);

CREATE TABLE `manufacturers` (
	`manufacturer_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL,
    `established_on` DATE NOT NULL
);

CREATE TABLE `models` (
	`model_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `manufacturer_id` INT UNSIGNED NOT NULL
) AUTO_INCREMENT=101;

ALTER TABLE manufacturers
ADD CONSTRAINT pk_manuf PRIMARY KEY (manufacturer_id);

ALTER TABLE `models` 
	ADD CONSTRAINT `pk_models` 
		PRIMARY KEY (`model_id`),
    ADD CONSTRAINT `fk_models_manufacturers` 
		FOREIGN KEY (`manufacturer_id`)
        REFERENCES `manufacturers` (`manufacturer_id`);

INSERT INTO manufacturers VALUES
(1,'BMW','1916-03-01'),
(2,'Tesla','2003-01-01'),
(3,'Lada','1966-05-01');

INSERT INTO models VALUES
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);

SELECT 
    man.manufacturer_id,
    man.name,
    DATE(man.established_on),
    m.model_id,
    m.name
FROM
    manufacturers man
        INNER JOIN
    models m ON man.manufacturer_id = m.manufacturer_id
ORDER BY man.manufacturer_id;



CREATE TABLE `students`(
`student_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL,
CONSTRAINT `pk_st` PRIMARY KEY(`student_id`)
);

CREATE TABLE `exams`(
`exam_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT, 
`name` VARCHAR(30) NOT NULL,
CONSTRAINT `pk_exams` PRIMARY KEY(`exam_id`)
) AUTO_INCREMENT=101;

CREATE TABLE `students_exams`(
`student_id` INT UNSIGNED NOT NULL,
`exam_id` INT NOT NULL,
CONSTRAINT `pk_st_exams` PRIMARY KEY(`student_id`,`exam_id`),
CONSTRAINT `fk_st_exams_one` FOREIGN KEY(`student_id`)
REFERENCES `students`(`student_id`),
CONSTRAINT `fk_st_exams_two` FOREIGN KEY (`exam_id`)
REFERENCES `exams` (`exam_id`)
);


INSERT INTO `students`VALUES 
(1,'Mila'),(2,'Toni'),(3,'Ron');

INSERT INTO `exams` VALUES 
(101,'Spring MVC'),(102,'Neo4j'),(103,'Oracle 11g');


INSERT INTO `students_exams` VALUES 
(1,101),(1,102),(2,101),(3,103),(2,102),(2,103);


CREATE TABLE `teachers`(
`teacher_id` INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL,
`manager_id` INT UNSIGNED DEFAULT NULL
) AUTO_INCREMENT=101;

INSERT INTO `teachers` VALUES 
(101,'John',NULL),(102,'Maya',106),(103,'Silvia',106),
(104,'Ted',105),(105,'Mark',101),(106,'Greta',101);

ALTER TABLE `teachers`
ADD CONSTRAINT `pk` PRIMARY KEY (`teacher_id`),
ADD CONSTRAINT `fk` FOREIGN KEY(`manager_id`)
REFERENCES `teachers`(`teacher_id`);


CREATE DATABASE xx;
USE xx;

CREATE TABLE item_types(
item_type_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);


CREATE TABLE items(
item_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
item_type_id INT NOT NULL,
CONSTRAINT fk_items 
FOREIGN KEY(item_type_id)
REFERENCES item_types (item_type_id)
);

CREATE TABLE cities(
city_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);


CREATE TABLE customers(
customer_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
birthday DATE,
city_id INT  NOT NULL,
CONSTRAINT fk_cus FOREIGN KEY(city_id)
REFERENCES cities(city_id)
);

CREATE TABLE orders(
order_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
customer_id INT  NOT NULL,
CONSTRAINT fk_orders FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);


CREATE TABLE order_items(
order_id INT NOT NULL,
item_id INT NOT NULL,
CONSTRAINT pk_or_it PRIMARY KEY(order_id,item_id),
CONSTRAINT fk_or_it_one FOREIGN KEY (order_id)
REFERENCES orders(order_id),
CONSTRAINT fk_or_it_two FOREIGN KEY(item_id)
REFERENCES items(item_id)
);




CREATE TABLE majors(
major_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE students(
student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
student_number VARCHAR(12),
student_name VARCHAR(50),
major_id INT NOT NULL,
CONSTRAINT fk_st FOREIGN KEY(major_ID)
REFERENCES majors(major_ID)
);


CREATE TABLE payments(
payment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id INT NOT NULL,
CONSTRAINT fk_p FOREIGN KEY (student_id)
REFERENCES students(student_id)
);

CREATE TABLE subjects(
subject_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
subject_name VARCHAR(50)
);

CREATE TABLE agenda(
student_id INT NOT NULL,
subject_id INT NOT NULL,
CONSTRAINT pk_ag PRIMARY KEY(student_id,subject_id),
CONSTRAINT fk_ag_one FOREIGN KEY(student_id)
REFERENCES students(student_id),
CONSTRAINT fk_ag_two FOREIGN KEY(subject_id)
REFERENCES subjects(subject_id)
);

USE geography;

SELECT m.mountain_range,
p.peak_name,
p.elevation AS 'peak_elevation'
FROM mountains AS m
JOIN peaks AS p ON m.id=mountain_id
WHERE m.mountain_range='Rila'
ORDER BY p.elevation DESC;


















