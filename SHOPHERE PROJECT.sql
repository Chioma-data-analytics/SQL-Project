Use master
go


Create database SHOPHERE
on primary
(name='Shophere_primary',
filename=
'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shophere_prm.mdf',
size=4mb,
maxsize=10mb,
filegrowth=1mb),
filegroup Shophere_fg1
(name = 'Shophere_fg1_dat1',
filename =
'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shophere_fg1_1.ndf',
size = 1mb,
maxsize =10mb,
filegrowth = 1mb),
(name = 'Shophere_fg1_dat2',
filename =
'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shophere_fg1_2.ndf',
size = 1mb,
maxsize = 10mb,
filegrowth = 1mb)
log on
(name = 'Shophere_log',
filename =
'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shophere.ldf',
size = 1mb,
maxsize = 10mb,
filegrowth = 1mb) 
go


Alter Database [SHOPHERE]
Modify filegroup Shophere_fg1 Default
go

sp_helpdb [SHOPHERE]

use SHOPHERE
GO


---SCHEMA HELPS TO LOGICALLY GROUP ALL TABLES UNDER ONE QUALIFYING NAME SO IF ALL TABLES ARE GROUP
--under ONE THEN IT CAN BE EASY TO APPLY SECURITY PERMISSION FOR PROTECTING TABLES

Create Schema Items 
go

Create Schema Humanresources
go

Create Schema Transactions
go

Create Schema Supplier
go


Create table Items.ItemDetails 
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
foreign key (CategoryID) references Items.ItemDetails (ItemID),
foreign key (SupplierID) references Items.ItemDetails (ItemID)
)

select * from Items.ItemDetails
drop table Items.ItemDetails

Insert into items.ItemDetails
Values(1, 1, 'Noodles', 'Indomie chicken', 500, 3, 4, 5),
(3, 2, 'Strawberry', 'mix combo', 700, 4, 4, 5, null, null),
(5, 3, 'Umbrella', 'WhiteColour(small)', 1500, 7, 8, 7, null, null),
(7, 4, 'Shoes', 'Adult size 45', 7200, 5, 4, 5, null, null);



Create table Items.ProductCategory
(
CategoryID int identity (1,2) primary key,
CategoryName varchar(30),
CategoryDescription varchar(30)
)


Insert into Items.ProductCategory
Values('Household', 'Furnitures and fitting'),
('Sports', 'JerseynBoots'),
('Accessories', 'BanglesnAnklets'),
('Clothing','Formal wears'); 




Create Table Supplier.SuppliersDetails
(
SupplierID int identity (1,1) primary key,
FirstName varchar(30),
LastName varchar(30),
Office_Address varchar(60),
Phone_Number int,
Country varchar(50)
)

insert into Supplier.SuppliersDetails
Values('Tobi', 'Ademeji', '12 Aji Street Lagos', 09-678-5467-333-223, 'Nigeria'),
('Onyemaeke', 'Okparaobi', '54 Jumobi Accra Street Ibadan', 01-234-9846-221-112, 'Nigeria'),
('Dauda', 'Kafanchaga', '3 Kantagora Ahmed street Kebbi', 02-671-9977-288-098, 'Nigeria'),
('Effiong', 'Samuelson', '6 Dame street Bayelsa', 89-567-9346-126-768, 'Nigeria');



Create Table Humanresources.Employee
(
EmployeeID int identity (2,2) primary key,
FirstName varchar(30),
LastName varchar(30),
City varchar (30),
Phone int
)

insert into Humanresources.Employee
Values('Abbey', 'Danielson', 'New York', 10-445-5559-345-096),
('Walter', 'Paulson', 'Miami', 94-890-8894-112-238),
('Mathew', 'Olajide', 'Maldives', 98-123-8905-989-234),
('Adesua', 'Okoromadu', 'Eko city', 44-899-5829-489-098);



Create Table Transactions.OrderDetails
(
PurchaseID int identity (1,1) primary key,
Orderdate Date,
ReceivingDate Date,
QtyOrdered int,
QtyReceived int null,
UnitPrice money,
ShipMethod varchar (10),
OrderStatus varchar (10)
)


select * from Transactions.OrderDetails

Insert into Transactions.OrderDetails
Values('2021-07-20', '2021-08-02', 5, 5, 1200, 'Freight', 'Intransit');

Insert into Transactions.OrderDetails
Values('2021/04/15', '2021/06/10', 96, 94, 5000, 'Cargo', 'Cancelled'),
('2021/08/02', '2021/08/10', 88, 81, 7800, 'Air', 'Intransit'),
('2021/03/08', '2021/05/04', 715, 565, 9500, 'Train','Received');
