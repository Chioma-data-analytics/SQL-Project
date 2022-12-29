use master

create Database ShopEasy
go

Create Schema Items
go

Create table Items.ProductCategory
(
CategoryID int identity (7,1) primary key,
CategoryName varchar(30),
CategoryDescription varchar(30)
)

select * from Items.ProductCategory

ALTER Table Items.ProductCategory
ADD CONSTRAINT rfkcPurchaseOrderID foreign key(PurchaseOrderID)
REFERENCES Transactions.OrderDetails(PurchaseOrderID);


Insert into Items.ProductCategory
Values(1, 'Household', 'Furnitures and fitting'),
(2, 'Sports', 'JerseynBoots'),
(3, 'Accessories', 'BanglesnAnklets'),
(4, 'Clothing','Formal wears'); 

select * from Items.ProductCategory
go

Create Schema Supplier
go

Create Table Supplier.SuppliersDetails
(
SupplierID int identity (10,1) primary key,
FirstName varchar(30),
LastName varchar(30),
Office_Address varchar(60),
Phone_Number varchar(30),
Country varchar(50)
)

select * from Supplier.SuppliersDetails

Insert into Supplier.SuppliersDetails
Values('Tobi', 'Ademeji', '12 Aji Street Lagos', '09-678-5467-333-223', 'Nigeria'),
('Onyemaeke', 'Okparaobi', '54 Accra Street Ibadan', '01-234-9846-221-112', 'Nigeria'),
('Dauda', 'Kafanchaga', '3 Kantagora street Kebbi', '02-671-9977-288-098', 'Nigeria'),
('Effiong', 'Samuelson', '6 Dame street Bayelsa', '89-567-9346-126-768', 'Nigeria'),
('Makral', 'Jamal', '16 Mush Street Coal City', '07-971-5467-323-173', 'Nigeria'),
('Emem', 'Kakachi', '3 Kantabu street Kebbi', '01-681-9077-218-038', 'Nigeria'),
('Addo', 'Okech', '10 Obi street Kano', '23-381-0011-227-443', 'Nigeria');


--Delete from Supplier.SuppliersDetails
---Delete from Supplier.SuppliersDetails(Deletes all row)
---where SupplierID = (condition deletes a particular row specified)


--Alter Table Supplier.SuppliersDetails
--drop Column .......

--Alter Table Supplier.SuppliersDetails
--Add Phone_Number varchar(15)


--Update Supplier.SuppliersDetails
--set Phone_Number = 89-567-9346-126-768
--where SupplierID = 13;


(--i used the above statement to insert values in phone numbers columns after deleting them
(---as i couldnt drop the main table because of the foreign key.... what is another alternative?)

select * from supplier.SuppliersDetails





Create Table Items.ItemDetails
(
ItemID int identity (1,2) primary key, 
CategoryID int,
SupplierID int,
Item_Name varchar(50) not null,
Item_Description varchar(50) not null,
Unit_Price int,
Qty_in_Hand int,
Reorder_Level int,
Reorder_Qty int
)

Insert into items.ItemDetails Values(7, 10, 'Noodles', 'Indomie chicken', 500, 3, 4, 5)
Insert into items.ItemDetails Values(8, 11, 'Strawberry', 'mix combo', 700, 4, 4, 5)
Insert into items.ItemDetails Values(9, 12, 'Umbrella', 'WhiteColour(small)', 1500, 7, 8, 7)
Insert into items.ItemDetails Values(10,13, 'Shoes', 'Adult size 45', 7200, 5, 4, 5)

ALTER Table [Items].[ItemDetails]
ADD CONSTRAINT rfkcCategoryID foreign key(CategoryID)
REFERENCES Items.ProductCategory(CategoryID);

ALTER Table [Items].[ItemDetails]
ADD CONSTRAINT rfkcSupplierID foreign key(SupplierID)
REFERENCES Supplier.SuppliersDetails(SupplierID);
go


Create Schema Transactions
go

Create Table Transactions.OrderDetails
(
PurchaseOrderID int identity (1,1) primary key,
EmployeeID int,
OrderDate date,
RecevingDate date,
ItemID int,
QtyOrdered int, 
QtyReceived int,
UnitPrice int,
ShipmentMethod varchar(30),
OrderStatus varchar(30)
)

ALTER Table Transactions.OrderDetails
ADD CONSTRAINT rfkcItemID foreign key(ItemID)
REFERENCES Items.ItemDetails(ItemID);

ALTER Table Transactions.OrderDetails
ADD CONSTRAINT rfkcEmployeeID foreign key(EmployeeID)
REFERENCES Humanresources.Employee(EmployeeID);

Insert into Transactions.OrderDetails Values(1, '3/2/2020', '4/8/2020', 1, 50, 48, 1500, 'Freight', 'intransit'),
Insert into Transactions.OrderDetails Values(2, '4/4/2020', '8/9/2020', 3, 20, 19, 700, 'Train', 'Received'),
Insert into Transactions.OrderDetails Values(3, '1/1/2021', '5/2/2021', 5, 35, 27, 2800, 'Air', 'Intransit'),
Insert into Transactions.OrderDetails Values(4, '9/2/2021', '6/8/2021', 7, 50, 35, 500, 'Train', 'Received');


select * from Transactions.OrderDetails
go






Create Schema Humanresources
go

Create Table Humanresources.Employee
(
EmployeeID int identity (1,1) primary key,
FirstName varchar(30),
LastName varchar (30),
City varchar(30),
PhoneNumber nvarchar(30)
)


Insert into Humanresources.Employee
Values('Abbey', 'Danielson', 'New York', '10-445-5559-345-096'),
('Ongar', 'Paulson', 'Miami', '94-890-8894-112-238'),
('Mark', 'Oladodo', 'Maldives', '98-123-8905-989-234'),
('Adesuto', 'Okoromadu', 'Eko city', '44-899-5829-489-098');

select * from Humanresources.Employee


---CREATING INDEXES








Select * from Items.ItemDetails
select * from Transactions.OrderDetails
select * from Supplier.SuppliersDetails
select * from Items.ProductCategory
Select * from Humanresources.employee


(--foreign key (CategoryID) references Items.ItemDetails (ItemID))
(--foreign key (SupplierID) references Items.ItemDetails (ItemID))
(--still correct the phonenumber column in Supplier.SuppliersDetails Table without deleting the table)
