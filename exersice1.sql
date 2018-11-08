USE minions;
CREATE TABLE minions
(
id INT NOT NULL,
name VARCHAR(50),
age INT,
CONSTRAINT pk PRIMARY KEY(id)
);
CREATE TABLE towns
(
id INT NOT NULL,
name VARCHAR(50),
CONSTRAINT pk PRIMARY KEY(id)
);

ALTER TABLE minions
ADD town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk FOREIGN KEY(town_id) REFERENCES towns(id);

INSERT INTO  towns VALUES(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');
INSERT INTO minions VALUES(1,'Kevin',22,1)
,(2,'Bob',15,3),
(3,'Steward',NULL,2);


TRUNCATE TABLE minions;
DROP TABLE minions,towns;

USE  minions;

CREATE TABLE people
(
id INT NOT NULL UNIQUE AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture LONGBLOB,
height DOUBLE(5,2),
weight DOUBLE(5,2),
gender ENUM('m','f') NOT NULL,
birthdate DATE NOT NULL,
biography LONGTEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO people VALUES
(1, 'Tito', NULL,NULL,NULL,'m','1985-12-07','idiot'),
(2, 'Dodo', NULL,NULL,NULL,'m','1985-12-08','a kind of idiot'),
(3, 'Momo', NULL,NULL,NULL,'m','1985-12-09','not at all idiot'),
(4, 'Koko', NULL,NULL,NULL,'m','1985-12-10','full idiot'),
(5, 'Roro', NULL,NULL,NULL,'m','1985-12-11','half idiot');

USE minions;

CREATE TABLE users
(
id INT NOT NULL UNIQUE AUTO_INCREMENT,
username CHAR(30) NOT NULL UNIQUE,
password CHAR(26) NOT NULL,
profile_picture BLOB,
last_login_time TIMESTAMP,
is_deleted BOOLEAN,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO users VALUES
(1,'gogo','rrr', NULL,NULL,TRUE),
(2,'gogo1','rrrs', NULL,NULL,FALSE),
(3,'gogo2','rrrx', NULL,NULL,TRUE),
(4,'gogo3','rrrz', NULL,NULL,TRUE),
(5,'gogo4','rrra', NULL,NULL,FALSE);

ALTER TABLE users
MODIFY COLUMN id INT(11);

ALTER TABLE users
DROP PRIMARY KEY;

ALTER TABLE users
ADD PRIMARY KEY(id,username);



ALTER TABLE users MODIFY COLUMN last_login_time TIMESTAMP NOT NULL DEFAULT current_timestamp;


ALTER TABLE users
MODIFY COLUMN id INT(11);

ALTER TABLE users
DROP PRIMARY KEY;

ALTER TABLE users
ADD PRIMARY KEY(id);

ALTER TABLE users
ADD CONSTRAINT yx UNIQUE (username);




CREATE DATABASE movies;
USE movies;

CREATE TABLE directors(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
director_name VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
); 

INSERT INTO directors VALUES
(1,'Tito',NULL),
(2,'Tito1',NULL),
(3,'Tito2',NULL),
(4,'Tito3',NULL),
(5,'Tito4',NULL);

CREATE TABLE genres(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
genre_name VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO genres VALUES
(1,'Toto',NULL),
(2,'Toto1',NULL),
(3,'Toto2',NULL),
(4,'Toto3',NULL),
(5,'Toto4',NULL);


CREATE TABLE categories(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
category_name VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO categories VALUES
(1,'Dito',NULL),
(2,'Dito1',NULL),
(3,'Dito2',NULL),
(4,'Dito3',NULL),
(5,'Dito4',NULL);


CREATE TABLE movies (
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
title VARCHAR(100) NOT NULL, 
director_id INT, 
copyright_year YEAR, 
length TIME, 
genre_id INT, 
category_id INT, 
rating INT, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO movies VALUES
(1,'Dodo',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'Dodo1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'Dodo2',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'Dodo3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'Dodo4',NULL,NULL,NULL,NULL,NULL,NULL,NULL);


CREATE DATABASE hotel;

CREATE TABLE employees 
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL, 
title VARCHAR(100), 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO employees VALUES
(1,'Dito', 'Didov',NULL,NULL),
(2,'Tito', 'Tidov',NULL,NULL),
(3,'Dido', 'Ditov',NULL,NULL);




CREATE TABLE customers 
(
account_number INT NOT NULL, 
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL, 
phone_number INT, 
emergency_name TEXT, 
emergency_number INT, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(account_number )
);


INSERT INTO customers VALUES
(1345,'Рito', 'Pidov',NULL,NULL,NULL,NULL),
(1245,'Mito', 'Midov',NULL,NULL,NULL,NULL),
(3345,'nito', 'nidov',NULL,NULL,NULL,NULL);


CREATE TABLE room_status
(
room_status VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(room_status)
);


INSERT INTO room_status VALUES
('free',NULL),
('occupied',NULL),
('free2',NULL);

CREATE TABLE room_types 
(
room_type VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(room_type)
);


INSERT INTO room_types VALUES
('double',NULL),
('single',NULL),
('double1',NULL);

CREATE TABLE bed_types 
(
bed_type VARCHAR(100) NOT NULL, 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(bed_type )
);

INSERT INTO bed_types VALUES
('double',NULL),
('king',NULL),
('double2',NULL);

CREATE TABLE rooms
(
 room_number INT NOT NULL,
 room_type VARCHAR(100) NOT NULL, 
 bed_type VARCHAR(100) NOT NULL, 
 rate INT, 
 room_status ENUM('occupied','free') NOT NULL, 
 notes TEXT,
 CONSTRAINT pk PRIMARY KEY(room_number)
);


INSERT INTO rooms VALUES
(1,'double','double',NULL,'free',NULL),
(3,'single','single',NULL,'free',NULL),
(5,'double','king',NULL,'free',NULL);



CREATE TABLE payments
(
 id INT NOT NULL UNIQUE AUTO_INCREMENT,
 employee_id INT,
 payment_date DATE, 
 account_number INT, 
 first_date_occupied DATE, 
 last_date_occupied DATE, 
 total_days INT, 
 amount_charged DOUBLE(5,2), 
 tax_rate INT, 
 tax_amount DOUBLE(5,2), 
 payment_total DOUBLE(5,2), 
 notes TEXT,
 CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO payments VALUES
(1,3,'1999-10-09',34556,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL),
(2,33,'1999-09-09',3453446,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL),
(3,35,'1999-09-15',345216,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL);

CREATE TABLE occupancies
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
employee_id INT, 
date_occupied DATE, 
account_number INT, 
room_number INT, 
rate_applied INT, 
phone_charge ENUM('yes','no'), 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO occupancies VALUES
(1,3,'1999-10-09',34556,NULL,NULL,'no',NULL),
(2,35,'1999-12-09',34556,NULL,NULL,'no',NULL),
(3,36,'1999-11-09',34556,NULL,NULL,'no',NULL);

CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE categories
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
category VARCHAR(100) , 
daily_rate INT, 
weekly_rate INT, 
monthly_rate INT, 
weekend_rate INT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO categories VALUES
(1,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL);


CREATE TABLE cars 
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
plate_number INT, 
make DATE, 
model VARCHAR(100) , 
car_year YEAR, 
category_id INT, 
doors VARCHAR(100), 
picture BLOB, 
car_condition VARCHAR(100), 
available VARCHAR(100),
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO cars VALUES
(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


CREATE TABLE employees
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
first_name VARCHAR(100), 
last_name VARCHAR(100), 
title VARCHAR(100), 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO employees VALUES
(1,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL);

CREATE TABLE customers
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
driver_licence_number VARCHAR(100), 
full_name VARCHAR(100), 
address VARCHAR(100), 
city VARCHAR(100), 
zip_code VARCHAR(10), 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO customers VALUES
(1,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL,NULL);


CREATE TABLE rental_orders 
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
employee_id INT, 
customer_id INT, 
car_id INT, 
car_condition VARCHAR(100), 
tank_level DOUBLE(5,2), 
kilometrage_start INT, 
kilometrage_end INT, 
total_kilometrage INT, 
start_date DATE, 
end_date DATE, 
total_days INT, 
rate_applied INT, 
tax_rate INT, 
order_status VARCHAR(10), 
notes TEXT,
CONSTRAINT pk PRIMARY KEY(id)
);

INSERT INTO rental_orders VALUES
(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

CREATE DATABASE soft_uni;
USE soft_uni;

CREATE TABLE towns 
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
name VARCHAR(100),
CONSTRAINT pk PRIMARY KEY(id)
);

CREATE TABLE addresses 
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
address_text VARCHAR(100),
town_id INT,
CONSTRAINT pk PRIMARY KEY(id),
CONSTRAINT fk FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE departments  
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
name VARCHAR(100),
CONSTRAINT pk PRIMARY KEY(id)
);

CREATE TABLE employees   
(
id INT NOT NULL UNIQUE AUTO_INCREMENT, 
first_name VARCHAR(100), 
middle_name VARCHAR(100), 
last_name VARCHAR(100), 
job_title VARCHAR(100), 
department_id INT, 
hire_date DATE, 
salary DOUBLE(8,2), 
address_id INT,
CONSTRAINT pk PRIMARY KEY(id),
CONSTRAINT FK_EM FOREIGN KEY (department_id) REFERENCES departments(id),
CONSTRAINT FK_EMPL FOREIGN KEY (address_id) REFERENCES addresses(id)

);

INSERT INTO towns VALUES
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna'),
(4,'Burgas');


INSERT INTO departments VALUES
(1,'Engineering'),
(2,'Sales'),
(3,'Marketing'),
(4,'Software Development'),
(5,'Quality Assurance');

INSERT INTO employees  VALUES
(1,'Ivan', 'Ivanov', 'Ivanov','.NET Developer',4,'2013-02-01',3500.00,NULL),
(2,'Petar', 'Petrov', 'Petrov',	'Senior Engineer',1,'2004-03-2',4000.00,NULL),
(3,'Maria', 'Petrova', 'Ivanova','Intern',	5,	'2016-08-28',	525.25,NULL),
(4,'Georgi','Terziev', 'Ivanov','CEO',	2,	'2007-12-09',3000.00,NULL),
(5,'Peter', 'Pan', 'Pan','Intern',3,'2016-08-28',599.88,NULL);

SELECT *FROM towns;

SELECT *FROM departments;

USE soft_uni;

SELECT *FROM employees;

SELECT name FROM towns
ORDER BY name ASC;

SELECT name FROM departments
ORDER BY name ASC;

SELECT first_name, last_name, job_title, salary FROM employees
ORDER BY salary DESC;

SELECT 
SUM(salary*1.1) AS salary
FROM employees
GROUP BY id;

USE hotel;

SELECT 
SUM(tax_rate*0.97) AS tax_rate
FROM payments
GROUP BY id;

USE hotel;

TRUNCATE TABLE occupancies;












