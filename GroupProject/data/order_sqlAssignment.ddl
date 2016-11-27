DROP TABLE OrderedProduct;
DROP TABLE Orders;
DROP TABLE Product;
DROP TABLE Customer;

CREATE TABLE Product (
   productId	int NOT NULL,
   productName	varchar(50),
   categoryName	varchar(50),
   packageDesc	varchar(50),
   price	decimal(9,2),
   PRIMARY KEY (ProductId)
);


CREATE TABLE Customer (
   customerId 	int NOT NULL PRIMARY KEY,
   password	VARCHAR(20) NOT NULL,
   cname 	VARCHAR(50) NOT NULL,
   street 	VARCHAR(50),
   city 	VARCHAR(20),
   state 	VARCHAR(2),
   zipcode 	VARCHAR(10),
   phone 	VARCHAR(10),
   email 	VARCHAR(30) NOT NULL
);


CREATE TABLE Orders (
   orderId 	int 	NOT NULL IDENTITY PRIMARY KEY,
   customerId 	int,
   totalAmount 	decimal(9,2)
   CONSTRAINT FK_Orders_Customer FOREIGN KEY (customerId) REFERENCES customer(customerId)
);


CREATE TABLE OrderedProduct (
   orderId       int	NOT NULL,
   productId     int	NOT NULL,
   quantity      int,
   price         decimal(9,2),
   PRIMARY KEY (OrderId, ProductId),
   CONSTRAINT FK_OrderedProduct_Order FOREIGN KEY (OrderId) REFERENCES Orders (OrderId),
   CONSTRAINT FK_OrderedProduct_Product FOREIGN KEY (ProductId) REFERENCES Product (ProductId)
);

INSERT Product VALUES(1,'Chai','Beverages','10 boxes x 20 bags',18.00);
INSERT Product VALUES(2,'Chang','Beverages','24 - 12 oz bottles',19.00);
INSERT Product VALUES(3,'Aniseed Syrup','Condiments','12 - 550 ml bottles',10.00);
INSERT Product VALUES(4,'Chef Anton''s Cajun Seasoning','Condiments','48 - 6 oz jars',22.00);
INSERT Product VALUES(5,'Chef Anton''s Gumbo Mix','Condiments','36 boxes',21.35);
INSERT Product VALUES(6,'Grandma''s Boysenberry Spread','Condiments','12 - 8 oz jars',25.00);
INSERT Product VALUES(7,'Uncle Bob''s Organic Dried Pears','Produce','12 - 1 lb pkgs.',30.00);
INSERT Product VALUES(8,'Northwoods Cranberry Sauce','Condiments','12 - 12 oz jars',40.00);
INSERT Product VALUES(9,'Mishi Kobe Niku','Meat/Poultry','18 - 500 g pkgs.',97.00);
INSERT Product VALUES(10,'Ikura','Seafood','12 - 200 ml jars',31.00);
INSERT Product VALUES(11,'Queso Cabrales','Dairy Products','1 kg pkg.',21.00);
INSERT Product VALUES(12,'Queso Manchego La Pastora','Dairy Products','10 - 500 g pkgs.',38.00);
INSERT Product VALUES(13,'Konbu','Seafood','2 kg box',6.00);
INSERT Product VALUES(14,'Tofu','Produce','40 - 100 g pkgs.',23.25);
INSERT Product VALUES(15,'Genen Shouyu','Condiments','24 - 250 ml bottles',15.50);
INSERT Product VALUES(16,'Pavlova','Confections','32 - 500 g boxes',17.45);
INSERT Product VALUES(17,'Alice Mutton','Meat/Poultry','20 - 1 kg tins',39.00);
INSERT Product VALUES(18,'Carnarvon Tigers','Seafood','16 kg pkg.',62.50);
INSERT Product VALUES(19,'Teatime Chocolate Biscuits','Confections','10 boxes x 12 pieces',9.20);
INSERT Product VALUES(20,'Sir Rodney''s Marmalade','Confections','30 gift boxes',81.00);
INSERT Product VALUES(21,'Sir Rodney''s Scones','Confections','24 pkgs. x 4 pieces',10.00);
INSERT Product VALUES(22,'Gustaf''s Knäckebröd','Grains/Cereals','24 - 500 g pkgs.',21.00);
INSERT Product VALUES(23,'Tunnbröd','Grains/Cereals','12 - 250 g pkgs.',9.00);
INSERT Product VALUES(24,'Guaraná Fantástica','Beverages','12 - 355 ml cans',4.50);
INSERT Product VALUES(25,'NuNuCa Nuß-Nougat-Creme','Confections','20 - 450 g glasses',14.00);
INSERT Product VALUES(26,'Gumbär Gummibärchen','Confections','100 - 250 g bags',31.23);
INSERT Product VALUES(27,'Schoggi Schokolade','Confections','100 - 100 g pieces',43.90);
INSERT Product VALUES(28,'Rössle Sauerkraut','Produce','25 - 825 g cans',45.60);
INSERT Product VALUES(29,'Thüringer Rostbratwurst','Meat/Poultry','50 bags x 30 sausgs.',123.79);
INSERT Product VALUES(30,'Nord-Ost Matjeshering','Seafood','10 - 200 g glasses',25.89);
INSERT Product VALUES(31,'Gorgonzola Telino','Dairy Products','12 - 100 g pkgs',12.50);
INSERT Product VALUES(32,'Mascarpone Fabioli','Dairy Products','24 - 200 g pkgs.',32.00);
INSERT Product VALUES(33,'Geitost','Dairy Products','500 g',2.50);
INSERT Product VALUES(34,'Sasquatch Ale','Beverages','24 - 12 oz bottles',14.00);
INSERT Product VALUES(35,'Steeleye Stout','Beverages','24 - 12 oz bottles',18.00);
INSERT Product VALUES(36,'Inlagd Sill','Seafood','24 - 250 g  jars',19.00);
INSERT Product VALUES(37,'Gravad lax','Seafood','12 - 500 g pkgs.',26.00);
INSERT Product VALUES(38,'Côte de Blaye','Beverages','12 - 75 cl bottles',263.50);
INSERT Product VALUES(39,'Chartreuse verte','Beverages','750 cc per bottle',18.00);
INSERT Product VALUES(40,'Boston Crab Meat','Seafood','24 - 4 oz tins',18.40);
INSERT Product VALUES(41,'Jack''s New England Clam Chowder','Seafood','12 - 12 oz cans',9.65);
INSERT Product VALUES(42,'Singaporean Hokkien Fried Mee','Grains/Cereals','32 - 1 kg pkgs.',14.00);
INSERT Product VALUES(43,'Ipoh Coffee','Beverages','16 - 500 g tins',46.00);
INSERT Product VALUES(44,'Gula Malacca','Condiments','20 - 2 kg bags',19.45);
INSERT Product VALUES(45,'Røgede sild','Seafood','1k pkg.',9.50);
INSERT Product VALUES(46,'Spegesild','Seafood','4 - 450 g glasses',12.00);
INSERT Product VALUES(47,'Zaanse koeken','Confections','10 - 4 oz boxes',9.50);
INSERT Product VALUES(48,'Chocolade','Confections','10 pkgs.',12.75);
INSERT Product VALUES(49,'Maxilaku','Confections','24 - 50 g pkgs.',20.00);
INSERT Product VALUES(50,'Valkoinen suklaa','Confections','12 - 100 g bars',16.25);
INSERT Product VALUES(51,'Manjimup Dried Apples','Produce','50 - 300 g pkgs.',53.00);
INSERT Product VALUES(52,'Filo Mix','Grains/Cereals','16 - 2 kg boxes',7.00);
INSERT Product VALUES(53,'Perth Pasties','Meat/Poultry','48 pieces',32.80);
INSERT Product VALUES(54,'Tourtière','Meat/Poultry','16 pies',7.45);
INSERT Product VALUES(55,'Pâté chinois','Meat/Poultry','24 boxes x 2 pies',24.00);
INSERT Product VALUES(56,'Gnocchi di nonna Alice','Grains/Cereals','24 - 250 g pkgs.',38.00);
INSERT Product VALUES(57,'Ravioli Angelo','Grains/Cereals','24 - 250 g pkgs.',19.50);
INSERT Product VALUES(58,'Escargots de Bourgogne','Seafood','24 pieces',13.25);
INSERT Product VALUES(59,'Raclette Courdavault','Dairy Products','5 kg pkg.',55.00);
INSERT Product VALUES(60,'Camembert Pierrot','Dairy Products','15 - 300 g rounds',34.00);
INSERT Product VALUES(61,'Sirop d''érable','Condiments','24 - 500 ml bottles',28.50);
INSERT Product VALUES(62,'Tarte au sucre','Confections','48 pies',49.30);
INSERT Product VALUES(63,'Vegie-spread','Condiments','15 - 625 g jars',43.90);
INSERT Product VALUES(64,'Wimmers gute Semmelknödel','Grains/Cereals','20 bags x 4 pieces',33.25);
INSERT Product VALUES(65,'Louisiana Fiery Hot Pepper Sauce','Condiments','32 - 8 oz bottles',21.05);
INSERT Product VALUES(66,'Louisiana Hot Spiced Okra','Condiments','24 - 8 oz jars',17.00);
INSERT Product VALUES(67,'Laughing Lumberjack Lager','Beverages','24 - 12 oz bottles',14.00);
INSERT Product VALUES(68,'Scottish Longbreads','Confections','10 boxes x 8 pieces',12.50);
INSERT Product VALUES(69,'Gudbrandsdalsost','Dairy Products','10 kg pkg.',36.00);
INSERT Product VALUES(70,'Outback Lager','Beverages','24 - 355 ml bottles',15.00);
INSERT Product VALUES(71,'Fløtemysost','Dairy Products','10 - 500 g pkgs.',21.50);
INSERT Product VALUES(72,'Mozzarella di Giovanni','Dairy Products','24 - 200 g pkgs.',34.80);
INSERT Product VALUES(73,'Röd Kaviar','Seafood','24 - 150 g jars',15.00);
INSERT Product VALUES(74,'Longlife Tofu','Produce','5 kg pkg.',10.00);
INSERT Product VALUES(75,'Rhönbräu Klosterbier','Beverages','24 - 0.5 l bottles',7.75);
INSERT Product VALUES(76,'Lakkalikööri','Beverages','500 ml',18.00);
INSERT Product VALUES(77,'Original Frankfurter grüne Soße','Condiments','12 boxes',13.00);

INSERT INTO Customer VALUES ( 1, 'password1', 'A. Anderson', '103 AnyWhere Street', 'Alabtraz', 'AL', '11111' ,'1234567890','aanderson@anywhere.com' );
INSERT INTO Customer VALUES ( 2, 'badpass', 'B. Brown', '222 Bush Avenue', 'Boston', 'MA', '22222','2224449999','bbrown@bigcompany.com' );
INSERT INTO Customer VALUES ( 3, 'AxBC12', 'C. Cole', '333 Central Crescent', 'Chicago', 'IL', '33333','3334445555','cole@charity.org' );
INSERT INTO Customer VALUES ( 4, '1234abc', 'D. Doe', '444 Dover Lane', 'Detroit', 'MI', '44444','4445556666','doe@doe.com' );
INSERT INTO Customer VALUES ( 5, 'ABCD1245', 'E. Elliott', '555 Everwood Street', 'Engliston', 'IA', '55555' ,'5556667777', 'engel@uiowa.edu');

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (1,137.89)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,10,1,31)
INSERT INTO OrderedProduct VALUES (@orderId,20,1,81)
INSERT INTO OrderedProduct VALUES (@orderId,30,1,25.89);

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (2,47)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,1,2,18)
INSERT INTO OrderedProduct VALUES (@orderId,2,3,19)
INSERT INTO OrderedProduct VALUES (@orderId,3,4,10);

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (3,106.75)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,5,5,21.35);

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (4,140)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,6,2,25)
INSERT INTO OrderedProduct VALUES (@orderId,7,3,30);

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (5, 2059.9)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,8,3,40)
INSERT INTO OrderedProduct VALUES (@orderId,18,2,62.5)
INSERT INTO OrderedProduct VALUES (@orderId,28,4,45.6)
INSERT INTO OrderedProduct VALUES (@orderId,38,6,263.5)
INSERT INTO OrderedProduct VALUES (@orderId,48,3,12.75)
INSERT INTO OrderedProduct VALUES (@orderId,58,1,13.25);

DECLARE @orderId int
INSERT INTO Orders (customerId, totalAmount) VALUES (1, 274.45)
SELECT @orderId = @@IDENTITY
INSERT INTO OrderedProduct VALUES (@orderId,50,1,16.25)
INSERT INTO OrderedProduct VALUES (@orderId,51,2,53)
INSERT INTO OrderedProduct VALUES (@orderId,52,3,7)
INSERT INTO OrderedProduct VALUES (@orderId,53,4,32.80);

