/* 
-----------------------------------------------------------------------
Veterinary Clinic Database Schema
-----------------------------------------------------------------------
This database manages a veterinary practice including staff, customers, 
 animals, appointments, medical records, billing and payments.
*/

------------------------------------------------------------------------
--Creates the Database
------------------------------------------------------------------------
CREATE DATABASE VeterinaryClinic ;

/*
-----------------------------------------------------------------------
Creates Table : Staff
Holds all staff information , all staff have a unique staff id .
-----------------------------------------------------------------------
*/

CREATE TABLE Staff(
    staffID INT (7) NOT NULL AUTO_INCREMENT,
    jobTitle CHAR (30) NOT NULL ,
    employeeName CHAR (50) NOT NULL ,
    phone CHAR (15) ,
    email CHAR (50),
    salary DECIMAL(10,2) ,
    hireDate DATE ,
    qualifications  VARCHAR(100) ,
    employmentStatus VARCHAR(20),
    PRIMARY  KEY (staffID)
);

/*
----------------------------------------------------------------------------
Creates Table: Customer
Hold all the Customer information, all customers have a unique customer id.
-----------------------------------------------------------------------------
*/

CREATE TABLE Customer(
    customerID INT(10) NOT NULL AUTO_INCREMENT ,
    customerName CHAR(50) NOT NULL,
    phone CHAR (15) ,
    email CHAR (50),
    address  VARCHAR (100) ,
    PRIMARY  KEY (customerID)
);
GRANT SELECT, INSERT , UPDATE  ON VeterinaryClinic.Customer TO reception ;

/*
-----------------------------------------------------------------------------------
Creates Table: Animal
Holds all the animals information, all animals have a unique id.
All animals are associated with it owner through customer id.
-----------------------------------------------------------------------------------
*/

CREATE TABLE Animal(
    animalID  INT (13) NOT  NULL AUTO_INCREMENT,
    customerID INT(10) NOT NULL ,
    animalName CHAR (30),
    species CHAR (30) NOT NULL ,
    breed CHAR (50),
    gender CHAR (10) ,
    dateOfBirth DATE ,
    PRIMARY KEY (animalID),
    FOREIGN KEY (customerID) REFERENCES  Customer(customerID) ON DELETE RESTRICT
);
GRANT SELECT, INSERT, UPDATE ON VeterinaryClinic.Animal TO reception, veterinary_administrator ;


/*
Creates Table: Appointment
Holds all  appointment bookings information.
Links Staff vet with animal and appointment reason.
*/

CREATE TABLE Appointment (
    appointmentID INT (14) NOT NULL AUTO_INCREMENT,
    staffID INT (7) NOT NULL ,
    appointmentDate DATETIME NOT NULL ,
    appointmentReason TEXT ,
    appointmentStatus CHAR (20) DEFAULT 'Scheduled',
    PRIMARY KEY (appointmentID) ,
    FOREIGN KEY (staffID) REFERENCES Staff(staffID) ON DELETE RESTRICT,
   
);
GRANT SELECT , INSERT, UPDATE ON  VeterinaryClinic.Appointment  TO reception;

/*
---------------------------------------------------------------------------------------
Creates Table: AppointmentAnimal
Links appointments to animals and allows for multiple animals per appointment.
---------------------------------------------------------------------------------------
*/
 TABLE AppointmentAnimal  (
    appointmentAnimalID INT NOT  NULL AUTO_INCREMENT,
    appointmentID  INT(14) NOT NULL ,
    animalID INT (13) NOT NULL,
    PRIMARY KEY (appointmentAnimalID),
    FOREIGN KEY (appointmentID) REFERENCES  Appointment(appointmentID) ON DELETE RESTRICT,
    FOREIGN KEY (animalID) REFERENCES Animal (animalID) ON  DELETE RESTRICT
);
GRANT SELECT, INSERT , UPDATE ON VeterinaryClinic.AppointmentAnimal TO reception ;


/*
----------------------------------------------------------------------------------------
Creates Table: Medical Records
Holds medical history and treatment records
Links to appointments to connect the medical findings back to the appointment details.
----------------------------------------------------------------------------------------
*/

CREATE TABLE MedicalRecord (
    recordID INT(15) NOT NULL AUTO_INCREMENT ,
    appointmentID INT (14) NOT NULL ,
    animalID INT (13) NOT NULL ,
    staffID INT (7)  NOT NULL ,
    diagnosis TEXT ,
    treatment TEXT ,
    medication TEXT,
    followUpRequired BOOLEAN DEFAULT FALSE ,
    followUpNotes  TEXT,
    recordDate DATE NOT NULL ,
    PRIMARY KEY (recordID) ,
    FOREIGN KEY (appointmentID)  REFERENCES Appointment (appointmentID) ON DELETE  RESTRICT ,
    FOREIGN KEY (animalID) REFERENCES Animal(animalID) ON DELETE RESTRICT,
    FOREIGN KEY (staffID)REFERENCES  staff(staffID) ON DELETE RESTRICT ,
);
GRANT SELECT, INSERT,  UPDATE ON VeterinaryClinic.MedicalRecord TO veterinary_administrator, veterinarian ;

/*
----------------------------------------------------------------------------------------------
Creates Table: Billing
Holds all billing information for appointments and treatments.
Tracks payment status and payment by installments arrangements.
----------------------------------------------------------------------------------------------
*/
CREATE TABLE Billing(
    billingID INT (16) NOT NULL  AUTO_INCREMENT,
    appointmentID INT (14) NOT NULL,
    customerID INT (10) NOT NULL ,
    billDate DATE NOT NULL ,
    billTotal DECIMAL(10,2) NOT NULL,
    paidInInstalments BOOLEAN  DEFAULT FALSE ,
    billPaid BOOLEAN DEFAULT FALSE ,
    PRIMARY KEY (billingID),
    FOREIGN KEY (appointmentID) REFERENCES Appointment (appointmentID) ON  DELETE RESTRICT ,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE RESTRICT ,
);
GRANT SELECT , INSERT, UPDATE ON VeterinaryClinic.Billing  TO billing_admin ;

/*
-------------------------------------------------------------------------------------------------
Creates Table: Payment
Holds all payment transactions.
Supports multiple payments per bill for instalments arrangements
-------------------------------------------------------------------------------------------------
*/
CREATE TABLE Payment (
    paymentID INT (17) NOT  NULL AUTO_INCREMENT ,
    billingID INT (16) NOT NULL ,
    paymentDate  DATE NOT NULL ,
    amount DECIMAL (10,2) NOT NULL,
    paymentMethod CHAR (20) ,
    PRIMARY KEY (paymentID) ,
    FOREIGN KEY (billingID) REFERENCES  Billing (billingID) ON DELETE RESTRICT,
);
GRANT SELECT, INSERT, UPDATE ON VeterinaryClinic.Payment TO billing_admin;

/*
---------------------------------------------------------------------------------------------------
Creates Indexes for frequently searched and joined columns.
Quick and effient look up for common searches such as customers animals ,
finding appointments by Staff/Animal/Date, finding bills and payments.
---------------------------------------------------------------------------------------------------
*/
CREATE INDEX idx_animal_customer ON Animal (customerID) ;
CREATE INDEX idx_appointment_staff ON Appointment (staffID) ;
CREATE INDEX idx_appointment_animal ON Appointment(animalID) ;
CREATE INDEX idx_appointment_date ON Appointment (appointmentDate) ;
CREATE INDEX idx_appointmentanimal_appointment  ON AppointmentAnimal (appointmentID) ;
CREATE INDEX idx_appointmentanimal_animal ON AppointmentAnimal (animalID) ;
CREATE INDEX idx_billing_customer ON Billing (customerID) ;
CREATE INDEX idx_payment_billing ON Payment (billingID) ;

/*
-----------------------------------------------------------------------------------------------------
Creates Table: Supplier
Holds all the supplier information for the Veterinary Clinic 
*/
CREATE TABLE Supplier(
    supplierID INT (18) NOT NULL AUTO_INCREMENT,
    supplierName CHAR (50) NOT NULL ,
    contactPerson CHAR (50) ,
    phone CHAR (15),
    email CHAR (50) ,
    address VARCHAR (100),
    supplierType CHAR (30), 
    paymentTerms CHAR(50),
    PRIMARY KEY (supplierID) ,
);
GRANT SELECT , INSERT , UPDATE ON VeterinaryClinic.Supplier TO supplies_admin;

/*
-------------------------------------------------------------------------------------------------------
Creates Table:Inventory
Holds all products and supplies the clinc stocks,
 tracks minimum stock levels for reorders,for both treatment and retails sales.
-------------------------------------------------------------------------------------------------------
*/

CREATE TABLE Inventory (
    inventoryID INT (19) NOT NULL AUTO_INCREMENT,
    itemName CHAR (50) NOT  NULL,
    itemType CHAR (30), 
    stockQuantity INT NOT NULL,
    reorderLevel INT, 
    unitPrice DECIMAL (10,2),
    retailPrice DECIMAL (10,2), 
    forSale BOOLEAN DEFAULT FALSE, 
    PRIMARY KEY (inventoryID)
);
GRANT SELECT, INSERT, UPDATE  ON VeterinaryClinic.Inventory TO  supplies_admin ;

/*
--------------------------------------------------------------------------------------------------------
Creates Table: SupplyOrder
Tracks all orders placed to suppliers and holds all order details.
Links to supplier for supplier details and staff for staff making order details.
--------------------------------------------------------------------------------------------------------
*/

CREATE TABLE  SupplyOrder(
    orderID INT(20) NOT NULL AUTO_INCREMENT,
    supplierID INT (18) NOT NULL,
    staffID INT (7) NOT NULL , 
    orderDate DATE NOT NULL,
    deliveryDate DATE ,
    orderStatus CHAR (20) DEFAULT 'Pending', 
    totalCost DECIMAL (10,2),
    PRIMARY KEY (orderID) ,
    FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID) ON  DELETE RESTRICT,
    FOREIGN KEY (staffID) REFERENCES Staff(staffID) ON DELETE RESTRICT ,
);
GRANT SELECT, INSERT, UPDATE ON  VeterinaryClinic.SupplyOrder  TO supplies_admin ;

/*
---------------------------------------------------------------------------------------------------------
Creates Table: OrderItem
Holds all order quantities and price for each order item.
Links Orders to Inventory table for unit pricing and reordering 
---------------------------------------------------------------------------------------------------------
*/
CREATE TABLE OrderItem(
    orderItemID INT (21) NOT NULL AUTO_INCREMENT,
    orderID INT (20) NOT NULL ,
    inventoryID INT(19) NOT NULL ,
    quantityOrdered INT NOT NULL ,
    unitCost DECIMAL (10,2),
    PRIMARY KEY (orderItemID),
    FOREIGN KEY (orderID) REFERENCES  SupplyOrder (orderID) ON DELETE RESTRICT ,
    FOREIGN KEY (inventoryID) REFERENCES Inventory(inventoryID) ON DELETE RESTRICT ,
);
GRANT SELECT, INSERT, UPDATE ON VeterinaryClinic.OrderItem  TO supplies_admin ;

/*
--------------------------------------------------------------------------------------------------------
Creates Table: ProductSale
Holds all retails sales details .
--------------------------------------------------------------------------------------------------------
*/

CREATE TABLE ProductSale(
    saleID INT (22) NOT NULL  AUTO_INCREMENT ,
    customerID INT (10) NOT NULL ,
    staffID INT(7) NOT NULL, 
    saleDate DATE NOT NULL ,
    totalAmount DECIMAL (10,2) NOT NULL,
    paymentMethod CHAR (20) ,
    PRIMARY KEY (saleID),
    FOREIGN KEY (customerID) REFERENCES Customer (customerID) ON DELETE RESTRICT ,
    FOREIGN KEY (staffID) REFERENCES Staff(staffID) ON DELETE RESTRICT ,
);
GRANT SELECT, INSERT , UPDATE ON VeterinaryClinic.ProductSale TO reception ;

/*
----------------------------------------------------------------------------------------------------------
Creates Table: SaleItem
Holds all sale item quanties and price information.
Links sales to inventory items. 
----------------------------------------------------------------------------------------------------------
*/
CREATE TABLE SaleItem(
    saleItemID INT (23) NOT NULL AUTO_INCREMENT,
    saleID INT (22) NOT NULL ,
    inventoryID INT (19) NOT NULL ,
    quantitySold INT NOT NULL ,
    unitPrice DECIMAL (10,2) ,
    PRIMARY KEY (saleItemID),
    FOREIGN KEY (saleID) REFERENCES ProductSale (saleID) ON DELETE RESTRICT,
    FOREIGN KEY (inventoryID) REFERENCES Inventory(inventoryID) ON DELETE RESTRICT,
);
GRANT SELECT,  INSERT, UPDATE ON VeterinaryClinic.SaleItem TO reception;

/*
Creates Indexes for frequently searched and joined columns.
Quick and effient look up for common searches such as supply order and staff id,
order item and inventory and sales items and iventory.
*/
CREATE  INDEX idx_supplyorder_supplier ON SupplyOrder (supplierID) ;
CREATE INDEX idx_supplyorder_staff ON SupplyOrder (staffID) ;
CREATE INDEX idx_orderitem_order ON OrderItem (orderID);
CREATE INDEX idx_orderitem_inventory ON OrderItem (inventoryID) ;
CREATE INDEX idx_productsale_customer ON ProductSale (customerID);
CREATE INDEX idx_saleitem_sale ON SaleItem  (saleID);
CREATE INDEX idx_saleitem_inventory ON SaleItem (inventoryID) ;


---------------------------------------------------------------------------------------------------------------
--Business Management Views
---------------------------------------------------------------------------------------------------------------

/*
---------------------------------------------------------------------------------------------------------------
View 1: Financial Overview
Gives a financial overview of bussiness that business owner/manager access only.
---------------------------------------------------------------------------------------------------------------
*/
 CREATE VIEW  vw_FinancialOverview  AS
SELECT 

    'Revenue' AS  category,
    (SELECT COALESCE(SUM(billTotal), 0) FROM Billing WHERE billPaid = TRUE) +
    (SELECT COALESCE(SUM(totalAmount), 0) FROM ProductSale)  AS amount

UNION ALL

SELECT 
    'Expenses' AS category,
    (SELECT COALESCE(SUM(totalCost), 0) FROM SupplyOrder WHERE orderStatus = 'Delivered')  +
    (SELECT COALESCE(SUM(salary), 0) FROM Staff) AS amount ;

/*
---------------------------------------------------------------------------------------------------------------
View 2: StaffDirectory
creates a staff directory so full staff table with salaries has restricted access.
---------------------------------------------------------------------------------------------------------------
*/
CREATE VIEW vw_StaffDirectory  AS
SELECT 
    employeeName, jobTitle , phone, email , hireDate,employmentStatus
FROM Staff ;


---------------------------------------------------------------------------------------------------------------
--Operational Views for day to day running of the vetenarary clinic
---------------------------------------------------------------------------------------------------------------

/*
---------------------------------------------------------------------------------------------------------------
View 3:Daily Appointments
Shows appointment schedule for the day.
---------------------------------------------------------------------------------------------------------------
*/
CREATE VIEW  vw_DailyAppointments  AS
SELECT 
    a.appointmentID, a.appointmentDate ,a.appointmentStatus , s.employeeName AS veterinarian, c.customerName,
    c.phone AS  customerPhone, an.animalName, an.species , a.appointmentReason
FROM Appointment a
INNER JOIN Staff s ON a.staffID  = s.staffID
INNER JOIN Animal an ON a.animalID =  an.animalID
INNER JOIN Customer c ON an.customerID = c.customerID
WHERE DATE(a.appointmentDate) = CURDATE() ;

/* 
------------------------------------------------------------------------------------------------------------------
view 4: Inventory Reorder Alert
For administrators to show only items that need to be reordered for quick and efficiant look up.
------------------------------------------------------------------------------------------------------------------
*/
CREATE VIEW vw_ReorderAlert  AS
SELECT 
    inventoryID ,itemName, itemType ,stockQuantity,reorderLevel,
    (reorderLevel - stockQuantity)  AS quantityNeeded
FROM Inventory
WHERE stockQuantity <= reorderLevel ;

/*
View 5: Outstanding Bills
For administrators to have a quick look up for outstanding bills.
shows what owed amount is including instalment payment argreements and how many days over due.
*/
CREATE VIEW  vw_OutstandingBills  AS
SELECT 
    b.billingID ,c.customerName,c.phone ,an.animalName,  b.billDate , b.billTotal,
    COALESCE(SUM(p.amount), 0) AS amountPaid ,
    (b.billTotal - COALESCE(SUM(p.amount), 0))  AS amountOwing ,
    DATEDIFF(CURDATE(), b.billDate) AS  daysOverdue
FROM Billing b
INNER JOIN Customer c ON b.customerID  = c.customerID
INNER JOIN Appointment a ON b.appointmentID =  a.appointmentID
INNER JOIN Animal an ON a.animalID =  an.animalID
LEFT JOIN Payment p ON b.billingID  = p.billingID
WHERE b.billPaid = FALSE
GROUP BY b.billingID , c.customerName, c.phone , an.animalName, b.billDate, b.billTotal ;

-----------------------------------------------------------------------------------------------------------
--Manager and Business Owner full access permission
-----------------------------------------------------------------------------------------------------------
GRANT ALL PRIVILEGES  ON VeterinaryClinic.* TO manager, Business_Owner ;

--------------------------------------------------------------------------
-- End of database_schema
--------------------------------------------------------------------------