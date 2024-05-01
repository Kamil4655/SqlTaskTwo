--USE KAMIL


CREATE TABLE Roles(
Id INT PRIMARY KEY,
Name NVARCHAR(40)NOT NULL
)

CREATE TABLE Users (
Id INT PRIMARY KEY,
Username NVARCHAR(20)NOT NULL,
Password NVARCHAR(10)NOT NULL,
RolesId INT FOREIGN KEY REFERENCES Roles(Id)
)

INSERT INTO Roles 
VALUES
(1,'Admin'),
(2,'Moderator'),
(3,'User')

INSERT INTO Users 
VALUES (1,'AdminName','AdminPass',1),
(2,'ModeratorName','ModeratorP',2),
(3,'UserName','UserPass',3)

SELECT * FROM Users as u
INNER JOIN Roles as r 
ON u.RolesId=r.Id

---------------------------------------------------------------------------------------------------------------
--Task2

CREATE TABLE Categories 
(
 Id INT PRIMARY KEY,
 Name VARCHAR(40)
)

CREATE TABLE Sizes
(
Id INT PRIMARY KEY,
Name VARCHAR(40)
)

CREATE TABLE Products
(
Id INT  PRIMARY KEY,
Name NVARCHAR(20) NOT NULL,
Price Decimal (6,2),
Cost Decimal(6,2),
CategoryId Int REFERENCES Categories(Id)
)

--DROP TABLE Products


CREATE TABLE ProductSizes 
(
ProductId INT,
SizeId INT,
FOREIGN KEY (ProductId) REFERENCES Products(Id),
FOREIGN KEY (SizeId) REFERENCES Sizes(Id),
PRIMARY KEY (ProductId, SizeId)
)

INSERT INTO Categories VALUES
(1, 'Cars'),(2, 'Phones'),(3, 'Tv')

INSERT INTO Sizes  VALUES(1,'Small'),(2, 'Middle'),(3, 'Big')

INSERT INTO Products VALUES
(1, 'Bmw', 500, 250,1),(2, 'Honor', 750, 400,2),(3, 'Lg', 150, 500,3)

INSERT INTO ProductSizes  (ProductId, SizeId) VALUES
(1, 3), 
(2, 1), 
(2, 2), 
(2, 3), 
(3, 1),
(3, 2),
(3, 3)

SELECT p.Name AS ProductName, c.Name AS CategoryName, s.Name AS SizeName
FROM Products p
INNER JOIN Categories as c ON p.CategoryId = c.Id
INNER JOIN ProductSizes as ps ON p.Id = ps.ProductId
INNER JOIN Sizes as s ON ps.SizeId = s.Id
