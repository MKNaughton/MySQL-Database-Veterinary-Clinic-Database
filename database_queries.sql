/*
-------------------------------------------------------------------------------------
Veterinary Clinic Database - Query Library
Business Operations & Data Analysis
-------------------------------------------------------------------------------------
*/
--------------------------------------------------------------------------
-- Veterinary Clinic Database - Query Library
-- Business Operations & Data Analysis
--------------------------------------------------------------------------

USE VeterinaryClinic;

--------------------------------------------------------------------------
-- STAFF MANAGEMENT
--------------------------------------------------------------------------

-- Retrieve complete staff roster with salary and employment details
SELECT * FROM Staff;

-- Look up specific staff member contact information by ID
SELECT email, phone
FROM Staff
WHERE staffID = 5821;

-- View staff directory (excludes sensitive salary information)
SELECT * FROM vw_StaffDirectory;

-- Update staff employment status (e.g., return from leave)
UPDATE Staff
SET employmentStatus = 'Active'
WHERE staffID = 9341
AND employmentStatus = 'On Leave';

--------------------------------------------------------------------------
-- APPOINTMENT SCHEDULING & MANAGEMENT
--------------------------------------------------------------------------

-- Retrieve all appointments for a specific date
SELECT 
    a.appointmentID,
    s.employeeName AS veterinarian,
    c.customerName,
    an.animalName,
    a.appointmentDate,
    a.appointmentReason,
    a.appointmentStatus
FROM Appointment a
INNER JOIN Staff s ON a.staffID = s.staffID
INNER JOIN Animal an ON a.animalID = an.animalID
INNER JOIN Customer c ON an.customerID = c.customerID
WHERE DATE(a.appointmentDate) = '2025-12-08';

-- View today's appointment schedule
SELECT * FROM vw_DailyAppointments;

-- Schedule new appointment
INSERT INTO Appointment (appointmentID, staffID, animalID, appointmentDate, appointmentReason, appointmentStatus)
VALUES (899500, 6374, 847201, '25/02/2026 10:30:00', 'Annual vaccination booster', 'Scheduled');

-- Mark appointment as completed
UPDATE Appointment
SET appointmentStatus = 'Completed'
WHERE appointmentID = 845318
AND appointmentStatus = 'Scheduled';

-- Remove cancelled appointment
DELETE FROM Appointment
WHERE appointmentID = 851938
AND appointmentStatus = 'Scheduled';

-- Monthly appointment volume analysis
SELECT 
    DATE_FORMAT(appointmentDate, '%Y-%m') AS month,
    COUNT(*) AS totalAppointments,
    COUNT(CASE WHEN appointmentStatus = 'Completed' THEN 1 END) AS completed,
    COUNT(CASE WHEN appointmentStatus = 'Scheduled' THEN 1 END) AS scheduled,
    COUNT(CASE WHEN appointmentStatus = 'Cancelled' THEN 1 END) AS cancelled
FROM Appointment
GROUP BY DATE_FORMAT(appointmentDate, '%Y-%m')
ORDER BY month DESC;

--------------------------------------------------------------------------
-- CUSTOMER & ANIMAL RECORDS
--------------------------------------------------------------------------

-- Register new customer
INSERT INTO Customer (customerID, customerName, phone, email, address)
VALUES (789456, 'Brian Collins', '0879988776', 'brian.collins@gmail.com', '88 Church Street, Wicklow');

-- Update customer contact information
UPDATE Customer
SET phone = '0871234000',
    email = 'john.murphy.updated@gmail.com'
WHERE customerID = 104829;

-- Register new animal for existing customer
INSERT INTO Animal (animalID, customerID, animalName, species, breed, gender, dateOfBirth)
VALUES (567890, 104829, 'Shadow', 'Cat', 'Domestic Shorthair', 'Male', '10/03/2024');

-- Update animal breed information
UPDATE Animal
SET breed = 'Labrador Retriever Mix'
WHERE animalID = 847201;

-- Count animals by species
SELECT 
    species,
    COUNT(*) AS numberOfAnimals,
    COUNT(DISTINCT customerID) AS numberOfOwners
FROM Animal
GROUP BY species
ORDER BY numberOfAnimals DESC;

-- Customer lifetime value analysis
SELECT 
    c.customerID,
    c.customerName,
    c.phone,
    COUNT(DISTINCT an.animalID) AS numberOfPets,
    COUNT(DISTINCT a.appointmentID) AS totalVisits,
    SUM(b.billTotal) AS lifetimeValue,
    AVG(b.billTotal) AS avgVisitCost,
    MAX(a.appointmentDate) AS lastVisit,
    DATEDIFF(CURDATE(), MAX(a.appointmentDate)) AS daysSinceLastVisit
FROM Customer c
LEFT JOIN Animal an ON c.customerID = an.customerID
LEFT JOIN Appointment a ON an.animalID = a.animalID
LEFT JOIN Billing b ON a.appointmentID = b.appointmentID
GROUP BY c.customerID, c.customerName, c.phone
HAVING COUNT(DISTINCT a.appointmentID) > 0
ORDER BY lifetimeValue DESC;

--------------------------------------------------------------------------
-- MEDICAL RECORDS & TREATMENT HISTORY
--------------------------------------------------------------------------

-- Retrieve complete medical history for specific animal
SELECT 
    an.animalName,
    an.species,
    an.breed,
    mr.recordDate,
    mr.diagnosis,
    mr.treatment,
    mr.medication,
    mr.followUpRequired
FROM MedicalRecord mr
INNER JOIN Animal an ON mr.animalID = an.animalID
WHERE an.animalID = 847201
ORDER BY mr.recordDate DESC;

-- Add medical record following appointment
INSERT INTO MedicalRecord (recordID, appointmentID, animalID, diagnosis, treatment, medication, followUpRequired, followUpNotes, recordDate)
VALUES (520000, 829401, 847201, 'Gastroenteritis - resolved', 'Follow-up examination shows full recovery', 'None', FALSE, NULL, '22/12/2025');

-- Identify animals requiring follow-up care
SELECT 
    c.customerName,c.phone,an.animalName,an.species, mr.recordDate,mr.diagnosis, mr.followUpNotes,
    DATEDIFF(CURDATE(), mr.recordDate)  AS daysSinceVisit
FROM  MedicalRecord mr
INNER JOIN Animal an  ON mr.animalID =  an.animalID
INNER JOIN Customer c ON an.customerID = c.customerID
WHERE mr.followUpRequired = TRUE
ORDER BY mr.recordDate ASC ;

-- Staff with NULL qualifications.
SELECT 
    employeeName,jobTitle, qualifications,
        CASE 
        WHEN qualifications IS NULL THEN  'No Formal Qualification Listed'
        ELSE  qualifications
    END AS  qualificationStatus
FROM  Staff;

--------------------------------------------------------------------------
-- BILLING & PAYMENT PROCESSING.
--------------------------------------------------------------------------

-- Calculate total revenue and bill count.
SELECT 
    SUM(billTotal)  AS totalRevenue,
    COUNT(billingID) AS numberOfBills,
    AVG(billTotal) AS  averageBillAmount
FROM  Billing
WHERE billPaid = TRUE;

-- View outstanding bills report
SELECT * FROM vw_OutstandingBills ;

-- Identify customers with unpaid balances
SELECT 
    c.customerName,c.phone, c.email, b.billTotal,
    COALESCE(SUM(p.amount), 0)  AS  amountPaid,
    (b.billTotal - COALESCE(SUM(p.amount),0)) AS amountOwing
FROM  Customer c
INNER JOIN Billing b  ON c.customerID = b.customerID
LEFT  JOIN Payment p ON b.billingID = p.billingID
WHERE b.billPaid =  FALSE
GROUP BY c.customerName, c.phone, c.email, b.billTotal, b.billingID
HAVING amountOwing > 0;

-- Process payment transaction
INSERT INTO  Payment (paymentID,billingID,paymentDate,amount,paymentMethod)
VALUES (920500, 710458, '03/02/2026', 150.00, 'Bank Transfer') ;

-- Mark bill as paid when payment received
UPDATE  Billing
SET billPaid =  TRUE
WHERE billingID = 710458 ;

-- Overdue accounts analysis with collection priority
SELECT 
    c.customerName , c.phone, c.email,b.billDate,
    b.billTotal,
    COALESCE(SUM(p.amount),0) AS  amountPaid,
    (b.billTotal - COALESCE(SUM(p.amount),0))  AS amountOwing,
    DATEDIFF(CURDATE(), b.billDate) AS  daysOverdue,
    CASE 
        WHEN DATEDIFF(CURDATE(),b.billDate)  > 60  THEN 'Critical - Contact Immediately'
        WHEN DATEDIFF(CURDATE(),b.billDate)  > 30  THEN 'Urgent - Send Reminder'
        ELSE 'Recent - Monitor'
    END AS  collectionPriority
FROM Billing b
INNER JOIN Customer c ON  b.customerID  = c.customerID
LEFT  JOIN  Payment p ON b.billingID =  p.billingID
WHERE b.billPaid = FALSE
GROUP BY  c.customerName, c.phone,c.email, b.billDate,  b.billTotal,  b.billingID
HAVING amountOwing >  0
ORDER BY daysOverdue DESC;

-- Revenue breakdown by service category
SELECT 
    CASE 
        WHEN a.appointmentReason LIKE '%vaccination%' THEN 'Vaccination'
        WHEN a.appointmentReason LIKE '%check%'  THEN 'Routine Check-up'
        WHEN a.appointmentReason LIKE '%dental%' THEN 'Dental Care'
        WHEN a.appointmentReason LIKE '%Hoof%' OR a.appointmentReason LIKE '%trim%' THEN 'Farm Animal Care'
        ELSE 'Other Treatment'
    END AS appointmentCategory,
    COUNT(a.appointmentID) AS numberOfAppointments,
    SUM(b.billTotal) AS totalRevenue,
    AVG(b.billTotal) AS avgRevenue
FROM Appointment a
INNER  JOIN Billing b ON  a.appointmentID = b.appointmentID
WHERE  a.appointmentStatus  = 'Completed'
GROUP BY appointmentCategory
ORDER BY  totalRevenue DESC ;

--------------------------------------------------------------------------
-- INVENTORY MANAGEMENT
--------------------------------------------------------------------------

-- Check current inventory stock levels
SELECT * FROM vw_ReorderAlert;

-- Update stock levels after receiving supplier delivery
UPDATE Inventory
SET  stockQuantity  = stockQuantity + 40
WHERE inventoryID  = 401082;

-- Inventory turnover and reorder status analysis
SELECT 
    i.itemName, i.itemType, i.stockQuantity,i.reorderLevel,
    COUNT(oi.orderItemID)AS timesOrdered,
    SUM(oi.quantityOrdered) AS  totalOrdered,
    CASE 
        WHEN i.stockQuantity <= i.reorderLevel  THEN 'Critical - Order Now'
        WHEN i.stockQuantity <=  i.reorderLevel * 1.5 THEN  'Low - Monitor Closely'
        ELSE 'Adequate Stock'
    END AS stockStatus
FROM  Inventory i
LEFT JOIN OrderItem oi ON i.inventoryID = oi.inventoryID
WHERE  i.forSale = FALSE
GROUP BY i.itemName,  i.itemType, i.stockQuantity, i.reorderLevel
ORDER BY stockStatus,i.itemName;

-- Remove cancelled supply order
DELETE FROM OrderItem
WHERE orderID  = 606951;

DELETE FROM SupplyOrder
WHERE orderID =  606951
AND orderStatus = 'Pending';

-- Pending orders with NULL delivery dates 
SELECT 
    orderID, orderDate, deliveryDate,orderStatus,
    CASE 
    WHEN deliveryDate  IS NULL THEN 'Awaiting Delivery'
    ELSE  'Delivered'
    END AS  deliveryStatus
FROM SupplyOrder;

--------------------------------------------------------------------------
-- RETAIL SALES MANAGEMENT
--------------------------------------------------------------------------

-- Remove incorrect sale entry
DELETE  FROM SaleItem
WHERE saleItemID  = 903847;

--------------------------------------------------------------------------
-- STAFF PERFORMANCE & PRODUCTIVITY
--------------------------------------------------------------------------

-- Veterinarian productivity and revenue analysis
SELECT 
    s.employeeName,s.jobTitle,
    COUNT(a.appointmentID) AS totalAppointments,
    SUM(b.billTotal)  AS revenueGenerated,
    AVG(b.billTotal) AS avgRevenuePerAppointment
FROM  Staff s
INNER JOIN Appointment a ON s.staffID =  a.staffID
INNER JOIN Billing b  ON a.appointmentID  = b.appointmentID
WHERE s.jobTitle = 'Veterinarian'
AND  a.appointmentStatus  = 'Completed'
GROUP BY  s.employeeName, s.jobTitle
ORDER BY  revenueGenerated  DESC ;

--------------------------------------------------------------------------
-- COMPREHENSIVE REPORTING
--------------------------------------------------------------------------

-- Complete customer appointment history with financial summary
SELECT 
    c.customerName,c.phone, an.animalName,  an.species, a.appointmentDate, s.employeeName AS veterinarian,
    a.appointmentReason, mr.diagnosis,  b.billTotal,
    CASE 
        WHEN b.billPaid = TRUE  THEN 'Paid in Full'
        WHEN b.paidInInstalments  = TRUE THEN 'Payment Plan Active'
        ELSE 'Payment Outstanding'
    END AS  paymentStatus
FROM Customer c
INNER JOIN Animal an ON  c.customerID  = an.customerID
INNER JOIN Appointment a ON an.animalID  = a.animalID
INNER JOIN Staff s  ON a.staffID = s.staffID
LEFT JOIN MedicalRecord mr ON a.appointmentID = mr.appointmentID
LEFT JOIN Billing b ON a.appointmentID = b.appointmentID
WHERE  a.appointmentStatus =  'Completed'
ORDER BY a.appointmentDate DESC;

-- Financial overview from management view
SELECT * FROM  vw_FinancialOverview;

--------------------------------------------------------------------------
-- DATA INTEGRITY DEMONSTRATIONS
--------------------------------------------------------------------------

SELECT  billTotal
FROM Billing
WHERE billingID  = 701234;

SELECT 
    customerID,customerName, phone, email,  address
FROM Customer
WHERE customerID =  104829;

SELECT 
   recordID, diagnosis , followUpRequired, followUpNotes
FROM MedicalRecord
WHERE followUpNotes IS NULL ;

--------------------------------------------------------------------------
-- End of database_queries
--------------------------------------------------------------------------