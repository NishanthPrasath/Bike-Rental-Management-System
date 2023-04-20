--Customer Table 
INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('John', 'Doe', 'johndoe@xyz.com', 'john123', '555-555-1234', '123 Bane Street', '11', 'Boston', 'MA', '01234') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Harvey', 'Specter', 'harvey@xyz.com', 'harvey123', '555-555-5678', '456 Broklyn Ave', '754', 'Boston', 'MA', '56789') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Micheal', 'Scott', 'scottm@xyz.com', 'scottm123', '555-555-9123', '7 Dunder Mifflin', '-', 'Boston', 'MA', '22178') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Claire', 'Dunphy', 'claire@xyz.com', 'claire123', '555-555-4567', '88 Mass Ave', '7', 'Boston', 'MA', '22178') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('John', 'Snow', 'snowyy@xyz.com', 'snowyy987', '555-555-8912', '456 Broklyn Ave', '655', 'Boston', 'MA', '56789') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Meghan', 'Markle', 'megz@xyz.com', 'megamark', '555-555-3456', '456 Broklyn Ave', '1001', 'Boston', 'MA', '56789') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Victoria', 'Bekham', 'beckham09@xyz.com', 'beckyvic', '555-555-7891', '122 Bane Street', '4', 'Boston', 'MA', '01234') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Kiara', 'Malhotra', 'kiaraadv@xyz.com', 'advanik123', '555-555-2345', '92 Mass Ave', '5', 'Boston', 'MA', '22178') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Shahrukh', 'Khan', 'kingkhan@xyz.com', 'badshah01', '555-555-6789', '100 Bollywood St', '-', 'Boston', 'MA', '00112') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Virat', 'Kohli', 'kingkohli@xyz.com', 'cricketking', '555-555-1230', '101 Bollywood St', '-', 'Boston', 'MA', '00112') 

INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP)  
VALUES ('Vinay', 'Kumar', 'vinay@test.com', 'test123', '550-555-1230', '123 Main St', '9', 'Miami', 'FL', '98765') 
select * from Customer
  
--Payment Method Table 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('c119bf90-591e-4ba4-95cb-28b249346124', 'Bank Account');
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('a958dd37-a016-46d7-ac33-4caa1f9db1d4', 'Card'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('66d56501-1fc1-4c6a-869c-4d60e57c558a', 'Bank Account'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('334b5cdf-e041-4a42-9b94-51bf88393c09', 'Card'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'Bank Account'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('96d6b30b-2015-4392-b5dc-72b934c36c9c', 'Card'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('b60aee4c-691f-4011-9c9f-9d63202a74a4', 'Bank Account'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('2b33eb1d-b759-45e7-b0db-c8460de9fb48', 'Card'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('29b88d9e-29c6-4281-b053-d4d1603ce40c', 'Bank Account'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', 'Bank Account'); 
INSERT INTO PaymentMethod (CustomerID, PaymentType) VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', 'Card'); 

Select * from PaymentMethod
 
--Card Payment Table 
INSERT INTO CardPayment (PaymentID, CardName, CardNumber, ExpiryDate, CVV) VALUES ('cde3a3b7-8735-4505-8aa6-1bf1eaa3fd78','Kiara Malhotra','4864712593872695', '05/25','123'); 
INSERT INTO CardPayment (PaymentID, CardName, CardNumber, ExpiryDate, CVV) VALUES ('83dcd106-ad6c-466e-aa05-2e37cf15be51','John Snow','5487654391024567', '06/27','987'); 
INSERT INTO CardPayment (PaymentID, CardName, CardNumber, ExpiryDate, CVV) VALUES ('e7e1fda8-3072-4bd3-9980-2e96f069c785','Virat Kohli','3456789012345678', '09/23','543'); 
INSERT INTO CardPayment (PaymentID, CardName, CardNumber, ExpiryDate, CVV) VALUES ('3ac22cef-cd7e-488b-be37-6e67e3e009ef','Micheal Scot','9876543210987654', '08/24','101'); 
INSERT INTO CardPayment (PaymentID, CardName,  CardNumber, ExpiryDate, CVV) VALUES ('AC1FC4B2-5DD3-463B-A3B0-C6F60823B3B4', 'Meghan Markle','6789012345678901', '06/28', '678');
INSERT INTO CardPayment (PaymentID, CardName,  CardNumber, ExpiryDate, CVV) VALUES ('468DDFEA-C541-46F6-B005-B532929211E2','John Doe', '2345678901234567', '09/29', '234');
INSERT INTO CardPayment (PaymentID, CardName,  CardNumber, ExpiryDate, CVV) VALUES ('E7E1FDA8-3072-4BD3-9980-2E96F069C785','Michael Lee', '3456789012345678', '03/25', '345');

--Bank Account Payment Table 
INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('e02cc4c1-12c9-4325-9008-20df823968fa','Claire','Dunphy','73842506178350738421','437826591','Checkings'); 

INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('9a3fb475-7148-478a-a573-4b51f1068e25','Meghan','Markle','90217415368420509172','958247103','Checkings'); 

INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('ac580398-e2d1-47aa-852f-4e588f29b0e8','Harvey','Specter','84923652931502975896','712905438','Checkings'); 

INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('24e36469-f45c-4b7c-a990-76be6c355ce4','Victoria','Beckham','16047283590745839207','203846571','Savings'); 

INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('e9183ce6-2737-4186-8c4e-b2a58fb0df4b','Shahrukh','Khan','47593840329581729516','693481027','Savings'); 

INSERT INTO BankAccountPayment (PaymentID, BankAccFname, BankAccLName, AccountNumber, RoutingNumber, AccountType) 
VALUES ('468ddfea-c541-46f6-b005-b532929211e2','John','Doe','51907284576304923480','821057394','Savings'); 

Select * from BankAccountPayment 

--insert Transaction table values-- 
INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('2b33eb1d-b759-45e7-b0db-c8460de9fb48', 'cde3a3b7-8735-4505-8aa6-1bf1eaa3fd78', '2023-03-28 12:30:00', 3.5, 70.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'e02cc4c1-12c9-4325-9008-20df823968fa', '2023-03-27 16:45:00', 2.0, 40.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('96d6b30b-2015-4392-b5dc-72b934c36c9c', '83dcd106-ad6c-466e-aa05-2e37cf15be51', '2023-03-26 09:15:00', 1.5, 30.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('334b5cdf-e041-4a42-9b94-51bf88393c09', 'e7e1fda8-3072-4bd3-9980-2e96f069c785', '2023-03-25 18:30:00', 0.8, 16.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', '9a3fb475-7148-478a-a573-4b51f1068e25', '2023-03-24 14:00:00', 1.0, 20.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', '9a3fb475-7148-478a-a573-4b51f1068e25', '2023-03-23 11:45:00', 3.0, 60.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost) 
VALUES ('b60aee4c-691f-4011-9c9f-9d63202a74a4', 'ac580398-e2d1-47aa-852f-4e588f29b0e8', '2023-03-22 17:15:00', 1.8, 36.00); 

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('2b33eb1d-b759-45e7-b0db-c8460de9fb48', 'cde3a3b7-8735-4505-8aa6-1bf1eaa3fd78', '2023-03-19 08:00:00', 2.5, 50.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('2b33eb1d-b759-45e7-b0db-c8460de9fb48', 'cde3a3b7-8735-4505-8aa6-1bf1eaa3fd78', '2023-03-18 14:30:00', 1.0, 20.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'e02cc4c1-12c9-4325-9008-20df823968fa', '2023-03-17 10:15:00', 3.0, 60.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'e02cc4c1-12c9-4325-9008-20df823968fa', '2023-03-16 16:00:00', 2.5, 50.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('96d6b30b-2015-4392-b5dc-72b934c36c9c', '83dcd106-ad6c-466e-aa05-2e37cf15be51', '2023-03-15 11:30:00', 1.0, 20.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('334b5cdf-e041-4a42-9b94-51bf88393c09', 'e7e1fda8-3072-4bd3-9980-2e96f069c785', '2023-03-14 15:45:00', 2.0, 40.00);

INSERT INTO [Transaction] (CustomerID, PaymentID, TransactionDateTime, RentDuration, TransactionCost)
VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', '9a3fb475-7148-478a-a573-4b51f1068e25', '2023-03-13 09:00:00', 3.0, 60.00);
select * from [Transaction] 

--insert BikeModel table values-- 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Trek', 'Marlin 6'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Giant', 'Talon 29er'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Specialized', 'Rockhopper Sport'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Cannondale', 'Trail 7'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Scott', 'Aspect 970'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Cube', 'AIM SL'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Santa Cruz', 'Chameleon'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Kona', 'Mahuna'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Norco', 'Storm 2'); 
INSERT INTO BikeModel (BikeBrandName, BikeModelName) VALUES ('Yeti', 'SB115'); 
select * from BikeModel 
 
--insert Employee table values-- 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Erick', 'John', 'johndoe@example.com', '555-123-1234', '123 Main St', 'Apt 1A', 'New York', 'NY', '10001', 'Male', 'Operations Manager'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Jane', 'Doe', 'janedoe@example.com', '555-567-5678', '456 Elm St', 'Suite 2B', 'Boston', 'MA', '21156', 'Female', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Michael', 'Smith', 'michaelsmith@example.com', '555-246-9123', '789 Oak St', 'Unit 3C', 'San Francisco', 'CA', '94109', 'Male', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Emily', 'Jones', 'emilyjones@example.com', '555-789-4567', '321 Pine St', 'Apt 4D', 'Seattle', 'WA', '98101', 'Female', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Robert', 'Williams', 'robertwilliams@example.com', '555-135-8912', '987 Maple St', 'Unit 5F', 'Los Angeles', 'CA', '90012', 'Male', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Sarah', 'Brown', 'sarahbrown@example.com', '555-369-3456', '654 Cedar St', 'Apt 6B', 'Chicago', 'IL', '60610', 'Female', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Christopher', 'Davis', 'christopherdavis@example.com', '555-246-7891', '123 Pine St', 'Suite 8E', 'Houston', 'TX', '77002', 'Male', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Laura', 'Garcia', 'lauragarcia@example.com', '555-789-2345', '456 Oak St', 'Apt 3B', 'Miami', 'FL', '33130', 'Female', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Bob', 'Johnson', 'bob.johnson@email.com', '555-987-6789', '789 Oak St', 'Unit 5', 'Chicago', 'IL', '60601', 'Male', 'Quality Control Inspector'); 
INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES ('Samantha', 'Clark', 'samantha.clark@email.com', '555-369-1234', '3690 Birch St', 'Apt 15', 'Atlanta', 'GA', '30301', 'Female', 'Operations Manager'); 
select * from Employee 
 
--insert Dock table values-- 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1002, 'Boston Station Dock', 'Boston', 10, 8); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1002, 'Back Bay Dock', 'Boston', 15, 12); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1003, 'South Boston Dock', 'Boston', 20, 18); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1005, 'North End Dock', 'Boston', 10, 9); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1006, 'Fenway Dock', 'Boston', 15, 11); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1007, 'Seaport Dock', 'Boston', 20, 16); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1008, 'Beacon Hill Dock', 'Boston', 10, 8); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1009, 'Harborfront Dock', 'Boston', 15, 13); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1004, 'Cambridge Dock', 'Boston', 20, 19); 
INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (1007, 'Charlestown Dock', 'Boston', 10, 7); 
select * from Dock 

--insert Bike table values-- 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (1, '88161ba7-0b51-4b84-a410-f103685aa456', 'North End Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (2, 'd1050b00-6e19-4f7c-975d-37620bc926bb', 'Seaport Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (3, 'fc482ae4-f228-4822-b85c-e0e054caf3de', 'Cambridge Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (4, '073c7e4c-1111-42e9-acb5-3e5e630c5e32', 'Fenway Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (5, '2703a36d-a078-48a5-b65f-a56c745c85ea', 'South Boston Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (6, '1825c067-dc30-475a-a4ff-5d63dc248bab', 'Back Bay Dock', 0); 
INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (7, '33990173-74bf-4702-8beb-41dfdea1fe9f', 'Charlestown Dock', 0); 
INSERT INTO Bike (BikeModelID, BikeLocation, BikeRentalStatus) VALUES (8, 'Northestern Univeristy', 1); 
INSERT INTO Bike (BikeModelID, BikeLocation, BikeRentalStatus) VALUES (9, 'Prudential Center', 1); 
INSERT INTO Bike (BikeModelID, BikeLocation, BikeRentalStatus) VALUES (10, 'Downtown', 1); 
select * from Bike 
 
--insert Maintenance table values-- 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('544d44ee-ffc5-4650-aa97-0103d2d78159', 1002, '2023-03-15 10:30:00', 'Performed routine maintenance on bike', 25.00); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('675ddb3d-d565-4c2c-86ef-1251b2fe769c', 1002, '2023-02-16 13:45:00', 'Replaced brake pads on bike', 15.50); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('7f304cda-d284-4123-b401-17a5327b9e84', 1003, '2023-02-17 09:00:00', 'Repaired flat tire on bike', 8.75); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('a8fd3497-4f9c-44ca-9da0-4578d9b804ef', 1005, '2023-01-18 11:15:00', 'Cleaned and lubricated chain on bike', 12.00); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('77e12843-a6e0-495d-8dff-7f82d8c0d544', 1006, '2022-09-19 14:30:00', 'Performed safety inspection on bike', 0.00); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('f95fa890-a60e-43c6-b792-84cd403f934f', 1007, '2022-08-20 16:45:00', 'Replaced worn tires on bike', 35.25); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('8af06e14-b32b-40f7-aea0-9a66861f6f0e', 1008, '2022-10-21 10:00:00', 'Adjusted gears on bike', 9.50); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1009, '2022-11-22 12:15:00', 'Replaced handlebar grips on bike', 7.25); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('544d44ee-ffc5-4650-aa97-0103d2d78159', 1009, '2022-12-23 15:30:00', 'Performed full tune-up on bike', 50.00); 
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1009, '2023-01-15 09:00:00', 'Adjusted brakes on bike', 12.50);
INSERT INTO Maintenance (BikeID, EmployeeID, MaintenanceDateTime, MaintenanceDescription, MaintenanceCost) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1009, '2023-02-18 14:45:00', 'Replaced chain on bike', 20.00);
select * from Maintenance

--insert Rental table values-- 
INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', '675ddb3d-d565-4c2c-86ef-1251b2fe769c', '20230407-1564280897', 'd1050b00-6e19-4f7c-975d-37620bc926bb', 'fc482ae4-f228-4822-b85c-e0e054caf3de', '2023-03-24 09:00:00', '2023-03-24 10:00:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('334b5cdf-e041-4a42-9b94-51bf88393c09', '7f304cda-d284-4123-b401-17a5327b9e84', '20230407-1842530796', '8cc2de2a-3172-4f90-9e27-38cf4f86fcdc', '1825c067-dc30-475a-a4ff-5d63dc248bab', '2023-03-25 13:00:00', '2023-03-25 13:48:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('2b33eb1d-b759-45e7-b0db-c8460de9fb48', '77e12843-a6e0-495d-8dff-7f82d8c0d544', '20230407-1891323900', '1825c067-dc30-475a-a4ff-5d63dc248bab', '073c7e4c-1111-42e9-acb5-3e5e630c5e32', '2023-03-28 16:00:00', '2023-03-28 19:30:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('6fc60669-e3a1-42a1-995b-e0f20f4ba85a', 'f95fa890-a60e-43c6-b792-84cd403f934f', '20230407-2024249438', '33990173-74bf-4702-8beb-41dfdea1fe9f', '88161ba7-0b51-4b84-a410-f103685aa456', '2023-03-23 10:00:00', '2023-03-28 13:00:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'b79fe5de-3996-48fe-a48e-b1d8ecf91f68', '20230407-2427317', 'ab9e4f98-5207-4866-ac3f-4f868495ab37', '2703a36d-a078-48a5-b65f-a56c745c85ea', '2023-03-27 14:00:00', '2023-03-27 16:00:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('96d6b30b-2015-4392-b5dc-72b934c36c9c', 'f187c076-416b-4856-9193-b62da452935a', '20230407-499669454', '000b6c15-4f53-47af-aeaf-4f9c39146ddc', '33990173-74bf-4702-8beb-41dfdea1fe9f', '2023-03-26 09:00:00', '2023-03-28 10:30:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime) 
VALUES ('b60aee4c-691f-4011-9c9f-9d63202a74a4', '5fb16a8d-00eb-40df-a721-cbd44e12e387', '20230407-790267604', '1825c067-dc30-475a-a4ff-5d63dc248bab', 'd1050b00-6e19-4f7c-975d-37620bc926bb', '2023-03-22 13:00:00', '2023-03-28 14:48:00') 

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime)
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'b79fe5de-3996-48fe-a48e-b1d8ecf91f68', '20230407-2427317', 'ab9e4f98-5207-4866-ac3f-4f868495ab37', '2703a36d-a078-48a5-b65f-a56c745c85ea', '2023-03-29 10:00:00', '2023-03-29 12:00:00')

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime)
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'b79fe5de-3996-48fe-a48e-b1d8ecf91f68', '20230407-2427317', 'ab9e4f98-5207-4866-ac3f-4f868495ab37', '2703a36d-a078-48a5-b65f-a56c745c85ea', '2023-04-01 16:00:00', '2023-04-01 18:00:00')

INSERT INTO Rental (CustomerID, BikeID, TransactionID, StartDockID, EndDockID, StartDateTime, EndDateTime)
VALUES ('db39d4b9-a01f-4155-b13d-6ee36f2bca48', 'b79fe5de-3996-48fe-a48e-b1d8ecf91f68', '20230407-2427317', 'ab9e4f98-5207-4866-ac3f-4f868495ab37', '2703a36d-a078-48a5-b65f-a56c745c85ea', '2023-04-05 09:00:00', '2023-04-05 11:00:00')
select * from Rental 

--insert Accessory table values-- 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bicycle Helmet', 49.99, 10); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Lock', 19.99, 20); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Water Bottle Holder', 9.99, 5); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Lights', 29.99, 15); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Pump', 39.99, 3); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Fenders', 49.99, 40); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Bell', 7.99, 7); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Gloves', 24.99, 20); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Computer', 99.99, 8); 
INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES ('Bike Mirror', 14.99, 31); 
INSERT INTO Accessory (ItemName, ItemCost,ItemCount) VALUES ('Bike Phone Mount', 19.99, 10); 
select * from Accessory 

--insert BikeAccessory table values-- 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('544d44ee-ffc5-4650-aa97-0103d2d78159', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('675ddb3d-d565-4c2c-86ef-1251b2fe769c', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('7f304cda-d284-4123-b401-17a5327b9e84', 1003); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('a8fd3497-4f9c-44ca-9da0-4578d9b804ef', 1004); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('77e12843-a6e0-495d-8dff-7f82d8c0d544', 1005); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f95fa890-a60e-43c6-b792-84cd403f934f', 1006); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('8af06e14-b32b-40f7-aea0-9a66861f6f0e', 1007); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1008); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f187c076-416b-4856-9193-b62da452935a', 1009); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('5fb16a8d-00eb-40df-a721-cbd44e12e387', 1010); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('544d44ee-ffc5-4650-aa97-0103d2d78159', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('7f304cda-d284-4123-b401-17a5327b9e84', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('a8fd3497-4f9c-44ca-9da0-4578d9b804ef', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('77e12843-a6e0-495d-8dff-7f82d8c0d544', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f95fa890-a60e-43c6-b792-84cd403f934f', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('8af06e14-b32b-40f7-aea0-9a66861f6f0e', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f187c076-416b-4856-9193-b62da452935a', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('5fb16a8d-00eb-40df-a721-cbd44e12e387', 1002); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('675ddb3d-d565-4c2c-86ef-1251b2fe769c', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('7f304cda-d284-4123-b401-17a5327b9e84', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('a8fd3497-4f9c-44ca-9da0-4578d9b804ef', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('77e12843-a6e0-495d-8dff-7f82d8c0d544', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f95fa890-a60e-43c6-b792-84cd403f934f', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('8af06e14-b32b-40f7-aea0-9a66861f6f0e', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f187c076-416b-4856-9193-b62da452935a', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('5fb16a8d-00eb-40df-a721-cbd44e12e387', 1001); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f95fa890-a60e-43c6-b792-84cd403f934f', 1004); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('8af06e14-b32b-40f7-aea0-9a66861f6f0e', 1004); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('b79fe5de-3996-48fe-a48e-b1d8ecf91f68', 1004); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('f187c076-416b-4856-9193-b62da452935a', 1004); 
INSERT INTO BikeAccessory (BikeID, ItemID) VALUES ('5fb16a8d-00eb-40df-a721-cbd44e12e387', 1004); 
select * from BikeAccessory 
