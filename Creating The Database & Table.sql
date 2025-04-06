-- creating the schema for the dataset --
CREATE DATABASE `real_estate` 
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ 
/*!80016 DEFAULT ENCRYPTION='N' */;

-- set it as the default schema -- 
USE real_estate;

-- create a table --
DELIMITER //
DROP TABLE IF EXISTS realestate //
CREATE TABLE realestate(
	ID INT AUTO_INCREMENT PRIMARY KEY 		/* renamed from No to ID */ ,
    Property_Type VARCHAR(20) NOT NULL,
    Land_Area INT NOT NULL,
    Floor_Area INT NOT NULL,
    Property_Condition VARCHAR(20) NOT NULL	/* renamed from Condition to Property_Condition */ ,
    Property_View VARCHAR(20) 				/* renamed from View to Property_View */ ,
    Amenities VARCHAR(150), 
    Furnishing_Status VARCHAR(20) NOT NULL, 
    Air_Conditioning VARCHAR(5)				/* removed the '(Yes/No)' */ , 
	Heating VARCHAR(5)						/* removed the '(Yes/No)' */ , 
    Kitchen_Type VARCHAR(20), 
	Balcony VARCHAR(5)						/* removed the '(Yes/No)' */ , 
    Monthly_Maintenance_Fees INT 			/* renamed from Maintenance_Fees to Monthly_Maintenance_Fees */ , 
    Latitude DOUBLE, 
    Longitude DOUBLE, 
    Location VARCHAR(20) NOT NULL,
    Num_Bathrooms INT,
    Num_Rooms INT NOT NULL,
    Price INT NOT NULL,
    Distance_to_Nearest_MRT_Station DOUBLE /* renamed (captialized each word & underscored it) */ ,
	Distance_to_Nearest_Hospital DOUBLE    /* renamed (captialized each word & underscored it) */ ,
	Distance_to_Nearest_School DOUBLE 	   /* renamed (captialized each word & underscored it) */ ,
	Distance_to_Nearest_Bus_Stand DOUBLE   /* renamed (captialized each word & underscored it) */ ,
	Distance_to_Nearest_Airport DOUBLE     /* renamed (captialized each word & underscored it) */ ,
	Crime_Rate_in_Area DOUBLE 			   /* renamed (captialized each word & underscored it) */ 
); //
DELIMITER ;

-- returns the file location of where the csv file should be stored
SHOW VARIABLES LIKE 'secure_file_priv';		

-- load data into database
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/house_pricing_analysis_dataset.csv'
INTO TABLE realestate
FIELDS TERMINATED BY ','		/* each attribute/column is comma-separated */
ENCLOSED BY '"'
LINES TERMINATED BY '\n'		/* each new line is a new record */
IGNORE 1 ROWS;					/* ignore the header */

-- testing purposes --
select * from realestate LIMIT 10