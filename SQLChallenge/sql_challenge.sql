

DROP DATABASE IF EXISTS `car_management_system`;
CREATE DATABASE `car_management_system`; 
USE `car_management_system`;

 
 DROP TABLE IF EXISTS `carsales`;

 CREATE TABLE `carsales` (
   `sale_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `car_maker`		varchar(30) 	NOT NULL,
   `car_model` 	varchar(30) 	NOT NULL,
   `sale_price_in_dollar` 		int(11) 	NOT NULL,
   `sale_date` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`sale_id`)
 ) ;

INSERT INTO carsales (car_maker, car_model, sale_price_in_dollar, sale_date) 
		VALUES ('Maker A','A Model X V6',2000,'2021-06-18 15:54:43'),
				('Maker B','B Model Z V6',3000,'2021-06-18 15:54:43'),
                ('Maker C','C Model Y V6',1500,'2021-06-18 15:54:43'),
                ('Maker A','A Model X V6',2000,'2021-06-18 15:54:43'),
				('Maker B','B Model Z V6',3000,'2021-06-18 15:54:43'),
                ('Maker C','C Model Y V6',1500,'2021-06-18 15:54:43'),
                ('Maker A','A Model X V6',2000,'2021-06-18 15:54:43'),
				('Maker B','B Model Z V6',3000,'2021-06-18 15:54:43'),
                ('Maker C','C Model Y V6',1500,'2021-06-18 15:54:43'),
                ('Maker A','A Model X V6',2000,'2021-06-18 15:54:43'),
				('Maker B','B Model Z V6',3000,'2021-06-18 15:54:43'),
                ('Maker C','C Model Y V6',1500,'2021-06-18 15:54:43');
                
INSERT INTO carsales (car_maker, car_model, sale_price_in_dollar) 
		VALUES ('Maker A','A Model X V6',2000),
				('Maker B','B Model Z V6',3000),
                ('Maker C','C Model Y V6',1500),
                ('Maker A','A Model X V6',2000),
				('Maker B','B Model Z V6',3000),
                ('Maker C','C Model Y V6',1500),
                ('Maker A','A Model X V6',2000),
				('Maker B','B Model Z V6',3000),
                ('Maker C','C Model Y V6',1500),
                ('Maker A','A Model X V6',2000),
				('Maker B','B Model Z V6',3000),
                ('Maker C','C Model Y V6',1500);
        
        
        
USE  car_management_system;
SELECT  

	car_maker AS CarMaker,
    car_model AS CarModel,
    (COUNT(car_model)*sale_price_in_dollar) AS TotalSalePrice
FROM carsales

WHERE sale_date BETWEEN '2021-06-01' AND  '2021-06-30'
GROUP BY CarModel, CarMaker