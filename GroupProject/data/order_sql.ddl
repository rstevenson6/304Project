DROP TABLE Cart;
DROP TABLE OrderedPart;
DROP TABLE Part;
DROP TABLE Orders;
DROP TABLE CustomerReview;
DROP TABLE Warehouse;
DROP TABLE Customer;
DROP TABLE Company;
DROP TABLE PartCategory;



CREATE TABLE PartCategory (
catID INTEGER NOT NULL,
catName VARCHAR(20) NOT NULL,
PRIMARY KEY(catID)
);

CREATE TABLE Company (
companyID INTEGER NOT NULL,
companyName VARCHAR(20) NOT NULL,
PRIMARY KEY(companyID)
);

CREATE TABLE Part (
pID INTEGER NOT NULL,
photo VARCHAR(256),
pName VARCHAR(40) NOT NULL,
company VARCHAR(40) NOT NULL,
description VARCHAR(100),
price DECIMAL(10,2) NOT NULL,
pRating DECIMAL(5,2),
catID INTEGER,
compID INTEGER,
PRIMARY KEY(pID),
FOREIGN KEY(catID) REFERENCES PartCategory(catID)
	ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(compID) REFERENCES Company(companyID)
ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE Customer (
uID INTEGER NOT NULL,
password VARCHAR(30) NOT NULL,
firstName VARCHAR(20) NOT NULL,
lastName VARCHAR(20) NOT NULL,
email VARCHAR(40),
address VARCHAR(40),
city VARCHAR(20),
province VARCHAR(20),
zipCode VARCHAR(6),
PRIMARY KEY(uID)
);

CREATE TABLE Orders (
oID INTEGER NOT NULL IDENTITY PRIMARY KEY,
uID INTEGER NOT NULL,
oDate DATE,
totalPrice DECIMAL(10,2),
itemTotal INTEGER,
address VARCHAR(20),
city VARCHAR(20),
province VARCHAR(2),
zipCode VARCHAR(6),
FOREIGN KEY (uID) REFERENCES Customer(uID)
);

CREATE TABLE OrderedPart (
   oID       int	NOT NULL,
   pID       int	NOT NULL,
   quantity      int,
   price         decimal(9,2),
   PRIMARY KEY (oID, pID),
   FOREIGN KEY (oId) REFERENCES Orders (oId),
   FOREIGN KEY (pID) REFERENCES Part (pID)
);

CREATE TABLE Warehouse (
wID INTEGER NOT NULL,
address VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL,
province VARCHAR(2) NOT NULL,
zipcode VARCHAR(6),
PRIMARY KEY(wID)
);

CREATE TABLE CustomerReview (
rID INTEGER NOT NULL,
uID VARCHAR(20) NOT NULL,
pID INTEGER NOT NULL,
comment VARCHAR(100),
date DATE,
rating INTEGER NOT NULL,
PRIMARY KEY(uID, pID)
);



CREATE TABLE Cart (
Total INTEGER,
uID INTEGER,
pID INTEGER,
PRIMARY KEY(pID),
FOREIGN KEY (uID) REFERENCES Customer(uID),
FOREIGN KEY (pID) REFERENCES Part(pID)
);

INSERT INTO PartCategory VALUES (1, 'Hard Drives');
INSERT INTO PartCategory VALUES (2, 'RAM');
INSERT INTO PartCategory VALUES (3, 'Mice');
INSERT INTO PartCategory VALUES (4, 'Keyboards');
INSERT INTO PartCategory VALUES (5, 'Monitors');
INSERT INTO PartCategory VALUES (6, 'Laptops');

INSERT INTO Company VALUES (1, 'Intel');
INSERT INTO Company VALUES (2, 'Nvidia');
INSERT INTO Company VALUES (3, 'Logitech');
INSERT INTO Company VALUES (4, 'Lenovo');
INSERT INTO Company VALUES (5, 'Dell')
INSERT INTO Company VALUES (6, 'LG');
INSERT INTO Company VALUES (7, 'Acer');
INSERT INTO Company VALUES (8, 'ASUS');


INSERT INTO Part VALUES(1,'<img src="">','500GB Hard Drive','Intel','500gb HDD 5400rpm',50.00, 0, 1, 1);
INSERT INTO Part VALUES(2,'<img src="">','1TB Hard Drive','Intel','1tb HDD 7200rpm',100.00, 0, 1, 1);
INSERT INTO Part VALUES(3,'<img src="">','128GB Solid State Drive','Intel','128gb SSD',150.00, 0, 1, 1);
INSERT INTO Part VALUES(4,'<img src="">','8GB RAM','NVidia','8 GB RAM stick',50.00, 0, 2, 2);
INSERT INTO Part VALUES(5,'<img src="">','16GB RAM','Intel','16gb RAM stick',75.00, 0, 2, 1);
INSERT INTO Part VALUES(6,'<img src="">','Gaming Mouse','Logitech','A real nice Mouse',25.00, 0, 3, 3);
INSERT INTO Part VALUES(7,'<img src="">','Keyboard','Logitech','A real nice keyboard',25.00, 0, 4, 3);
INSERT INTO Part VALUES(8,'<img src="">','HD Monitor','LG','1080px LED monitor',250.00, 0, 5, 6);
INSERT INTO Part VALUES(9,'<img src="">','ThinkPad','Lenovo','500gb HDD 4GB RAM, 1080p, 1.8ghz I-3 Core',750.00, 0, 6, 4);
INSERT INTO Part VALUES(10,'<img src="">','Insperion','Dell','750gb HDD 8GB RAM, 1080p, 2.6ghz I-5 Core',1000.00, 0, 6, 5);
INSERT INTO Part VALUES(11,'<img src="">','Aspire','Acer','128gb SDD 4GB RAM, 1080p, 2.2ghz I-5 Core',900.00, 0, 6, 7);
INSERT INTO Part VALUES(12,'<img src="">','Zenbook','ASUS','500gb HDD 8GB RAM, 1080p, 2.8ghz I-7 Core',1100.00, 0, 6, 8);

INSERT INTO Customer VALUES ( 0, 'Admin', 'Team', 'NeXt', 'admin@NeXt.ca', '935 Academy Way', 'Kelowna', 'BC', 'V1V4C9');
INSERT INTO Customer VALUES ( 1, 'Walrus', 'Ross', 'Stevenson','rstevenson@anywhere.com', '103 AnyWhere Street', 'Kelowna', 'BC', 'HOHOHO');
INSERT INTO Customer VALUES ( 2, 'Goofball', 'Max', 'Marchand','mmarchand@anywhere.com', '5 EX drive', 'Kelowna', 'BC', 'I5UCKD');
INSERT INTO Customer VALUES ( 3, 'Poland', 'Daniel', 'Kandie','kandieman@anywhere.com', '420 Yellow Brick Road', 'Kelowna', 'BC', '694TWZ');
INSERT INTO Customer VALUES ( 4, 'Helocopter', 'Ashton', 'Rasmuson','ADawg@anywhere.com', '7 Evergreen Terrace', 'Springfield', 'BC', '789WTF');

INSERT INTO Warehouse VALUES (1, '123 elm street', 'Vancouver', 'BC', 'V7W3JS');
INSERT INTO Warehouse VALUES (2, '456 Bark avenue', 'Calgary', 'AB', 'C0WM00');
INSERT INTO Warehouse VALUES (3, '789 Oak Road', 'Toronto', 'ON', 'L34F3Z');



