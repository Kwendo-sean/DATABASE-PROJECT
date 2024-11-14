CREATE TABLE Commuter(
Commuter_ID VARCHAR(100) PRIMARY KEY,
Commuter_Name VARCHAR(100) NOT NULL,
Commuter_Email VARCHAR(100) NOT NULL,
Account_Balance DECIMAL(10,2) NOT NULL,
Payment_Method VARCHAR(100) NOT NULL,
Accessibility_features VARCHAR(100)
);

CREATE TABLE Driver(
Driver_ID VARCHAR(100) PRIMARY KEY,
Driver_Name VARCHAR(100) NOT NULL,
License_Number VARCHAR(100) NOT NULL,
Vehicle_ID VARCHAR(100),
Training_ID VARCHAR(100),
FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle (Vehicle_ID),
FOREIGN KEY (Training_ID) REFERENCES Driver_Training (Training_ID)
);

CREATE TABLE GPS_Tracker(
GPS_TRACKER_ID VARCHAR(100) PRIMARY KEY,
Vehicle_ID VARCHAR(100) UNIQUE
);

CREATE TABLE Vehicle(
Vehicle_ID VARCHAR(100) PRIMARY KEY,
Model VARCHAR(100) NOT NULL,
Driver_ID VARCHAR(100),
GPS_Tracker_ID VARCHAR(100),
Number_plate VARCHAR(100) NOT NULL,
Accessibility_features TEXT NOT NULL,
Trip_ID VARCHAR(100),
Maintenance_ID VARCHAR(100),
FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
FOREIGN KEY (GPS_Tracker_ID) REFERENCES GPS_Tracker(GPS_Tracker_ID),
FOREIGN KEY (Trip_ID) REFERENCES Trip (Trip_ID),
FOREIGN KEY (Maintenance_ID) REFERENCES Maintenance (Maintenance_ID)
);

CREATE TABLE Route(
Route_ID VARCHAR(100) PRIMARY KEY,
Route_Name VARCHAR(100) NOT NULL,
Fare_Amount INT NOT NULL,
Trip_ID VARCHAR(100),
FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID)
);

CREATE TABLE Maintenance(
Maintenance_ID VARCHAR(100) PRIMARY KEY,
Vehicle_ID VARCHAR(100),
Maintenance_Cost INT NOT NULL,
FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);

CREATE TABLE Trip(
Trip_ID VARCHAR(100) PRIMARY KEY,
Route_ID VARCHAR(100),
Vehicle_ID VARCHAR(100),
Status VARCHAR(100) NOT NULL,
FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID),
FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID)
);

CREATE TABLE Payment(
Payment_ID VARCHAR(100) PRIMARY KEY,
Commuter_ID VARCHAR(100),
Trip_ID VARCHAR(100),
Amount INT NOT NULL,
Payment_Method VARCHAR(100),
FOREIGN KEY (Commuter_ID) REFERENCES Commuter(Commuter_ID),
FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID)
);


CREATE TABLE Driver_Training(
Training_ID VARCHAR(100) PRIMARY KEY,
Description TEXT NOT NULL,
Driver_ID VARCHAR(100),
Completion_Date DATE NOT NULL,
FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

CREATE TABLE Station(
Station_ID VARCHAR(100) PRIMARY KEY,
Accessibility_Features VARCHAR(100) NOT NULL
);

CREATE TABLE AccessibilityFeatures(
Features_ID VARCHAR(100) PRIMARY KEY,
Description TEXT
);
INSERT INTO Commuter(Commuter_ID, Commuter_Name, Commuter_Email, Account_Balance, Payment_Method, Accessibility_features)
VALUES
('COMM1','Alice Otieno', 'AliceOti@gmail.com', 10000.00,'M-Pesa','Wheelchair Ramp'),
('COMM2', 'Ruman Abdullahi', 'RumanAbdul@gmail.com', 15000.00,'Card','Audio Assistance'),
('COMM3', 'Daniella Wanjohi','Daniella Wanjohi@gmail.com', 23000.10, 'M-Pesa',NULL),
('COMM4', 'Benson Mwangi','BensonMwangi@diddy.com',2000.99,'Cash','Wheelchair Ramp'),
('COMM5', 'Natasha Mumbi','NatashaMumbi@yahoo.com',40000.23,'M-Pesa',NULL),
('COMM6', 'Emmanuel Mutinda','EmmanuelMutinda@gmail.com',210.22,'Card','Braille Labels');
SELECT * FROM Commuter;

INSERT INTO Driver(Driver_ID, Driver_Name, License_Number, Vehicle_ID, Training_ID)
VALUES
('DRV001','John Maina', 'LN4567','',''),
('DRV002','Michael Oriama','LN8900','',''),
('DRV003','Brian Onyango','LN8762','',''),
('DRV004','Paul Kimanda','LN3210','',''),
('DRV005','Elizabeth Moraa','LN8876','',''),
('DRV006','Allejandro Griamldo','LN5400','','');
SELECT * FROM Driver;

INSERT INTO GPS_Tracker(GPS_TRACKER_ID, Vehicle_ID)
VALUES
('GPS001', 'VEH001'),
('GPS002', 'VEH002'),
('GPS003', 'VEH003'),
('GPS004', 'VEH004'),
('GPS005', 'VEH005'),
('GPS006', 'VEH006');
SELECT * FROM GPS_Tracker;

INSERT INTO Vehicle(Vehicle_ID, Model, Driver_ID,GPS_Tracker_ID,Number_plate, Accessibility_features,Trip_ID, Maintenance_ID)
VALUES
('VEH001', 'Toyota Hiace', 'DRV001', 'GPS001', 'KCB123A', 'Wheelchair Ramp','',''),
('VEH002', 'Nissan NV350', 'DRV002', 'GPS002', 'KCA456B', 'Audio Assistance','',''),
('VEH003', 'Toyota Coaster', 'DRV003', 'GPS003', 'KDA789C', 'Braille Labels','',''),
('VEH004', 'Isuzu ', 'DRV004', 'GPS004', 'KCC123D', 'Elevator Access','',''),
('VEH005', 'Mitsubishi Rosa', 'DRV005', 'GPS005', 'KBL456E', 'Audio Assistance','',''),
('VEH006', 'Ford Transit', 'DRV006', 'GPS006', 'KDD789F', 'Wheelchair Ramp','','');
SELECT * FROM Vehicle;

INSERT INTO Route(Route_ID, Route_Name,Fare_Amount,Trip_ID)
VALUES
('RTE001', 'CBD to Westlands', 50,''),
('RTE002', 'CBD to Karen', 80,''),
('RTE003', 'CBD to Thika', 120,''),
('RTE004', 'CBD to Rongai', 100,''),
('RTE005', 'CBD to Embakasi', 60,''),
('RTE006', 'CBD to Mombasa Road', 70,'');
SELECT * FROM Route;

INSERT INTO Maintenance(Maintenance_ID, Vehicle_ID, Maintenance_cost)
VALUES
('MTN001', 'VEH001', 5000),
('MTN002', 'VEH002', 6000),
('MTN003', 'VEH003', 7000),
('MTN004', 'VEH004', 8000),
('MTN005', 'VEH005', 5500),
('MTN006', 'VEH006', 7500);
SELECT * FROM Maintenance;

INSERT INTO Trip(Trip_ID, Route_ID, Vehicle_ID, Status)
VALUES
('TRP001', 'RTE001', 'VEH001', 'Completed'),
('TRP002', 'RTE002', 'VEH002', 'In Transit'),
('TRP003', 'RTE003', 'VEH003', 'Scheduled'),
('TRP004', 'RTE004', 'VEH004', 'Completed'),
('TRP005', 'RTE005', 'VEH005', 'In Transit'),
('TRP006', 'RTE006', 'VEH006', 'Scheduled');
SELECT * FROM Trip;

INSERT INTO Payment(Payment_ID, Commuter_ID, Trip_ID, Amount, Payment_Method)
VALUES
('PAY001', 'COMM1', 'TRP001', 50, 'M-Pesa'),
('PAY002', 'COMM2', 'TRP002', 80, 'Cash'),
('PAY003', 'COMM3', 'TRP003', 120, 'Bank Transfer'),
('PAY004', 'COMM4', 'TRP004', 100, 'M-Pesa'),
('PAY005', 'COMM5', 'TRP005', 60, 'Credit Card'),
('PAY006', 'COMM6', 'TRP006', 70, 'Cash');
SELECT * FROM Payment;

INSERT INTO Driver_Training(Training_ID, Description, Driver_ID, Completion_Date)
VALUES
('TRN001', 'Safety Training', 'DRV001', '2024-01-10'),
('TRN002', 'First Aid Training', 'DRV002', '2024-02-15'),
('TRN003', 'Defensive Driving', 'DRV003', '2024-03-20'),
('TRN004', 'Customer Service', 'DRV004', '2024-04-25'),
('TRN005', 'Vehicle Maintenance', 'DRV005', '2024-05-30'),
('TRN006', 'Safety Training', 'DRV006', '2024-06-05');
SELECT * FROM Driver_Training;

INSERT INTO Station(Station_ID, Accessibility_Features)
VALUES
('STN001', 'Wheelchair Ramp'),
('STN002', 'Elevator Access'),
('STN003', 'Braille Signs'),
('STN004', 'Audio Assistance'),
('STN005', 'Accessible Restrooms'),
('STN006', 'Seating for Elderly');
SELECT * FROM Station;

INSERT INTO AccessibilityFeatures(Features_ID, Description)
VALUES
('AF001', 'Wheelchair Ramp'),
('AF002', 'Elevator Access'),
('AF003', 'Braille Labels'),
('AF004', 'Audio Assistance'),
('AF005', 'Reserved Parking'),
('AF006', 'Lowered Ticket Counters');
SELECT * FROM AccessibilityFeatures;


