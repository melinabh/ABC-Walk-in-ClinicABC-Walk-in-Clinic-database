CREATE DATABASE  IF NOT EXISTS `group30schema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group30schema`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: group30schema
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `idAppointment` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `symptoms` varchar(255) NOT NULL,
  `status` varchar(60) NOT NULL,
  `cancellation_date` date DEFAULT NULL,
  `cancellation_time` time DEFAULT NULL,
  `idpatient` int NOT NULL,
  `idstaff` int NOT NULL,
  PRIMARY KEY (`idAppointment`),
  KEY `fk_Appointment_Patient_idx` (`idpatient`),
  KEY `fk_Appointment_Staff1_idx` (`idstaff`),
  CONSTRAINT `fk_Appointment_Patient` FOREIGN KEY (`idpatient`) REFERENCES `patient` (`idPatient`),
  CONSTRAINT `fk_Appointment_Staff1` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2020-07-15','10:00:00','Headache','Completed',NULL,NULL,1,1),(2,'2021-07-16','15:30:00','Fever, Cough','Completed',NULL,NULL,2,2),(3,'2020-07-17','14:15:00','Sore Throat','Completed',NULL,NULL,1,3),(4,'2021-07-18','11:45:00','Back Pain','Completed',NULL,NULL,4,4),(5,'2020-12-19','16:20:00','Fatigue','Canceled','2020-07-18','10:30:00',5,5),(6,'2021-07-20','13:00:00','Allergies','Completed',NULL,NULL,6,6),(7,'2020-07-21','09:30:00','Upset Stomach','Completed',NULL,NULL,1,7),(8,'2020-12-22','12:45:00','Sprained Ankle','Canceled','2021-07-22','09:00:00',8,8),(9,'2020-07-23','17:15:00','Headache','Completed',NULL,NULL,1,9),(10,'2021-07-24','14:00:00','Cough, Runny Nose','Completed',NULL,NULL,10,10),(11,'2020-07-25','10:45:00','Fatigue','Completed',NULL,NULL,1,1),(12,'2020-12-26','16:30:00','Sore Throat, Fever','Canceled','2021-07-26','15:00:00',12,2),(13,'2020-07-27','13:15:00','Back Pain','Completed',NULL,NULL,13,3),(14,'2021-07-28','10:30:00','Headache','Completed',NULL,NULL,14,4),(15,'2020-07-29','15:00:00','Allergies','Completed',NULL,NULL,15,5),(16,'2021-07-30','11:00:00','Upset Stomach','Canceled','2021-07-29','10:00:00',16,6),(17,'2020-07-31','16:45:00','Sprained Ankle','Completed',NULL,NULL,17,7),(18,'2021-08-01','13:30:00','Cough, Runny Nose','Completed',NULL,NULL,18,8),(19,'2020-08-02','09:15:00','Sore Throat','Completed',NULL,NULL,19,9),(20,'2021-08-03','14:45:00','Fatigue','Completed',NULL,NULL,20,10),(21,'2022-08-04','10:00:00','Stomachache','Completed',NULL,NULL,1,5),(22,'2023-08-05','15:30:00','Headache','Scheduled',NULL,NULL,2,6),(23,'2022-08-06','14:15:00','Fever','Completed',NULL,NULL,3,7),(24,'2020-12-07','11:45:00','Back Pain','Scheduled',NULL,NULL,4,8),(25,'2022-08-08','16:20:00','Fatigue','Canceled','2022-08-08','10:30:00',5,9),(26,'2023-08-09','13:00:00','Allergies','Scheduled',NULL,NULL,6,10),(27,'2022-08-10','09:30:00','Upset Stomach','Completed',NULL,NULL,7,3),(28,'2023-08-11','12:45:00','Sprained Ankle','Canceled','2023-08-04','09:00:00',8,4),(29,'2020-12-12','17:15:00','Headache','Scheduled',NULL,NULL,9,5),(30,'2022-12-18','10:00:00','Fever','Completed',NULL,NULL,3,10),(31,'2022-12-18','12:00:00','Allergies','Completed',NULL,NULL,6,10),(32,'2022-12-18','14:45:00','Back Pain','Completed',NULL,NULL,7,10),(33,'2022-12-18','14:45:00','Headache','Completed',NULL,NULL,11,10),(34,'2022-12-18','14:45:00','Sprained Wrist','Completed',NULL,NULL,5,10);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `iddepartment` int NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddepartment`),
  UNIQUE KEY `department_name_UNIQUE` (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (4,'Administrative Assitant'),(1,'Doctor'),(5,'Manager'),(2,'Nurse'),(3,'Secretary');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic`
--

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic` (
  `idDiagnostic` int NOT NULL AUTO_INCREMENT,
  `diagnostic_name` varchar(120) DEFAULT NULL,
  `prescription` varchar(120) DEFAULT NULL,
  `referral` varchar(80) DEFAULT NULL,
  `Appointment_idAppointment` int NOT NULL,
  PRIMARY KEY (`idDiagnostic`),
  KEY `fk_Diagnostic_Appointment1_idx` (`Appointment_idAppointment`),
  CONSTRAINT `fk_Diagnostic_Appointment1` FOREIGN KEY (`Appointment_idAppointment`) REFERENCES `appointment` (`idAppointment`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic`
--

LOCK TABLES `diagnostic` WRITE;
/*!40000 ALTER TABLE `diagnostic` DISABLE KEYS */;
INSERT INTO `diagnostic` VALUES (1,'Common Cold','Rest and hydration',NULL,1),(2,'Influenza','Antiviral medication',NULL,2),(3,'Strep Throat','Antibiotics',NULL,3),(4,'Migraine','Pain relievers',NULL,4),(5,'Type 2 Diabetes','Insulin therapy','Endocrinologist',6),(6,'Allergic Rhinitis','Antihistamines','Allergist',7),(7,'High Blood Pressure','Lifestyle changes and medication','Cardiologist',9),(8,'Sprained Ankle','RICE (Rest, Ice, Compression, Elevation)',NULL,10),(9,'High Cholesterol	','Statins','Cardiologist',11),(10,'Asthma','Inhaler and medications','Pulmonologist',13),(11,'Gastroenteritis','Fluids and bland diet',NULL,14),(12,'Anxiety','Counseling and medication','Psychiatrist',15),(13,'Sinusitis','Decongestants and rest','ENT Specialist',17),(14,'Urinary Tract Infection	','Antibiotics','Urologist',18),(15,'Acne','Topical treatments','Dermatologist',19),(16,'Back Pain','Pain relievers and therapy','Orthopedist',20),(17,'Allergic Reaction','Epinephrine and antihistamines','Allergist',21),(18,'Hypothyroidism','Thyroid hormone therapy','Endocrinologist',22),(19,'Pneumonia','Antibiotics and rest','Pulmonologist',23),(20,'Conjunctivitis','Eye drops','Ophthalmologist',24),(21,'Diarrhea','Rehydration and bland diet','Gastroenterologist',26),(22,'Insomnia','Sleep hygiene and therapy','Sleep Specialist',27),(23,'Otitis Media','Pain relievers and rest','ENT Specialist',29),(25,NULL,NULL,NULL,5),(26,NULL,NULL,NULL,8),(27,NULL,NULL,NULL,12),(28,NULL,NULL,NULL,16),(29,NULL,NULL,NULL,25),(30,NULL,NULL,NULL,28);
/*!40000 ALTER TABLE `diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Examination`
--

DROP TABLE IF EXISTS `Examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Examination` (
  `idExamination` int NOT NULL AUTO_INCREMENT,
  `blood_pressure` int DEFAULT NULL,
  `temperature_celsius` float DEFAULT NULL,
  `weight_lbs` float DEFAULT NULL,
  `height_cm` int DEFAULT NULL,
  `Staff_idStaff` int NOT NULL,
  `Appointment_idAppointment` int NOT NULL,
  PRIMARY KEY (`idExamination`),
  KEY `fk_Exmaination_Staff1_idx` (`Staff_idStaff`),
  KEY `fk_Exmaination_Appointment1_idx` (`Appointment_idAppointment`),
  CONSTRAINT `fk_Exmaination_Appointment1` FOREIGN KEY (`Appointment_idAppointment`) REFERENCES `Appointment` (`idAppointment`),
  CONSTRAINT `fk_Exmaination_Staff1` FOREIGN KEY (`Staff_idStaff`) REFERENCES `Staff` (`idStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Examination`
--

LOCK TABLES `Examination` WRITE;
/*!40000 ALTER TABLE `Examination` DISABLE KEYS */;
INSERT INTO `Examination` VALUES (1,12080,37.2,150.5,175,11,1),(2,11070,36.8,140.2,165,12,2),(3,12285,37,160,170,13,3),(4,11875,36.5,145.7,160,14,4),(5,11572,36.9,143.8,167,16,6),(6,12582,37.1,151,172,11,7),(7,11270,36.6,146.5,168,13,9),(8,12078,37.4,157.8,180,14,10),(9,11075,36.7,148,170,15,11),(10,11876,36.8,150.9,165,11,13),(11,12885,37,159.5,172,12,14),(12,11270,36.5,145,160,13,15),(13,11075,36.9,152.3,168,15,17),(14,12582,37.1,158,170,16,18),(15,11876,37.2,153.5,165,11,19),(16,13088,37.4,160.8,180,12,20),(17,11572,36.7,148.9,167,13,21),(18,12078,37.5,157.3,175,14,22),(19,11070,36.8,149.5,165,15,23),(20,12285,37,159.2,170,16,24),(21,13088,37.2,158.5,180,12,26),(22,11572,36.5,147.5,167,13,27),(23,12884,37.1,153.7,175,15,29);
/*!40000 ALTER TABLE `Examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `idInvoices` int NOT NULL AUTO_INCREMENT,
  `items` varchar(120) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `standing` varchar(45) DEFAULT NULL,
  `idAppointment` int NOT NULL,
  PRIMARY KEY (`idInvoices`),
  KEY `fk_Invoices_Appointment1_idx` (`idAppointment`),
  CONSTRAINT `fk_Invoices_Appointment1` FOREIGN KEY (`idAppointment`) REFERENCES `appointment` (`idAppointment`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'Sick Note',20,'2020-08-16','2020-07-17',NULL,3),(2,'Sick Note',20,'2021-08-17','2021-07-18',NULL,4),(3,'Medical Certificate',100,'2021-08-19','2021-07-20',NULL,6),(4,'Late Cancellation Fee',50,'2021-08-21','2021-07-22',NULL,8),(5,'Visitor ',100,'2021-08-23','2021-07-24',NULL,10),(6,'Late Cancellation Fee',50,'2021-08-25','2021-07-26',NULL,12),(7,'Sick Note',20,'2020-08-26','2020-07-27',NULL,13),(8,'Medical Certificate',100,'2020-08-28','2020-07-29',NULL,15),(9,'Sick Note',20,'2020-09-01','2020-08-02',NULL,19),(10,'Sick Note',20,'2022-09-05','2022-08-06',NULL,23),(11,'Late Cancellation Fee',50,'2022-09-07','2022-08-08',NULL,25);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `idPatient` int NOT NULL AUTO_INCREMENT,
  `patient_fullname` varchar(60) NOT NULL,
  `patient_address` varchar(80) DEFAULT NULL,
  `patient_city` varchar(45) DEFAULT NULL,
  `patient_province` varchar(45) DEFAULT NULL,
  `patient_postalcode` char(7) DEFAULT NULL,
  `patient_phone` varchar(45) DEFAULT NULL,
  `patient_email` varchar(60) DEFAULT NULL,
  `patient_healthcard` varchar(20) NOT NULL,
  `enrolled_status` varchar(45) NOT NULL,
  `primary_member_id` int DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Sophia Johnson','123 Maple Street','Toronto','Ontario','M4B 1X2','(416) 888-3456','sophia.johnson@hotmail.com','OHIP123456789','Enrolled',2,'Husband'),(2,'Liam Williams','456 Oak Avenue','Toronto','Ontario','L3R 2K8','(647) 545-8945','liam.williams@hotmail.com','OHIP987654321','Enrolled',NULL,NULL),(3,'Olivia Smith','789 Pine Lane','Toronto','Ontario','K2G 3H6','(647) 485-7690','olivia.smith@hotmail.com','OHIP234567890','Enrolled',NULL,NULL),(4,'Noah Brown','1010 Elm Court','Toronto','Ontario','V7Y 1A1','(416) 237-4264','noah.brown@hotmail.com','OHIP345678901','Walk-In',6,'Father'),(5,'Ava Davis','111 Willow Road','Mississauga','Ontario','N6A 3K7','(905) 536-1381','ava.davis@hotmail.com','OHIP456789012','Enrolled',NULL,NULL),(6,'Ethan Wilson','1313 Cedar Drive','Toronto','Ontario','T2P 0L6','(416) 334-8498','ethan.wilson@hotmail.com','OHIP567890123','Walk-In',NULL,NULL),(7,'Isabella Martinez','1515 Birch Lane','Toronto','Ontario','H1V 2J3','(647) 133-5615','isabella.martinez@hotmail.com','OHIP678901234','Enrolled',NULL,NULL),(8,'Mason Taylor','1717 Rosewood Street','Toronto','Ontario','R4G 5B9','(647) 932-2731','mason.taylor@hotmail.com','OHIP789012345','Enrolled',NULL,NULL),(9,'Amelia Anderson','1919 Sycamore Avenue','Toronto','Ontario','E2E 4F5','(416) 730-9848','amelia.anderson@hotmail.com','OHIP890123456','Enrolled',NULL,NULL),(10,'Aiden Jackson','2020 Magnolia Circle','Detroit','Michigan','48201','(313) 529-6965','aiden.jackson@hotmail.com','NULL','Walk-In',3,'Wife'),(11,'Mia Thompson','2222 Jasmine Lane','Toronto','Ontario','W5C 9N8','(416) 328-4082','mia.thompson@hotmail.com','OHIP345612890','Enrolled',NULL,NULL),(12,'Lucas White','Brookside Terrace','Toronto','Ontario','P9L 1Q4','(416) 127-1199','lucas.white@hotmail.com','OHIP876590234','Enrolled',NULL,NULL),(13,'Harper Harris','2525 Acorn Avenue','Toronto','Ontario','F6T 3E2','(905) 925-8316','harper.harris@hotmail.com','OHIP234501678','Walk-In',NULL,NULL),(14,'Oliver Martin','2727 Juniper Place','Mississauga','Ontario','Z0K 2X1','(647) 724-5433','oliver.martin@hotmail.com','OHIP567892301','Enrolled',NULL,NULL),(15,'Evelyn Garcia','2929 Meadowview Road','Brampton','Ontario','U7J 6R5','(437) 523-2550','evelyn.garcia@hotmail.com','OHIP908741623','Enrolled',NULL,NULL),(16,'Elijah Lee','3030 Ivy Way','Toronto','Ontario','D3M 8P9','(437) 321-9666','elijah.lee@hotmail.com','OHIP127896534','Enrolled',12,'Son'),(17,'Charlotte Rodriguez','3232 Sunset Boulevard','Toronto','Ontario','Q2N 5S4','(519) 912-0678','charlotte.rodriguez@hotmail.com','OHIP435789621','Walk-In',NULL,NULL),(18,'James Miller','3434 Cherry Blossom Lane','Toronto','Ontario','Y1V 4B6','(647) 919-3900','james.miller@hotmail.com','OHIP965781234','Walk-In',NULL,NULL),(19,'Emma Martinez','3636 Laurel Street','Newmarket','Ontario','I5A 7T3','(416) 718-1017','emma.martinez@hotmail.com','OHIP234156789','Walk-In',NULL,NULL),(20,'Alexander Clark','3838 Orchard Hill Drive','Toronto','Ontario','O4E 9W2','(416) 516-8134','alexander.clark@hotmail.com','OHIP657823490','Enrolled',NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `idpayroll` int NOT NULL AUTO_INCREMENT,
  `shift` varchar(45) NOT NULL,
  `hours_worked` int NOT NULL,
  `from_date` date NOT NULL,
  `until_date` date DEFAULT NULL,
  `total_pay` int NOT NULL,
  `idstaff` int NOT NULL,
  PRIMARY KEY (`idpayroll`),
  KEY `fk_Payroll_Staff1_idx` (`idstaff`),
  CONSTRAINT `fk_Payroll_Staff1` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,'am',91,'2023-07-14','2023-07-28',2730,11),(2,'am',91,'2023-07-14','2023-07-28',3185,12),(3,'am',91,'2023-07-14','2023-07-28',3640,13),(4,'am',91,'2023-07-14','2023-07-28',4095,14),(5,'pm',78,'2023-07-14','2023-07-28',3900,15),(6,'pm',78,'2023-07-14','2023-07-28',3120,16),(7,'am',91,'2023-07-14','2023-07-28',1820,17),(8,'am',91,'2023-07-14','2023-07-28',2275,20),(9,'am',91,'2023-07-14','2023-07-28',1820,18),(10,'pm',78,'2023-07-14','2023-07-28',1560,19),(11,'pm',78,'2023-07-14','2023-07-28',1950,21),(12,'am',91,'2023-07-14','2023-07-28',2366,22),(13,'pm',78,'2023-07-14','2023-07-28',2184,23),(14,'am/pm',78,'2023-07-14','2023-07-28',4290,24);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idStaff` int NOT NULL AUTO_INCREMENT,
  `staff_fullname` varchar(60) NOT NULL,
  `staff_address` varchar(80) DEFAULT NULL,
  `staff_city` varchar(45) DEFAULT NULL,
  `staff_province` varchar(45) DEFAULT NULL,
  `staff_postalcode` char(7) DEFAULT NULL,
  `staff_phone` varchar(45) DEFAULT NULL,
  `staff_email` varchar(60) DEFAULT NULL,
  `staff_rate` int DEFAULT NULL,
  `iddepartment` int NOT NULL,
  PRIMARY KEY (`idStaff`),
  KEY `fk_Staff_Department1_idx` (`iddepartment`),
  CONSTRAINT `fk_Staff_Department1` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Aria Sinclair','1234 Elm Street','Toronto','Ontario','M1A 2B3','(647) 123-4567','aria.sinclair@hotmail.com',NULL,1),(2,'Ethan Frost','5678 Maple Avenue','Mississauga','Ontario','L1V 3D4','(647) 234-5678','e.frost@gmail.com',NULL,1),(3,'Isabella Knight','9012 Oak Drive','Toronto','Ontario','M3E 4F5','(647) 345-6789','isa.knight@gmail.com',NULL,1),(4,'Max Rivers','3456 Birch Lane','Toronto','Ontario','M4G 5H6','(647) 456-7890','m.rivers@gmail.com',NULL,1),(5,'Olivia Steele','7890 Cedar Court','Toronto','Ontario','M5I 6J7','(647) 567-8901','o.steele@gmail.com',NULL,1),(6,'Gabriel Blackwood','2345 Pine Road','Mississauga','Ontario','L1D 7L8','(647) 678-9012','g.blackwood@gmail.com',NULL,1),(7,'Sophia Monroe','6789 Willow Way','Toronto','Ontario','M7M 8N9','(647) 789-0123','s.monroe@gmail.com',NULL,1),(8,'Jackson Archer','4321 Poplar Crescent','Toronto','Ontario','M8O 9P1','(647) 890-1234','j.archer@gmail.com',NULL,1),(9,'Mia Hawthorne','1357 Spruce Street','Toronto','Ontario','M9Q 2R3','(647) 901-2345','m.hawthorne@gmail.com',NULL,1),(10,'Caleb Montgomery','8642 Fir Avenue','Toronto','Ontario','M1S 3T4','(647) 012-3456','c.montgomery@gmail.com',NULL,1),(11,'Zara Wolfe','143 Willowbrook Lane','Toronto','Ontario','M1A 2B4','(647) 234-5679','z.wolfe@gmail.com',30,2),(12,'Xander Knight','684 Evergreen Avenue','Toronto','Ontario','M2C 3D5','(647) 345-6790','x.knight@gmail.com',35,2),(13,'Luna Evergreen','538 Crescent Heights Road','Mississauga','Ontario','L1S 4F6','(647) 456-7891','l.evergreen@gmail.com',40,2),(14,'Atlas Stone','3041 Oakwood Drive','Toronto','Ontario','M4G 5H7','(647) 567-8902','a.stone@gmail.com',45,2),(15,'Freya Hawthorne','894 Maplewood Lane','Toronto','Ontario','M5I 6J8','(647) 678-9013','f.hawthorne@gmail.com',50,2),(16,'Orion Drake','4001 Meadowbrook Boulevard','Mississauga','Ontario','L4C 7L9','(647) 789-0124','o.drake@gmail.com',40,2),(17,'Nova Winter','303 Sunset View Street','Mississauga','Ontario','L7M 8N1','(647) 890-1235','n.winter@gmail.com',20,3),(18,'Phoenix Brooks','6784 Pinecrest Court','Toronto','Ontario','M8O 9P2','(647) 901-2346','p.brooks@gmail.com',20,3),(19,'Astrid Storm','2 Riverbend Terrace','Toronto','Ontario','M9Q 2R4','(647) 012-3457','a.storm@gmail.com',20,3),(20,'Maverick Reed','116 Forest Glen Way','Mississauga','Ontario','L1S 3T5','(647) 234-5680','m.reed@gmail.com',25,3),(21,'Celeste Rivers','10 Maplewood Avenue','Toronto','Ontario','M1A 2B5','(647) 345-6791','c.rivers@gmail.com',25,3),(22,'Dante Blackwood','999 Sunflower Lane','Toronto','Ontario','M2C 3D6','(647) 456-7892','d.blackwood@gmail.com',26,4),(23,'Lyra Monroe','234 Oakridge Street','Toronto','Ontario','M3E 4F7','(647) 567-8903','l.monroe@gmail.com',28,4),(24,'Apollo Archer','53 Meadowbrook Drive','Toronto','Ontario','M4G 5H8','(647) 678-9014','a.archer@gmail.com',55,5);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-06 21:56:44
