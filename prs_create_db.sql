-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create user table
CREATE TABLE user (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  UserName      VARCHAR(20)    NOT NULL,
  Password		VARCHAR(10)    NOT NULL,
  FirstName		VARCHAR(20)    NOT NULL,
  LastName		VARCHAR(20)	   NOT NULL,
  PhoneNumber	VARCHAR(12)	   NOT NULL,
  Email			VARCHAR(75)	   NOT NULL,
  IsReviewer	TinyInt(1)	   NOT NULL,
  IsAdmin		TinyInt(1)	   NOT NULL,
  IsActive		TinyInt(1)	   NOT NULL,
  DateCreated	DATETIME	   NOT NULL,
  DateUpdated	DATETIME	   NOT NULL,
  UpdatedByUser	INT			   NOT NULL,
  
  CONSTRAINT uname unique (Username)
);

-- create vendor table
CREATE TABLE vendor (
  ID				INT            PRIMARY KEY  AUTO_INCREMENT,
  Code      		VARCHAR(10)    NOT NULL,
  Name				VARCHAR(255)   NOT NULL,
  Address			VARCHAR(255)   NOT NULL,
  City				VARCHAR(255)   NOT NULL,
  State				VARCHAR(2)	   NOT NULL,
  Zip				VARCHAR(5)	   NOT NULL,
  PhoneNumber		VARCHAR(12)    NOT NULL,
  Email				VARCHAR(100)   NOT NULL,
  IsPreApproved		TinyInt(1)	   NOT NULL,
  IsActive			TinyInt(1)	   NOT NULL,
  DateCreated		DATETIME	   NOT NULL,
  DateUpdated		DATETIME	   NOT NULL,
  UpdatedByUser		INT			   NOT NULL,
  
  CONSTRAINT vcode unique (Code)
  );

-- create purchaserequest table
CREATE TABLE purchaserequest (
  ID					INT            PRIMARY KEY  AUTO_INCREMENT,
  UserID      			INT    		   NOT NULL,
  Description			VARCHAR(100)   NOT NULL,
  Justification			VARCHAR(255)   NOT NULL,
  DateNeeded			DATE	   	   NOT NULL,
  DeliveryMode			VARCHAR(25)	   NOT NULL,
  Status				VARCHAR(20)	   NOT NULL,
  Total					DECIMAL(10,2)  NOT NULL,
  SubmittedDate			DATETIME,	   
  IsActive				TinyInt(1)	   NOT NULL,
  ReasonForRejection	VARCHAR(100)   NOT NULL,
  DateCreated			DATETIME	   NOT NULL,
  DateUpdated			DATETIME	   NOT NULL,
  UpdatedByUser			INT			   NOT NULL,
  
  Foreign Key (UserID) references user(ID)
  );

-- create product table
CREATE TABLE product (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  VendorID      INT    		   NOT NULL,
  PartNumber	VARCHAR(50)    NOT NULL,
  Name			VARCHAR(150)   NOT NULL,
  Price			DECIMAL(10,2)  NOT NULL,
  Unit			VARCHAR(255),
  PhotoPath		VARCHAR(255),
  IsActive		TinyInt(1)	   NOT NULL,
  DateCreated	DATETIME	   NOT NULL,
  DateUpdated	DATETIME	   NOT NULL,
  UpdatedByUser	INT			   NOT NULL,
  
  Foreign Key (VendorID) references vendor(ID),
  CONSTRAINT vendor_part unique (VendorID, PartNumber)
  );
  
-- create purchaserequestlineitem table
CREATE TABLE purchaserequestlineitem (
  ID					INT    		PRIMARY KEY  AUTO_INCREMENT,
  PurchaseRequestID     INT    		NOT NULL,
  ProductID				INT    		NOT NULL,
  Quantity				INT	   		NOT NULL,
  IsActive				TinyInt(1)	NOT NULL,
  DateCreated			DATETIME	NOT NULL,
  DateUpdated			DATETIME	NOT NULL,
  UpdatedByUser			INT			NOT NULL,
  
  Foreign Key (ProductID) references product(ID),
  Foreign Key (PurchaseRequestID) references purchaserequest(ID),
  CONSTRAINT req_pdt unique (PurchaseRequestID, ProductID)
);
