CREATE DATABASE BlueBikes 

Use BlueBikes 

Go 

 

-------------------Creating Customer Table & Check Constraint-------------------------------------- 

 

 

CREATE SYMMETRIC KEY EncryptionKey 

WITH ALGORITHM = AES_256 

ENCRYPTION BY PASSWORD = 'bluebikes'; 

 

CREATE TABLE Customer ( 

    CustomerID UNIQUEIDENTIFIER not null default NEWID(), 

    CustFName varchar(50), 

    CustLName varchar(50), 

    CustEmail varchar (100) UNIQUE, 

    CustPassword varbinary(256) DEFAULT EncryptByKey(Key_GUID('EncryptionKey'), CONVERT(varbinary(256), '')), 

    CustPhone varchar (15), 

    CustStreetAddress varchar (100), 

    CustHouseNo varchar (10), 

    CustCity varchar (50), 

    CustState char (2), 

    CustZIP varchar(10), 

 

CONSTRAINT Customer_PK primary key (CustomerID), 

CONSTRAINT CHK_Zipcode CHECK (LEN(CustZIP)=5), 

CONSTRAINT CHK_CustPhone CHECK (CustPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]') 

); 

 

-------------------Creating Payment Method Table & Check Constraint-------------------------------------- 

 

CREATE TABLE PaymentMethod ( 

    PaymentID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), 

    CustomerID UNIQUEIDENTIFIER NOT NULL, 

    PaymentType VARCHAR(20) NOT NULL, 

 

CONSTRAINT PaymentMethod_PK PRIMARY KEY (PaymentID), 

CONSTRAINT PaymentMethod_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID), 

CONSTRAINT CHK_PaymentType CHECK (PaymentType IN ('Card', 'Bank Account')) 

); 

 

-------------------Creating Card Payment Table & Check Constraint-------------------------------------- 

 

CREATE TABLE CardPayment ( 

    PaymentID UNIQUEIDENTIFIER NOT NULL, 

  CardName VARCHAR(20), 

    CardNumber varbinary(256) NOT NULL DEFAULT EncryptByKey(Key_GUID('EncryptionKey'), CONVERT(varbinary(256), '')), 

ExpiryDate varbinary(256) NOT NULL DEFAULT EncryptByKey(Key_GUID('EncryptionKey'), CONVERT(varbinary(256), '')), 

CVV varbinary(256) NOT NULL DEFAULT EncryptByKey(Key_GUID('EncryptionKey'), CONVERT(varbinary(256), '')), 

 

 

CONSTRAINT CardPayment_PK PRIMARY KEY (PaymentID), 

CONSTRAINT CardPayment_FK1 FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID), 

CONSTRAINT CHK_ExpiryDate CHECK (ExpiryDate >= FORMAT(GETDATE(), 'MM/yy')), 

CONSTRAINT CK_CardPayment_CardNumber CHECK (LEN(CardNumber) = 16), 

CONSTRAINT CK_CardPayment_ExpiryDate CHECK (ExpiryDate LIKE '[0-1][0-9]/[0-9][0-9]'), 

CONSTRAINT CK_CardPayment_CVV CHECK (LEN(CVV) = 3) 

); 

 

 

-------------------Creating BankAccount Payment Table & Check Constraint-------------------------------------- 

 

CREATE TABLE BankAccountPayment ( 

    PaymentID UNIQUEIDENTIFIER NOT NULL, 

    BankAccFName varchar(50), 

    BankAccLName varchar(50), 

    AccountNumber VARCHAR(20) NOT NULL DEFAULT (ENCRYPTBYKEY(KEY_GUID('EncryptionKey'), CAST('' AS varbinary(256)))), 

    RoutingNumber VARCHAR(20) NOT NULL DEFAULT (ENCRYPTBYKEY(KEY_GUID('EncryptionKey'), CAST('' AS varbinary(256)))), 

    AccountType VARCHAR(10) NOT NULL, 

 

CONSTRAINT BankAccountPayment_PK PRIMARY KEY (PaymentID), 

CONSTRAINT BankAccountPayment_FK1 FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID), 

CONSTRAINT BankAccountPayment_CK2 CHECK (LEN(AccountNumber) = 20), 

CONSTRAINT BankAccountPayment_CK1 CHECK (LEN(RoutingNumber) = 9), 

CONSTRAINT CHK_AccountType CHECK (AccountType IN ('Checkings', 'Savings')) 

); 

 

-------------------Creating Transaction Table & Check Constraint-------------------------------------- 

 

CREATE FUNCTION dbo.CalculateTransactionTotalCost (@RentDuration decimal(5,2)) 

RETURNS decimal(10,2) 

AS 

BEGIN 

    DECLARE @TransactionCost decimal(10,2) 

    SET @TransactionCost = 12.99 * @RentDuration 

    RETURN @TransactionCost 

END 

 

CREATE TABLE [Transaction] ( 

    TransactionID VARCHAR(20) NOT NULL DEFAULT(CONCAT(CONVERT(varchar(8), GETDATE(), 112), '-', ABS(CHECKSUM(NEWID())))), 

    CustomerID UNIQUEIDENTIFIER, 

    PaymentID UNIQUEIDENTIFIER, 

    TransactionDateTime datetime, 

    RentDuration decimal (5,2), 

    TransactionCost AS dbo.CalculateTransactionTotalCost(RentDuration), 

 

CONSTRAINT Transaction_PK PRIMARY KEY (TransactionID), 

CONSTRAINT Transaction_FK1 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID), 

CONSTRAINT Transaction_FK2 FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID), 

CONSTRAINT CHK_RentDuration CHECK (RentDuration > 0) 

); 

 

-------------------Creating Bike Model Table-------------------------------------- 

 

CREATE TABLE BikeModel ( 

    BikeModelID int not null IDENTITY(1,1), 

    BikeBrandName varchar (50), 

    BikeModelName varchar (50), 

 

CONSTRAINT BikeModel_PK primary key (BikeModelID) 

); 

 

-------------------Creating Employee Table & Check Constraint-------------------------------------- 

 

CREATE TABLE Employee ( 

EmployeeID INT IDENTITY(1001,1) PRIMARY KEY, 

    EmpFName varchar(50), 

    EmpLName varchar(50), 

    EmpEmail varchar (100) UNIQUE, 

    EmpPhone varchar (15), 

    EmpStreetAddress varchar (100), 

    EmpHouseNo varchar (10), 

    EmpCity varchar (50), 

    EmpState char (2), 

    EmpZIP int, 

    EmpGender varchar (11), 

    EmpDesignation varchar (50), 

 

CONSTRAINT CHK_EmpEmail CHECK (EmpEmail LIKE '%@%.%'), 

CONSTRAINT CHK_EmpPhone CHECK (EmpPhone LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'), 

CONSTRAINT CHK_EmpZIP CHECK (LEN(EmpZIP)=5), 

CONSTRAINT CHK_EmpGender CHECK (EmpGender IN ('Male', 'Female', 'Other')) 

); 

-------------------Creating Dock Table & Check Constraint-------------------------------------- 

 

CREATE FUNCTION CalculateAvailableSpots (@BikeCapacity INT, @BikeAvailable INT) 

RETURNS INT 

AS 

BEGIN 

    DECLARE @AvailableSpots INT 

    SET @AvailableSpots = @BikeCapacity - @BikeAvailable 

    RETURN @AvailableSpots 

END 

 

CREATE TABLE Dock ( 

    DockID UNIQUEIDENTIFIER not null default NEWID(), 

    EmployeeID INT, 

    DockName varchar (50), 

    DockLocation varchar (50), 

    BikeCapacity int, 

    BikeAvailable int, 

    AvailableSpots AS dbo.CalculateAvailableSpots(BikeCapacity, BikeAvailable), 

 

CONSTRAINT Dock_PK primary key (DockID), 

CONSTRAINT Dock_FK1 foreign key (EmployeeID) references Employee(EmployeeID), 

CONSTRAINT CHK_BikeAvailable CHECK (BikeAvailable <= BikeCapacity) 

); 

 

-------------------Creating Bike Table & Check Constraint-------------------------------------- 

 

CREATE TABLE Bike ( 

    BikeID UNIQUEIDENTIFIER not null default NEWID(), 

    BikeModelID int not null, 

    DockID UNIQUEIDENTIFIER, 

    BikeLocation varchar (50), 

    BikeRentalStatus BIT, 

 

CONSTRAINT Bike_PK primary key (BikeID), 

CONSTRAINT Bike_FK1 FOREIGN KEY (BikeModelID) REFERENCES BikeModel(BikeModelID), 

CONSTRAINT Bike_FK2 FOREIGN KEY (DockID) REFERENCES Dock(DockID), 

CONSTRAINT CHK_BikeRentalStatus CHECK (BikeRentalStatus IN (0,1)) 

); 

 

-------------------Creating Maintenance Table & Check Constraint-------------------------------------- 

 

CREATE TABLE Maintenance ( 

    MaintenanceID UNIQUEIDENTIFIER not null default NEWID(), 

    BikeID UNIQUEIDENTIFIER, 

    EmployeeID INT, 

    MaintenanceDateTime datetime, 

    MaintenanceDescription varchar (500), 

    MaintenanceCost decimal (10,2), 

 

CONSTRAINT Maintenance_PK primary key (MaintenanceID), 

CONSTRAINT Maintenance_FK1 foreign key (BikeID) references Bike(BikeID), 

CONSTRAINT Maintenance_FK2 foreign key (EmployeeID) references Employee(EmployeeID), 

CONSTRAINT CHK_MaintenanceCost CHECK (MaintenanceCost >= 0) 

); 

 

-------------------Creating Rental Table & Check Constraint-------------------------------------- 

 

CREATE FUNCTION dbo.CalculateRentalTime 

( 

    @StartDateTime datetime, 

    @EndDateTime datetime 

) 

RETURNS int 

AS 

BEGIN 

    DECLARE @RentalTime int 

     

    SET @RentalTime = DATEDIFF(hour, @StartDateTime, @EndDateTime) 

     

    RETURN @RentalTime 

END 

 

CREATE TABLE Rental ( 

    RentalID VARCHAR(20) NOT NULL DEFAULT(CONCAT(CONVERT(varchar(8), GETDATE(), 112), '-', ABS(CHECKSUM(NEWID())))), 

    CustomerID UNIQUEIDENTIFIER not null, 

    BikeID UNIQUEIDENTIFIER not null, 

    [TransactionID] VARCHAR (20) not null, 

    StartDockID UNIQUEIDENTIFIER, 

    EndDockID UNIQUEIDENTIFIER, 

    StartDateTime datetime, 

    EndDateTime datetime, 

    RentalTime AS dbo.CalculateRentalTime(StartDateTime, EndDateTime), 

 

CONSTRAINT Rental_PK primary key (RentalID), 

CONSTRAINT Rental_FK1 foreign key (CustomerID) references Customer(CustomerID), 

CONSTRAINT Rental_FK2 foreign key (BikeID) references Bike(BikeID), 

CONSTRAINT Rental_FK3 foreign key (TransactionID) references [Transaction](TransactionID), 

CONSTRAINT CHK_StartEndDateTime CHECK (StartDateTime <= EndDateTime) 

); 

 

-------------------Creating Accessory Table-------------------------------------- 

CREATE TABLE Accessory ( 

    ItemID INT IDENTITY(1001,1) PRIMARY KEY, 

    ItemName varchar (20), 

    ItemCost decimal (10,2), 

ItemCount int, 

); 

-------------------Creating Bike Accessory Table-------------------------------------- 

CREATE TABLE BikeAccessory ( 

    BikeID UNIQUEIDENTIFIER not null, 

    ItemID int, 

 

CONSTRAINT BikeAccessory_PK primary key (BikeID, ItemID), 

CONSTRAINT BikeAccessory_FK1 foreign key (BikeID) references Bike(BikeID), 

CONSTRAINT BikeAccessory_FK2 foreign key (ItemID) references Accessory(ItemID) 

); 




-----------------------------Stored Procedures-------------------------------------- 

--Get Customer Details-- 

CREATE PROCEDURE CustomerDetails 

@CustomerID UNIQUEIDENTIFIER 

AS 

BEGIN 

SELECT CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP 

FROM Customer 

WHERE CustomerID = @CustomerID;  

END 

 
 
 

--Add Customer-- 

CREATE PROCEDURE InsertCustomer 

@CustFName VARCHAR(50), 

@CustLName VARCHAR(50), 

@CustEmail VARCHAR(100), 

@CustPassword VARCHAR(100), 

@CustPhone VARCHAR(15), 

@CustStreetAddress VARCHAR(100), 

@CustHouseNo VARCHAR(10), 

@CustCity VARCHAR(50), 

@CustState CHAR(2), 

@CustZIP VARCHAR(10) 

AS 

BEGIN 
    BEGIN TRY
        BEGIN TRANSACTION
                INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP) 
                VALUES (@CustFName, @CustLName, @CustEmail, @CustPassword, @CustPhone, @CustStreetAddress, @CustHouseNo, @CustCity, @CustState, @CustZIP)
        COMMIT TRANSACTION 
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
        DECLARE @ErrorState INT = ERROR_STATE()
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
END 

 
 

--Update Customer-- 

CREATE PROCEDURE UpdateCustomer 

@CustomerID UNIQUEIDENTIFIER, 

@CustFName VARCHAR(50), 

@CustLName VARCHAR(50), 

@CustEmail VARCHAR(100), 

@CustPassword VARCHAR(100), 

@CustPhone VARCHAR(15), 

@CustStreetAddress VARCHAR(100), 

@CustHouseNo VARCHAR(10), 

@CustCity VARCHAR(50), 

@CustState CHAR(2), 

@CustZIP VARCHAR(10) 

AS 

BEGIN 

UPDATE Customer 

SET CustFName = @CustFName, 

CustLName = @CustLName, 

CustEmail = @CustEmail, 

CustPassword = @CustPassword, 

CustPhone = @CustPhone, 

CustStreetAddress = @CustStreetAddress, 

CustHouseNo = @CustHouseNo, 

CustCity = @CustCity, 

CustState = @CustState, 

CustZIP = @CustZIP 

WHERE CustomerID = @CustomerID 

END 

 
 

--Update Email-- 

CREATE PROCEDURE UpdateCustomerEmail 

@CustomerID UNIQUEIDENTIFIER, 

@CustEmail VARCHAR(100) 

AS 

BEGIN 

UPDATE Customer 

SET CustEmail = @CustEmail 

WHERE CustomerID = @CustomerID 

END 

 
 

--Update Password-- 

CREATE PROCEDURE UpdateCustomerPassword 

@CustomerID UNIQUEIDENTIFIER, 

@CustPassword VARCHAR(100) 

AS 

BEGIN 

UPDATE Customer 

SET CustPassword = @CustPassword 

WHERE CustomerID = @CustomerID 

END 

 
 

--Update Phone-- 

CREATE PROCEDURE UpdateCustomerPhone 

@CustomerID UNIQUEIDENTIFIER, 

@CustPhone VARCHAR(100) 

AS 

BEGIN 

UPDATE Customer 

SET @CustPhone = @CustPhone 

WHERE CustomerID = @CustomerID 

END 

 
 

--Update Address-- 

CREATE PROCEDURE UpdateCustomerAddress 

@CustomerID UNIQUEIDENTIFIER, 

@CustStreetAddress VARCHAR(100), 

@CustHouseNo VARCHAR(10), 

@CustCity VARCHAR(50), 

@CustState CHAR(2), 

@CustZIP VARCHAR(10) 

AS 

BEGIN 

UPDATE Customer 

SET CustStreetAddress = @CustStreetAddress, 

CustHouseNo = @CustHouseNo, 

CustCity = @CustCity, 

CustState = @CustState, 

CustZIP = @CustZIP 

WHERE CustomerID = @CustomerID 

END 

 
 
 

--Delete Customer-- 

CREATE PROCEDURE DeleteCustomer 

@CustomerID UNIQUEIDENTIFIER 

AS 

BEGIN 

DELETE FROM Customer 

WHERE CustomerID = @CustomerID 

END 





---------------------Trigger--------------------------- 

 
 

--Creating Log Table-- 

CREATE TABLE CustomerLog ( 

AuditID INT IDENTITY(1,1) PRIMARY KEY, 

CustomerID UNIQUEIDENTIFIER NOT NULL, 

Action NVARCHAR(10) NOT NULL, 

OldCustFName VARCHAR(50), 

NewCustFName VARCHAR(50), 

OldCustLName VARCHAR(50), 

NewCustLName VARCHAR(50), 

OldCustEmail VARCHAR(100), 

NewCustEmail VARCHAR(100), 

OldCustPassword VARCHAR(100), 

NewCustPassword VARCHAR(100), 

OldCustPhone VARCHAR(15), 

NewCustPhone VARCHAR(15), 

OldCustStreetAddress VARCHAR(100), 

NewCustStreetAddress VARCHAR(100), 

OldCustHouseNo VARCHAR(10), 

NewCustHouseNo VARCHAR(10), 

OldCustCity VARCHAR(50), 

NewCustCity VARCHAR(50), 

OldCustState CHAR(2), 

NewCustState CHAR(2), 

OldCustZIP VARCHAR(10), 

NewCustZIP VARCHAR(10), 

AuditDate DATETIME DEFAULT GETDATE() 

) 

 
 

CREATE TRIGGER CustomerUpdateTrigger 

ON Customer 

AFTER INSERT, UPDATE, DELETE 

AS 

BEGIN 

DECLARE @Action nvarchar(10) 

IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) 

SET @Action = 'Update' 

ELSE IF EXISTS(SELECT * FROM inserted) 

SET @Action = 'Insert' 

ELSE 

SET @Action = 'Delete' 

 
 

INSERT INTO CustomerLog (CustomerID, Action, OldCustFName, NewCustFName, OldCustLName, NewCustLName, OldCustEmail, NewCustEmail, OldCustPhone, NewCustPhone, OldCustStreetAddress, NewCustStreetAddress, OldCustHouseNo, NewCustHouseNo, OldCustCity, NewCustCity, OldCustState, NewCustState, OldCustZIP, NewCustZIP) 

SELECT i.CustomerID, @Action, d.CustFName, i.CustFName, d.CustLName, i.CustLName, d.CustEmail, i.CustEmail, d.CustPhone, i.CustPhone, d.CustStreetAddress, i.CustStreetAddress, d.CustHouseNo, i.CustHouseNo, d.CustCity, i.CustCity, d.CustState, i.CustState, d.CustZIP, i.CustZIP 

FROM inserted i 

LEFT JOIN deleted d ON i.CustomerID = d.CustomerID 

END





-----------------------creating non clustered index--------------------- 

CREATE NONCLUSTERED INDEX idx_CustomerName ON Customer (CustFName, CustLName); 

sp_helpindex Customer; 

  

CREATE NONCLUSTERED INDEX idx_DockName ON Dock (DockName); 

sp_helpindex Dock; 

  

CREATE NONCLUSTERED INDEX IX_Employee_EmpDesignation  

ON dbo.Employee (EmpDesignation)  

INCLUDE (EmpFName, EmpLName); 

sp_helpindex Employee; 



----------------------Views----------------------- 

---View to show the total revenue generated by each payment type in the past month--- 

CREATE VIEW PaymentTypeRevenue AS 

SELECT pm.PaymentType, SUM(t.TransactionCost) AS TotalRevenue 

FROM PaymentMethod pm 

INNER JOIN [Transaction] t ON pm.PaymentID = t.PaymentID 

WHERE t.TransactionDateTime >= DATEADD(month, -1, GETDATE()) 

GROUP BY pm.PaymentType; 

 

SELECT PaymentType, TotalRevenue 

FROM PaymentTypeRevenue; 

 

---View to show the total number of rented bikes by customer---

CREATE VIEW TotalRentedBikesByCustomer AS 

SELECT Customer.CustomerID, Customer.CustFName, Customer.CustLName, COUNT([Transaction].TransactionID) AS TotalRentedBikes 

FROM Customer 

INNER JOIN [Transaction] ON Customer.CustomerID = [Transaction].CustomerID 

GROUP BY Customer.CustomerID, Customer.CustFName, Customer.CustLName; 

 

SELECT * FROM TotalRentedBikesByCustomer; 

 

 

---View to show transaction information along with the customer's name and payment type, paymentid---

CREATE VIEW TransactionDetails AS 

SELECT t.TransactionID,  

       c.CustFName + ' ' + c.CustLName AS CustomerName, 

       pm.PaymentType, 

       pm.PaymentID, 

       t.TransactionDateTime,  

       t.RentDuration,  

       t.TransactionCost 

FROM [Transaction] t 

JOIN Customer c ON t.CustomerID = c.CustomerID 

JOIN PaymentMethod pm ON t.PaymentID = pm.PaymentID 

 

SELECT * FROM TransactionDetails 