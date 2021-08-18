

DROP DATABASE IF EXISTS `employee_management_system`;
CREATE DATABASE `employee_management_system`; 
USE `employee_management_system`;

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
   `employee_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `email_id`		varchar(40) 	DEFAULT NULL,
   `first_name` 	varchar(30) 	DEFAULT NULL,
   `last_name`		varchar(30) 	DEFAULT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`employee_id`),
   UNIQUE KEY `uindex_employees_email_id` (`email_id`)
 );
 
 DROP TABLE IF EXISTS `tasks`;

 CREATE TABLE `tasks` (
   `task_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `employee_id` 		bigint 			NOT NULL,
   `task_description`	varchar(50) 	NOT NULL,
   `task_status` 		varchar(45) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`task_id`),
   KEY `task_employees_fk` (`employee_id`),
   CONSTRAINT `fk_tasks_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 
 DELIMITER $$
CREATE PROCEDURE generate_employees()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 10001 DO
    INSERT INTO `employees` (`email_id`,`first_name`,`last_name`) 
		VALUES (
            concat('Email-id - ' ,i,'@gmail.com' ),
            concat('firstname - ',i ),
            concat('lastname - ',i )
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_employees();
 
DROP PROCEDURE IF EXISTS generate_task;
DELIMITER $$
CREATE PROCEDURE generate_task()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 500001 DO
    INSERT INTO `tasks` (`employee_id`,`task_description`,`task_status`) 
		VALUES (
			CAST((RAND()*(10000-1)+1) AS SIGNED) ,
            concat('taskdescription - ',i ),
            concat('taskstatus - ',i )
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
CALL generate_task();