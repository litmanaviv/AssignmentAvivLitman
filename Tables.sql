﻿DROP TABLE IF EXISTS consultants_expertise;/*delete the child table(expertise_details) first*/
DROP TABLE IF EXISTS Consultants;/*to run the script*/
CREATE TABLE Consultants/*table that contains the cosultants details*/
(CST_IDNO INT NOT NULL, CST_FNAME VARCHAR(20) NOT NULL, CST_LNAME VARCHAR(20) NOT NULL,
PRIMARY KEY(CST_IDNO));/*columns: unique id number used as the primary key, first name, last name*/
INSERT INTO Consultants/*insert values into consultant table*/
VALUES(127323,'Michale','Robbin'),
(526689,'Carlos','Snares'),
(843795,'Enric','Dosio'),
(328717,'Jhon','Snares'),
(444527,'Joseph','Dosni'),
(659831,'Emily','Zanifer'),
(847674,'Petr','Sitaraman'),
(748681,'Henry','Gabriel');

DROP TABLE IF EXISTS expertise_details;
CREATE TABLE expertise_details/* table that contains the expertise details*/
(EXP_NO INT NOT NULL, EXP_NAME VARCHAR(100)NOT NULL,Score INT NOT NULL,
PRIMARY KEY(EXP_NO));/*columns: unique expertise number used as the primary key, experties name, experties score*/
INSERT INTO expertise_details
VALUES (1,'Engineering consultant',50),
(2,'Educational consultant',40),
(3,'Business transformation consultant',30),
(4,'IT consultant',70),
(5,'Process consultant',60),
(6,'Performance consultant',30),
(7,'Sales consultant',50);


CREATE TABLE consultants_expertise/*table that contains the cosultants expertise details*/
(CST_IDNO INT NOT NULL, EXP_NO INT NOT NULL,
PRIMARY KEY (CST_IDNO,EXP_NO),
FOREIGN KEY (CST_IDNO) REFERENCES Consultants(CST_IDNO) ,
FOREIGN KEY (EXP_NO) REFERENCES expertise_details(EXP_NO));/*columns: consultant id, consultant experties number;
each column is a foreign key and the combination of the two columns is the primary key*/
INSERT INTO consultants_expertise/*with sub-queries to import the details from the existing tables*/
VALUES ((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='MICHALE'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Engineering consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='MICHALE'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='IT consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Carlos'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Educational consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Enric'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Performance consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Enric'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Business transformation consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Jhon'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Sales consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Jhon'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Process consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Joseph'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Process consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Joseph'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='IT consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Emily'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Engineering consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Petr'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Sales consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Henry'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Process consultant')),
((SELECT CST_IDNO FROM Consultants WHERE CST_FNAME='Henry'),(SELECT EXP_NO FROM expertise_details WHERE EXP_NAME='Educational consultant'));