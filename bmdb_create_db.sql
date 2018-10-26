-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table bmdb.Movie (
ID integer primary key auto_increment,
Title varchar(255) not null unique,
Year integer not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table bmdb.Actor (
ID integer primary key auto_increment,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Gender varchar(1) not null,
BirthDate date not null,
CONSTRAINT fname_lname unique (FirstName, LastName)
);

-- create Credits table
Create table bmdb.Credits (
ID integer primary key auto_increment,
ActorID integer not null,
MovieID integer not null,
CharacterName varchar(255),

Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie VALUES
 	(1, 'Revenge of the Nerds', 1984),
 	(2, 'Avengers Infinity War', 2018),
    (3, 'The Big Lebowski', 1998),
    (4, 'Pulp Fiction', 1994),
    (5, 'Mad Max: Fury Road', 2015),
    (6, 'Fight Club', 1999),
    (7, 'The Dark Knight', 2008),
    (8, 'Taxi Driver', 1976),
    (9, 'Inglorious Basterds', 2009),
    (10, 'The Prestige', 2006),
    (11, 'No Country for Old Men', 2007),
    (12, 'Superbad', 2007);
    
-- Add some movies
 insert into Actor VALUES
 	(1, 'Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
    (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
 	(4, 'Robert', 'Carradine', 'M', '1954-3-24'),
 	(5, 'Anthony', 'Edwards', 'M', '1962-7-19'),
    (6, 'Jeff', 'Bridges', 'M', '1949-12-04'),
    (7, 'John', 'Goodman', 'M', '1952-06-20'),
    (8, 'Bruce', 'Willis', 'M', '1955-03-19'),
    (9, 'Uma', 'Thurman', 'F', '1970-04-29'), 
    (10, 'Tom', 'Hardy', 'M', '1977-09-15'),
    (11, 'Charlize', 'Theron', 'F', '1975-08-07'),
    (12, 'Brad', 'Pitt', 'M', '1963-12-18'),
    (13, 'Edward', 'Norton', 'M', '1969-08-18'),
    (14, 'Christian', 'Bale', 'M', '1974-01-30'),
    (15, 'Heath', 'Ledger', 'M', '1979-04-04'),
    (16, 'Robert', 'De Niro', 'M', '1943-08-17'),
    (17, 'Jodie', 'Foster', 'F', '1962-11-19'),
    (18, 'Christoph', 'Waltz', 'M', '1956-10-04'),
    (19, 'Hugh', 'Jackman', 'M', '1968-10-12'),
    (20, 'Josh', 'Brolin', 'M', '1968-02-12'),
    (21, 'Javier', 'Bardem', 'M', '1969-03-01'),
    (22, 'Jonah', 'Hill', 'M', '1983-12-20'),
    (23, 'Emma', 'Stone', 'F', '1988-11-06');
    
    
-- Add movie credits for actors
 insert into Credits (ActorID, MovieID, CharacterName) VALUES
 	(1, 2, 'Tony Stark - Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
    (6, 3, 'The Dude'),
    (7, 3, 'Walter Sobchak'),
    (8, 4, 'Butch Coolidge'),
    (9, 4, 'Mia Wallace'),
    (10, 5, 'Max Rockatansky'),
    (11, 5, 'Imperator Furiosa'),
    (12, 6, 'Tyler Durden'),
    (13, 6, 'The Narrator'),
    (14, 7, 'Bruce Wayne - Batman'),
    (15, 7, 'Joker'),
    (16, 8, 'Travis Bickle'),
    (17, 8, 'Iris'),
    (12, 9, 'Lt. Aldo Raine'),
    (18, 9, 'Col. Hans Landa'),
    (14, 10, 'Alfred Borden'),
    (19, 10, 'Robert Angier'),
    (20, 11, 'Llewelyn Moss'),
    (21, 11, 'Anton Chigurh'),
    (22, 12, 'Seth'),
    (23, 12, 'Jules');

-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;