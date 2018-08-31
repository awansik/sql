-- create and select the database
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

-- create the accounts table
CREATE TABLE accounts (
  ID            INT            PRIMARY KEY  AUTO_INCREMENT,
  AccountHolder VARCHAR(25)    NOT NULL,
  Balance       DECIMAL(10,2)  NOT NULL,
  Fees          DECIMAL(10,2)  NOT NULL
);

CREATE TABLE transactions (
  ID            INT            PRIMARY KEY  AUTO_INCREMENT,
  Amount        DECIMAL(25)    NOT NULL,
  TxnType       VARCHAR(255)   NOT NULL,
  AccountID     INT  NOT NULL,
  Foreign Key (AccountID) references Accounts(ID)
);

-- insert some rows into the accounts table
INSERT INTO Accounts VALUES
(1, 'Rachael Baumann', '8888.00', '250.00'),
(2, 'Michael Page', '5444.00', '175.00'),
(3, 'Angie Snyder', '3333.00', '88.00'),
(4, 'Robert Mahoney', '3322.00', '88.00');

INSERT INTO Transactions VALUES
(1, '500.00', 'Deposit', '3'),
(2, '200.00', 'Withdrawl', '4'),
(3, '200.00', 'Deposit', '4'),
(4, '248.00', 'Deposit', '1');

-- create a user and grant privileges to that user
GRANT SELECT, INSERT, DELETE, UPDATE
ON bank_db.*
TO mma_user@localhost
IDENTIFIED BY 'sesame';