CREATE TABLE `Address` (
	`address_id` INT NOT NULL AUTO_INCREMENT,
	`house_no` varchar(255),
	`streetName` varchar(255),
	`landmark` varchar(255),
	`city` varchar(50),
	`district` varchar(50) NOT NULL,
	`state` varchar(50) NOT NULL,
	`country` varchar(50) NOT NULL DEFAULT 'India',
	PRIMARY KEY (`address_id`)
);

CREATE TABLE `User` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`firstName` varchar(50) NOT NULL,
	`middleName` varchar(50) NOT NULL,
	`lastName` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`contact` varchar(20) NOT NULL,
	`address_id` INT NOT NULL,
	`gender` varchar(10) NOT NULL,
	`bloodGroup` varchar(20) NOT NULL,
	`dateOfBirth` DATE NOT NULL,
	`photo` blob NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `Discription` (
	`discription_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`age` INT NOT NULL,
	`height` FLOAT NOT NULL,
	`oxygenLevel` FLOAT,
	`heartRate` INT,
	`bloodPressure` INT,
	`allergies` TEXT,
	`medicalHistory` TEXT,
	`LastCheckUpDate` DATETIME NOT NULL,
	`UpcomingCheckUpDate` DATETIME,
	PRIMARY KEY (`discription_id`)
);

CREATE TABLE `Doctor` (
	`doctor_id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(256) NOT NULL,
	`email` varchar(256) NOT NULL UNIQUE,
	`contactNo` varchar(100) NOT NULL UNIQUE,
	`specialization` varchar(256) NOT NULL,
	PRIMARY KEY (`doctor_id`)
);

CREATE TABLE `Admin` (
	`admin_id` INT NOT NULL AUTO_INCREMENT,
	`firstName` varchar(50) NOT NULL,
	`lastName` varchar(50) NOT NULL,
	`email` varchar(255) NOT NULL UNIQUE,
	`contact` varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `Claim` (
	`claim_id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`photo` blob NOT NULL,
	`doctor_id` INT NOT NULL,
	PRIMARY KEY (`claim_id`)
);

ALTER TABLE `User` ADD CONSTRAINT `User_fk0` FOREIGN KEY (`address_id`) REFERENCES `Address`(`address_id`);

ALTER TABLE `Discription` ADD CONSTRAINT `Discription_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`);

ALTER TABLE `Claim` ADD CONSTRAINT `Claim_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`);

ALTER TABLE `Claim` ADD CONSTRAINT `Claim_fk1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor`(`doctor_id`);

