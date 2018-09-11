-- create and select the database
DROP DATABASE IF EXISTS textbooks;
CREATE DATABASE textbooks;
USE textbooks;

-- create products table
CREATE TABLE Products (
ID			INT				PRIMARY KEY		AUTO_INCREMENT,
Textbook	VARCHAR(50)		NOT NULL,
Price		DECIMAL(10,2)	NOT NULL
);

-- insert products
INSERT INTO Products VALUES
(1, 'Fluid Dynamics', 250),
(2, 'Thermodynamics', 300),
(3, 'Calculus 3', 185);

-- create buyer information table
CREATE TABLE BuyerInformation (
ID			INT				PRIMARY KEY		AUTO_INCREMENT,
Textbook	VARCHAR(50)		NOT NULL,
Buyer		VARCHAR(50)		NOT NULL,
ProductID	INT				NOT NULL
FOREIGN KEY (Textbooks) REFERENCES Products(ID)
);

-- insert buyer information
INSERT INTO BuyerInformation VALUES
(1, 'Thermodynamics', 'Rachael Baumann', 2),
(2, 'Thermodynamics', 'John Falconer', 2),
(3, 'Calculus 3', 'Neil Hendren', 3);

-- create invoice table
CREATE TABLE Invoice (
ID				INT				PRIMARY KEY		AUTO_INCREMENT,
Textbook		VARCHAR(50)		NOT NULL,
OrderNumber		INT				NOT NULL,
ProductID		INT				NOT NULL,
FOREIGN KEY (Textbooks) REFERENCES Products(ID)
);

-- insert invoice
INSERT INTO Invoice VALUES
(1, 'Fluid Dynamics', 123, 1),
(2, 'Thermodynamics', 456, 2),
(3, 'Fluid Dynamics', 789, 1);

