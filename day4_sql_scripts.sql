INSERT INTO Accounts VALUES
 (53,'Ron Swanson',325000,10);

INSERT INTO Accounts VALUES
 (54,'Michael Scott',150000,20);
 
INSERT INTO Accounts VALUES
 (55, 'Jimi Hendrix', 580000, 0);
 
INSERT INTO Accounts VALUES
 (56, 'Jeffery Lebowski', 1000000, 90);
 
INSERT INTO Accounts VALUES
 (57, 'Larry David', 475000, 100);
 
INSERT INTO Accounts VALUES
 (58, 'Cosmo Kremer', 624000, 0);
 
INSERT INTO Accounts VALUES
 (59, 'George Costanza', 832000, 900);
 
INSERT INTO Accounts VALUES
 (60, 'Dwight K Schrute', 400000, 50);

INSERT INTO Accounts VALUES
 (61, 'Barack Obama', 2500000, 120);

INSERT INTO Accounts VALUES
 (62, 'Michael Jordan', 3400000, 0);
 
INSERT INTO Accounts VALUES
 (63, 'Barry Larkin', 100000, 80);
 
UPDATE Accounts
 SET AccountHolder = 'Dwight Schrute'
 WHERE ID = 60;
 
DELETE FROM Accounts 
 WHERE ID = 54;