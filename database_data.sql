--------------------------------------------------------------------------
--Veterinary Clinic Data
--------------------------------------------------------------------------

USE vetenararyClinic;

--------------------------------------------------------------------------
--Staff Data
--------------------------------------------------------------------------
INSERT INTO Staff (staffID,jobTitle, employeeName, phone, email,salary, hireDate, qualifications,employmentStatus) VALUES

(4412,'Veterinary Manager', 'Brendon Smith', '0838630031', 'brendonsmith@vetclinic.ie', 66500.00,'15/03/2012','BA Business Management','Active'),

(5821, 'Veterinarian', 'Dr. Joe O''Donnell', '0830249888' , 'joeodonnell@vetclinic.ie',78000.00,'01/06/2015','BVM & S', 'Active'),
(6374,'Veterinarian', 'Dr. Mary Burke', '0865437890', 'maryburke@vetclinic.ie'78000.00, '10/09/2017','BVM & S', 'Active' ),
(7148,'Veterinarian', 'Dr. Sarah Talbot', '0872536444', 'sarahtalbot@vetclinic.ie', 72000.00,'20/01/2019', 'DVM','Active'),

(3295,'Veterinary Nurse', 'Sandra O''Neill', '0852221111', 'sandraoneill@vetclinic.ie',42000.00, '08/04/2016','HDip in Veterinary Nursing', 'Active'),
(8817, 'Veterinary Nurse', 'Laura Cleary', '0853634244', 'lauracleary@vetclinic.ie', 39000.00, '17/02/2020',' Diploma in Veterinary Nursing','Active'),
(2056,'Veterinary Nurse', 'Sinead Kearns', '0852721488', 'sineadkearns@vetclinic.ie',41000.00, '03/07/2018','HDip in Veterinary Nursing', 'Active'),

(9341,'Receptionist', 'Roisin Mills', '0853721455', 'roisinmills@vetclinic.ie' 34000.00,'22/11/2014', 'Office Administration Certificate', 'On Leave'),
(1067, 'Receptionist', 'John Kelly', '0863821433', 'johnKelly@vetclinic.ie','30000.00,'09/08/2021', 'NULL', 'Active'),

(6729,'Veterinary administrator', 'Mark Andrews', '0834209624', 'markandrews@vetclinic.ie', 45000.00, '14/01/2016', 'Diploma in Veterinary Administration ', 'Active'),
(4483, 'Bills and Payments administrator', 'Sarah Lee', '0857245973', 'sarahlee@vetclinic.ie',38000.00,'22/05/2019', 'Bookkeeping Certificate', 'Active'),
(7752, 'Supplies administrator', 'Martin Tool', '0875672238', 'martintool@vetclinic.ie, 37000.00,'11/10/2020', 'Supply Chain Management Certificate', 'Active');

--------------------------------------------------------------------------
-- Customer Data
--------------------------------------------------------------------------
INSERT INTO Customer (customerID,customerName, phone, email, address) VALUES

(104829, 'John Murphy', '0871234567', 'john.murphy@gmail.com', '12 Oak Drive, Dublin '),
(203847,'Emma Ryan', '0862345678', 'emma.ryan@gmail.com', '45 Beach Road, Salthill,Dunleary,Dublin '),
(312056, 'Michael O''Brien', '0853456789','mobrien@hotmail.com', '7 Park Avenue, whitehall, Dublin'),
(428371, 'Sarah Kelly', '0864567890', 'skelly@outlook.ie', '23 Main Street, Oranmore,Dublin'),
(537294,'Patrick Walsh', '0875678901','pwalsh@gmail.com', 'Ballybane Farm, wicklow'),
(641058,'Claire Brennan', '0866789012', 'cbrennan@outlook.ie', '56 College Road, Dublin'),
(759483'David Connor', '0857890123', 'dconnor@gmail.com', '89 Dublin Road, Dublin');
(862147, 'Siobhan Fitzgerald', '0841236547', 'siobhan.fitz@gmail.com', '14 Wicklow Town Centre, Wicklow'),
(973612, 'Niall Doyle', '0879876543','niall.doyle@outlook.ie','Glenmalure Farm, Wicklow'),
(108574, 'Aoife McCarthy','0865554433', 'aoife.mc@gmail.com', '33 Pembroke Road, Dublin '),
(214963, 'Conor Byrne', '0874433221', 'conor.byrne@hotmail.com', 'Brookfield Farm, Wicklow'),
(329841, 'Fiona O''Sullivan','0863322110', 'fiona.osullivan@gmail.com','78 Rathmines Road, Dublin '),
(447205, 'Declan Kavanagh', '0852211009', 'dkavanagh@outlook.ie', 'Glenmore Farm, Wicklow'),
(553718, 'Aisling Gallagher', '0871100998', 'aisling.gall@gmail.com', '22 Clontarf Road, Dublin'),
(668432, 'Sean Harrington', '0860099887', 'sean.harrington@gmail.com', 'Laragh Estate, Wicklow');

--------------------------------------------------------------------------
-- Animal Data
--------------------------------------------------------------------------
INSERT INTO Animal (animalID, customerID, animalName, species, breed, gender, dateOfBirth) VALUES

(847201,104829, 'Smokey', 'Dog', 'Labrador Retriever', 'Male', '15/03/2021'),
(847265, 104829, 'Bella','Cat', 'Siamese', 'Female','22/08/2022'),
(103847, 312056, 'Max', 'Dog', 'German Shepherd','Male','30/11/2018'),
(215603, 428371, 'Luna', 'Cat', 'Tabby', 'Female','05/06/2023'),
(215688, 428371, 'Rocky', 'Dog', 'Beagle', 'Male','12/09/2020'),
(885203, 108574, 'Milo', 'Dog', 'French Bulldog', 'Male', '28/02/2023'),
(107293, 329841, 'Maggie', 'Dog', 'Poodle', 'Female','16/07/2021'),
(107358, 329841, 'Tiger', 'Cat', 'Bengal', 'Male', '01/09/2022'),
(329614, 553718, 'Pip', 'Dog', 'Jack Russell', 'Male','09/12/2020'),

(338142,537294,'WX26838', 'Cow', 'Holstein', 'Female','20/04/2017'),
(338207, 537294, 'WX26841', 'Donkey','Standard', 'Female','14/07/2016'),
(338291, 537294, 'WX26855', 'Cow', 'Jersey','Female','28/02/2019'),
(338356, 537294, 'Copper', 'Horse', 'Irish Sport Horse', 'Male','08/03/2015'),
(996417,214963, 'BF38102', 'Cow','Jersey', 'Female','04/10/2017'),
(996483, 214963, 'BF38115', 'Sheep', 'Suffolk', 'Female', '18/06/2019'),
(996548, 214963, 'BF38119', 'Sheep', 'Suffolk', 'Male', '18/02/2024'),
(996614, 214963, 'Finn', 'Horse', 'Irish Cob','Male','30/09/2014'),
(218407, 447205, 'GL55301', 'Cow', 'Angus', 'Female', '14/03/2018'),
(218472, 447205, 'GL55308', 'Donkey', 'Miniature', 'Male', '20/11/2018'),
(218538, 447205, 'Saoirse', 'Horse', 'Arab', 'Female', '22/04/2013'),
(440829, 668432, 'LR72401', 'Cow', 'Hereford', 'Female','03/08/2022'),
(440894, 668432, 'LR72409', 'Sheep', 'Dorper', 'Female','11/08/2020'),
(440958, 668432, 'Cú Chulainn', 'Horse', 'Warmblood', 'Male', '2012-06-17');

--------------------------------------------------------------------------
-- Appointment Data
--------------------------------------------------------------------------
INSERT INTO Appointment (appointmentID, staffID, animalID, appointmentDate, appointmentReason, appointmentStatus) VALUES

(829401, 5821, 847201, '08/12/2025 10:00:00', 'Not eating, vomiting', 'Completed'),
(829467, 6374, 921438, '08/12/2025 11:30:00', 'Annual check-up', 'Completed'),
(830152, 5821, 338207, '10/12/2015 14:00:00', 'Limping on front left leg', 'Completed'),
(831048, 7148, 847265, '12/12/2025 09:00:00', 'Vaccination booster', 'Completed'),
(832203, 5821, 103847, '14/12/2025 15:30:00', 'Skin rash, excessive scratching', 'Completed'),
(833517, 6374, 215603, '15/12/2025 10:30:00', 'Eye discharge, squinting', 'Completed'),
(834821, 5821, 338356, '17/12/2025 13:00:00', 'Hoof trimming and check-up', 'Completed'),
(835094, 7148, 215688, '18/12/2025 11:00:00', 'Coughing, loss of appetite', 'Completed'),
(836402, 5821, 663048, '20/12/2025 09:30:00', 'Routine check-up', 'Completed'),
(837518, 6374, 551274, '21/12/2025 14:00:00', 'Limping, swollen joint', 'Completed'),
(838247, 5821, 774392, '10/01/2026 10:00:00', 'Annual vaccination', 'Completed'),
(839163, 7148, 774586, '10/01/2026 11:30:00', 'Weight loss, lethargy', 'Completed'),
(840529, 5821, 996614, '10/01/2026 13:00:00', 'Lameness check', 'Completed'),
(841374, 6374, 885203, '11/01/2026 09:00:00', 'Dental check', 'Completed'),
(842608, 5821, 107293, '11/01/2026 15:00:00', 'Routine check-up', 'Completed'),
(843751, 7148, 996483, '12/02/2026 10:30:00', 'Skin irritation', 'Completed'),
(844092, 5821, 218538, '12/02/2026 14:00:00', 'Hoof care, routine trim', 'Completed'),

(845318, 5821, 329614, '13/02/2026 10:00:00', 'Annual vaccination due', 'Scheduled'),
(846427, 6374, 440958, '13/02/2026 11:00:00', 'Follow-up examination', 'Scheduled'),
(847539, 7148, 921504, '13/02/2026 14:30:00', 'Dental cleaning', 'Scheduled'),
(848652, 5821, 442819, '14/02/2026 09:00:00', 'Routine check-up', 'Scheduled'),
(849714, 6374, 107358, '14/02/2026 13:00:00', 'Vaccination booster', 'Scheduled'),
(850826, 5821, 338291, '14/02/2026 15:00:00', 'Annual check-up', 'Scheduled'),
(851938, 7148, 440894, '15/02/2026 10:00:00', 'Lameness assessment', 'Scheduled'),
(852041, 5821, 218407, '15/02/2026 11:30:00', 'Routine check-up', 'Scheduled');

--------------------------------------------------------------------------
-- Medical Record Data
--------------------------------------------------------------------------

INSERT INTO MedicalRecord (recordID, appointmentID, animalID, diagnosis, treatment, medication, followUpRequired, followUpNotes, recordDate) VALUES

(501283, 829401, 847201, 'Gastroenteritis', 'Fluid therapy, bland diet', 'Metoclopramide 5mg twice daily for 5 days', TRUE, 'Check-up in 2 weeks if symptoms persist', '08/12/2025'),
(502147, 829467, 921438, 'Healthy - routine check-up', 'None required', 'None', FALSE,NULL, '08/12/2025'),
(503094, 830152, 338207, 'Mild sprain in carpus joint', 'Rest, cold compress', 'Carprofen 50mg once daily for 7 days', TRUE, 'Re-examine in 10 days', '10/12/2025'),
(504362, 831048, 847265, 'Vaccination administered', 'FVRCP booster given', 'None', FALSE, 'Next booster due December 2026', '12/12/2025'),
(505829, 832203, 103847, 'Allergic dermatitis','Topical treatment, dietary changes', 'Hydrocortisone cream, Antihistamine tablets', TRUE, 'Follow-up in 3 weeks', '14/12/2025'),
(506741, 833517, 215603, 'Conjunctivitis', 'Eye drops, keep area clean', 'Chloramphenicol eye drops 4 times daily for 7 days', TRUE, 'Return if no improvement in 5 days', '15/12/2025'),
(507418, 834821, 338356, 'Sound hooves, routine trim', 'Hooves trimmed', 'None',FALSE, 'Next trim in 8 weeks', '17/12/2025'),
(508953, 835094, 215688, 'Kennel cough', 'Rest, isolation from other animals','Doxycycline 100mg twice daily for 10 days', TRUE, 'Monitor, return if breathing worsens', '18/12/2025'),
(509207, 836402, 663048, 'Healthy - routine check-up', 'None required', 'None', FALSE, NULL,'20/12/2025'),
(510634, 837518, 551274, 'Early stage arthritis', 'Joint supplement, reduced activity', 'Rimadyl 75mg once daily', TRUE, 'Re-assess in 4 weeks', '21/12/2025'),
(511842, 838247, 774392, 'Vaccination administered', 'Annual booster given', 'None', FALSE, 'Next due January 2027', '10/01/2026'),
(512975, 839163, 774586,'Hypothyroidism','Medication management, dietary adjustment', 'Levothyroxine 0.2mg daily', TRUE, 'Blood work in 6 weeks', '10/01/2026'),
(513401, 840529, 996614, 'Mild lameness, stiffness', 'Rest, physiotherapy exercises', 'Phenylbutazone 1g twice daily for 5 days', TRUE, 'Re-examine in 2 weeks', '10/01/2026'),
(514068, 841374, 885203, 'Worn teeth, early periodontal disease', 'Dental scaling performed', 'Antibiotic paste for 10 days', TRUE, 'Follow-up dental check in 3 months', '11/01/2026'),
(515729, 842608, 107293, 'Healthy - routine check-up', 'None required', 'None', FALSE, NULL, '11/01/2026'),
(516384, 843751, 996483, 'Contact dermatitis',G'Topical treatment, identify allergen', 'Betamethasone cream twice daily for 7 days', TRUE, 'Return if not improving in 5 days', '12/02/2026'),
(517941, 844092, 218538, 'Sound hooves, routine trim', 'Hooves trimmed', 'None', FALSE, 'Next trim in 8 weeks', '12/02/2026');

--------------------------------------------------------------------------
-- Billing Data
--------------------------------------------------------------------------
INSERT INTO Billing (billingID, appointmentID, customerID, billDate, billTotal, paidInInstalments, billPaid) VALUES

(701234, 829401, 104829, '08/12/2025', 125.00, FALSE, TRUE),
(702847, 829467, 203847, '08/12/2025', 75.00, FALSE, TRUE),
(703591, 830152, 537294, '10/12/2025', 95.00, FALSE, TRUE),
(704418, 831048, 104829, '12/12/2025', 45.00, FALSE, TRUE),
(705263, 832203, 312056, '14/12/2025', 110.00, TRUE, FALSE),
(706182, 833517, 428371, '15/12/2025', 85.00, FALSE, TRUE),
(707934, 834821, 537294, '17/12/2025', 180.00, TRUE, FALSE),
(708547, 835094, 428371, '18/12/2025', 120.00, FALSE, TRUE),
(709321, 836402, 862147, '20/12/2025', 75.00, FALSE, TRUE),
(710458, 837518, 759483, '21/12/2025', 150.00, FALSE, FALSE),
(711206, 838247, 973612, '10/01/2026', 60.00, FALSE, TRUE),
(712843, 839163, 973612, '10/01/2026', 200.00, TRUE, FALSE),
(713517, 840529, 214963, '10/01/2026', 220.00, FALSE, TRUE),
(714692, 841374, 108574, '11/01/2026', 95.00, FALSE, TRUE),
(715384, 842608, 329841, '11/01/2026', 75.00, FALSE, FALSE),
(716028, 843751, 214963, '12/02/2026', 65.00, FALSE, TRUE),
(717451, 844092, 447205, '12/02/2026', 160.00, FALSE, TRUE);

--------------------------------------------------------------------------
-- Payment Data
--------------------------------------------------------------------------

INSERT INTO Payment (paymentID, billingID, paymentDate, amount, paymentMethod) VALUES

(901234, 701234, '08/12/2025', 125.00, 'Credit Card'),
(902847, 702847, '08/12/2025', 75.00, 'Cash'),
(903591, 703591, '10/12/2025', 95.00, 'Debit Card'),
(904182, 704418, '12/12/2025', 45.00, 'Revolut'),
(905263, 706182, '15/12/2025', 85.00, 'Credit Card'),
(906471, 708547, '18/12/2025', 120.00, 'Cash'),
(907384, 709321, '20/12/2025', 75.00, 'Debit Card'),
(908529, 711206, '10/01/2026', 60.00, 'Revolut'),
(909147, 713517, '10/01/2026', 220.00, 'Bank Transfer'),
(910834, 714692, '11/01/2026', 95.00, 'Credit Card'),
(911206, 716028, '12/02/2026', 65.00, 'Cash'),
(912418, 717451, '12/02/2026', 160.00, 'Debit Card'),
(913052, 705263, '14/12/2025', 60.00, 'Cash'),
(913718, 705263, '21/12/2025', 30.00, 'Cash'),
(914234, 707934, '17/12/2025', 90.00, 'Bank Transfer'),
(914891, 707934, '24/12/2025', 60.00, 'Bank Transfer'),
(915407, 712843, '10/01/2026', 100.00, 'Credit Card'),
(916023, 712843, '17/01/2026', 60.00, 'Credit Card');

--------------------------------------------------------------------------
-- Supplier Data
--------------------------------------------------------------------------
INSERT INTO Supplier (supplierID, supplierName, contactPerson, phone, email, address, supplierType, paymentTerms) VALUES

(20147, 'Galway Veterinary Supplies Ltd', 'Tom Reilly', '01 7294239', 'orders@galvetsupply.ie', '15 Industrial Park, Dublin', 'Medical Supplies', 'Net 30'),
(21834, 'Irish Pet Food Co', 'Aoife Byrne','025 76543', 'trade@irishpetfood.ie', '8 Commerce Way, Cork', 'Pet Food', 'Net 21'),
(22591, 'Equine Care Ireland', 'Brian Nolan', '045 815233', 'supply@equinecare.ie', '22 Horse Lane, Kildare', 'Farm Supplies', 'Net 30') ,
(23408, 'National Medical Distributors', 'Karen Walsh', '01 4556677', 'vet.orders@nmd.ie', '100 Meath Street, Dublin 8', 'Medical Supplies', 'Net 45'),
(24716, 'Western Pet Products','James O''Connor', '061 644332', 'wholesale@westernpet.ie', '3 Retail Park, Limerick', 'Pet Food', 'Net 21' );
--------------------------------------------------------------------------
-- Invetory Data
--------------------------------------------------------------------------

INSERT INTO Inventory (inventoryID, itemName, itemType, stockQuantity, reorderLevel, unitPrice, retailPrice, forSale) VALUES

(401082, 'Carprofen 50mg tablets', 'Medication', 120, 30, 0.85, NULL, FALSE),
(402341, 'Metoclopramide 5mg tablets', 'Medication', 80, 20, 0.65, NULL, FALSE),
(403517, 'Chloramphenicol eye drops', 'Medication', 45, 15, 3.50, NULL, FALSE),
(404829, 'Doxycycline 100mg capsules', 'Medication', 60, 20, 0.90, NULL, FALSE),
(405193, 'Hydrocortisone cream 30g', 'Medication', 25, 10, 4.20, NULL, FALSE),
(406748, 'Phenylbutazone 1g sachets', 'Medication', 40, 12, 2.10, NULL, FALSE),
(407264, 'Levothyroxine 0.2mg tablets', 'Medication', 50, 15, 0.75, NULL, FALSE),
(408391, 'FVRCP Booster Vaccine', 'Vaccine', 30, 10, 12.50, NULL, FALSE),
(409527, 'Annual Booster Vaccine (Dog)', 'Vaccine', 35, 12, 15.00, NULL, FALSE),
(410846, 'Surgical Sutures Pack', 'Surgical Supply', 20, 8, 8.90, NULL, FALSE),
(411203, 'Antibiotic Paste 50g', 'Medication', 18, 8, 5.60, NULL, FALSE),
(412569, 'Copper Sulfate Solution 500ml', 'Medication', 15, 5, 6.80, NULL, FALSE),
(413714, 'Rimadyl 75mg tablets', 'Medication', 45, 15, 1.20, NULL, FALSE),
(414082, 'Betamethasone cream 30g', 'Medication', 22, 8, 4.80, NULL, FALSE),
(415938, 'Premium Dog Food 12kg', 'Pet Food', 45, 15, 28.00, 42.00, TRUE),
(416247, 'Premium Cat Food 4kg', 'Pet Food', 60, 20, 14.00, 21.00, TRUE),
(417083, 'Puppy Food 5kg', 'Pet Food', 30, 10, 18.00, 27.00, TRUE),
(418529, 'Kitten Food 2kg', 'Pet Food', 40, 12, 9.00, 13.50, TRUE),
(419641, 'Joint Supplement Tablets (Dog)', 'Supplement', 35, 10, 15.00, 24.00, TRUE),
(420317, 'Flea and Tick Treatment (Dog)', 'Treatment', 50, 18, 8.50, 13.00, TRUE),
(421854, 'Flea and Tick Treatment (Cat)', 'Treatment', 45, 15, 7.50, 11.50, TRUE),
(422709, 'Dog Shampoo 250ml', 'Grooming', 28, 10, 5.00, 8.50, TRUE),
(423168, 'Cat Litter Premium 10L', 'Accessory', 35, 12, 7.00, 11.00, TRUE);

--------------------------------------------------------------------------
-- Supply Order Data
--------------------------------------------------------------------------

INSERT INTO SupplyOrder (orderID, supplierID, staffID, orderDate, deliveryDate, orderStatus, totalCost) VALUES

(601248, 20147, 7752, '05/12/2025', '09/12/2025', 'Delivered', 450.00),
(602371, 21834, 7752, '08/12/2025', '12/12/2025', 'Delivered', 320.00),
(603584, 22591, 7752, '10/12/2025', '15/12/2025', 'Delivered', 580.00),
(604729, 23408, 7752, '18/12/2025', '23/12/2025', 'Delivered', 275.00),
(605843, 20147, 7752, '25/01/2026', NULL, 'Pending', 390.00),
(606951, 21834, 7752, '28/01/2026', NULL, 'Pending', 210.00);

--------------------------------------------------------------------------
-- Supply Order Data
--------------------------------------------------------------------------
INSERT INTO OrderItem (orderItemID, orderID, inventoryID, quantityOrdered, unitCost) VALUES

(801234, 601248, 401082, 50, 0.85),
(801891, 601248, 403517, 20, 3.50),
(802347, 601248, 409527, 15, 15.00),
(803104, 602371, 415938, 20, 28.00),
(803829, 602371, 416247, 25, 14.00),
(804516, 602371, 417083, 10, 18.00),
(805208, 603584, 406748, 30, 2.10),
(805973, 603584, 412569, 10, 6.80),
(806641, 603584, 407264, 20, 0.75),
(807384, 604729, 402341, 40, 0.65),
(808029, 604729, 404829, 30, 0.90),
(808715, 604729, 410846, 10, 8.90),
(809401, 605843, 401082, 40, 0.85),
(810083, 605843, 405193, 15, 4.20),
(810729, 605843, 407264, 25, 0.75),
(811364, 606951, 416247, 15, 14.00),
(812019, 606951, 418529, 10, 9.00);

--------------------------------------------------------------------------
-- Product Sale Data
--------------------------------------------------------------------------

INSERT INTO ProductSale (saleID, customerID, staffID, saleDate, totalAmount, paymentMethod) VALUES

(501847, 104829, 1067, '08/12/2025', 42.00, 'Credit Card'),
(502394, 203847, 1067, '10/12/2025', 21.00, 'Cash'),
(503128, 428371, 1067, '15/12/2025', 24.50, 'Debit Card'),
(504715, 862147, 1067, '20/12/2025', 50.50, 'Revolut'),
(505283, 312056, 1067, '22/12/2025', 24.00, 'Credit Card'),
(506849, 329841, 1067, '10/01/2026', 32.00, 'Cash'),
(507412, 553718, 1067, '11/01/2026', 42.00, 'Debit Card'),
(508736, 641058, 1067, '12/02/2026', 32.50, 'Credit Card');

--------------------------------------------------------------------------
-- Sale Item Data
--------------------------------------------------------------------------

INSERT INTO SaleItem (saleItemID, saleID, inventoryID, quantitySold, unitPrice) VALUES

(901047, 501847, 415938, 1, 42.00),
(902183, 502394, 416247, 1, 21.00),
(903291, 503128, 419641, 1, 24.00),
(903847, 503128, 421854, 0, 0.50),
(904512, 504715, 415938, 1, 42.00),
(904839, 504715, 422709, 1, 8.50),
(905624, 505283, 419641, 1, 24.00),
(906317, 506849, 416247, 1, 21.00),
(906982, 506849, 423168, 1, 11.00),
(907148, 507412, 415938, 1, 42.00),
(908273, 508736, 416247, 1, 21.00),
(908941, 508736, 421854, 1, 11.50);
