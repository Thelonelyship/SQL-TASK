CREATE TABLE Members (
Member_ID INT PRIMARY KEY,
First_Name VARCHAR(20),
Last_Name VARCHAR(20),
Member_Location VARCHAR(20),
Member_Age int
);

CREATE TABLE Vehicles (
Vehicle_Registration VARCHAR(10) PRIMARY KEY,
Vehicle_Make VARCHAR(10),
Vehicle_Model VARCHAR(10),
Member_ID INT
);

CREATE TABLE Engineers (
    Engineer_ID INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20)
);

CREATE TABLE Breakdowns (
    Breakdown_ID INT PRIMARY KEY,
    Vehicle_Registration VARCHAR(10),
    Engineer_ID INT,
    Breakdown_Date DATE,
    Breakdown_Time TIME,
    Breakdown_Location VARCHAR(20)
);

INSERT INTO Members (Member_ID, First_Name, Last_Name, Member_Location, Member_Age)
VALUES
('1', 'John', 'Doe', 'New York', '32'),
('2', 'Jane', 'Smith', 'Los Angeles', '27'),
('3', 'Mark', 'Jones', 'Chicago', '45'),
('4', 'Emily', 'Davis', 'Houston', '30'),
('5', 'Luke', 'Brown', 'Phoenix', '38'),
('6', 'Sophia', 'White', 'Dallas', '29'),
('7', 'Liam', 'Taylor', 'Miami', '41'),
('8', 'Olivia', 'Green', 'San Diego', '36'),
('9', 'James', 'Harris', 'Denver', '33'),
('10', 'Mia', 'Robinson', 'Atlanta', '25');

INSERT INTO Vehicles (Vehicle_Registration, Vehicle_Make, Vehicle_Model, Member_ID)
VALUES
('ABC1234', 'Toyota', 'Corolla', '1'),
('XYZ5678', 'Ford', 'Mustang', '2'),
('DEF1111', 'Honda', 'Civic', '3'),
('GHI2222', 'Chevy', 'Cruze', '4'),
('JKL3333', 'BMW', 'X5', '5'),
('MNO4444', 'Audi', 'A4', '1'),
('PQR5555', 'Mercedes', 'C300', '2'),
('STU6666', 'Nissan', 'Altima', '3'),
('VWX7777', 'Hyundai', 'Elantra', '6'),
('YZA8888', 'Tesla', 'Model S', '7'),
('BCD9999', 'Kia', 'Sportage', '8'),
('EFG1112', 'Subaru', 'Forester', '9'),
('HIJ1212', 'Jeep', 'Wrangler', '10'),
('KLM1414', 'Mazda', 'CX-5', '4'),
('NOP1515', 'Honda', 'Accord', '5'),
('QRS1616', 'Chevy', 'Malibu', '6'),
('TUV1717', 'Nissan', 'Sentra', '7'),
('WXY1818', 'Ford', 'Explorer', '8'),
('ZAB1919', 'Volvo', 'XC90', '9'),
('CDE2020', 'Lexus', 'RX350', '10');

INSERT INTO Engineers (Engineer_ID, First_Name, Last_Name)
VALUES
('1', 'Ethan', 'Williams'),
('2', 'Olivia', 'Miller'),
('3', 'Sophia', 'Clark'),
('4', 'Noah', 'Walker');

INSERT INTO Breakdowns (Breakdown_ID, Vehicle_Registration, Engineer_ID, Breakdown_Date, Breakdown_Time, Breakdown_Location)
VALUES
('1', 'ABC1234', '1', '2024-09-10', '10:30:00', 'New York'),
('2', 'XYZ5678', '2', '2024-09-10', '11:00:00', 'Los Angeles'),
('3', 'DEF1111', '3', '2024-09-10', '12:30:00', 'Chicago'),
('4', 'GHI2222', '4', '2024-09-15', '14:00:00', 'Houston'),
('5', 'JKL3333', '1', '2024-09-18', '09:45:00', 'Phoenix'),
('6', 'MNO4444', '2', '2024-09-25', '08:20:00', 'New York'),
('7', 'PQR5555', '3', '2024-09-28', '11:15:00', 'Los Angeles'),
('8', 'STU6666', '4', '2024-09-30', '15:30:00', 'Chicago'),
('9', 'ABC1234', '2', '2024-10-10', '09:30:00', 'New York'),
('10', 'XYZ5678', '3', '2024-10-15', '13:30:00', 'Los Angeles'),
('11', 'DEF1111', '4', '2024-10-20', '14:45:00', 'Chicago'),
('12', 'MNO4444', '1', '2024-10-22', '16:20:00', 'New York'),
('13', 'JKL3333', '2', '2024-10-25', '17:00:00', 'Phoenix'),
('14', 'VWX7777', '3', '2024-11-01', '08:00:00', 'Dallas'),
('15', 'YZA8888', '4', '2024-11-05', '09:00:00', 'Miami'),
('16', 'BCD9999', '1', '2024-11-10', '10:30:00', 'San Diego'),
('17', 'EFG1112', '2', '2024-11-15', '14:00:00', 'Denver'),
('18', 'HIJ1212', '3', '2024-11-18', '11:00:00', 'Atlanta'),
('19', 'KLM1414', '4', '2024-11-20', '15:45:00', 'Houston'),
('20', 'NOP1515', '1', '2024-11-25', '16:30:00', 'Phoenix');

ALTER TABLE Vehicles
ADD CONSTRAINT fk_vehicles_member_id
FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID);

ALTER TABLE Breakdowns
ADD CONSTRAINT fk_breakdowns_vehicle_registration
FOREIGN KEY (Vehicle_Registration) REFERENCES Vehicles(Vehicle_Registration);

ALTER TABLE Breakdowns
ADD CONSTRAINT fk_breakdowns_engineer_id
FOREIGN KEY (Engineer_ID) REFERENCES Engineers(Engineer_ID);

---------------------------------------------------------------------
-- TASKS

-- 1. Retrieve the first 5 members from the Member table.
SELECT * FROM Members LIMIT 5;

-- 2. Retrieve 5 members starting from the 6th row.
SELECT * FROM Members LIMIT 5 OFFSET 5;

-- 3. List members who are older than 30 years.
SELECT * FROM Members WHERE Member_Age > 30;

-- 4. Find members who live in either New York or Los Angeles.
SELECT * FROM Members WHERE Member_Location IN ('New York', 'Los Angeles');

-- 5. Retrieve all vehicles where the make is either 'Toyota' or 'Honda'.
SELECT * FROM Vehicles WHERE Vehicle_Make IN ('Toyota', 'Honda');

-- 6. Find members whose age is between 25 and 40 years.
SELECT * FROM Members WHERE Member_Age BETWEEN 25 AND 40;

-- 7. List vehicles whose registration number starts with the letter 'A'.
SELECT * FROM Vehicles WHERE Vehicle_Registration LIKE 'A%';

-- 8. Find vehicles where the model ends with the number '5'.
SELECT * FROM Vehicles WHERE Vehicle_Model LIKE '%5';

-- 9. List all engineers and order them alphabetically by their last name.
SELECT * FROM Engineers ORDER BY Last_Name ASC;

-- 10. Retrieve all members and order them by age in descending order.
SELECT * FROM Members ORDER BY Member_Age DESC;

-- 11. Count the total number of members in the Member table.
SELECT COUNT(*) AS Total_Members FROM Members;

-- 12. Retrieve all breakdowns that occurred in the year 2024.
SELECT * FROM Breakdowns WHERE YEAR(Breakdown_Date) = 2024;

-- 13. Find breakdowns for vehicles with the registration 'ABC1234' or 'XYZ5678'.
SELECT * FROM Breakdowns WHERE Vehicle_Registration IN ('ABC1234', 'XYZ5678');

-- 14. List all vehicles with the make 'Ford'.
SELECT * FROM Vehicles WHERE Vehicle_Make = 'Ford';

-- 15. Find members whose first name starts with the letter 'J'.
SELECT * FROM Members WHERE First_Name LIKE 'J%';

-- 16. Retrieve breakdowns that occurred before September 1, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date < '2024-09-01';
-- 16 with different dates
SELECT * FROM Breakdowns WHERE Breakdown_Date < '2024-10-31';

-- 17. List members whose last name contains 'son'.
SELECT * FROM Members WHERE Last_Name LIKE '%son%';

-- 18. Find breakdowns that occurred in locations containing 'New'.
SELECT * FROM Breakdowns WHERE Breakdown_Location LIKE '%New%';

-- 19. Retrieve the youngest member in the Member table.
SELECT * FROM Members ORDER BY Member_Age ASC LIMIT 1;

-- 20. Retrieve the oldest member in the Member table.
SELECT * FROM Members ORDER BY Member_Age DESC LIMIT 1;

-- 21. Find vehicles owned by members who live in Los Angeles.
SELECT * FROM Vehicles INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID WHERE Members.Member_Location = 'Los Angeles';

-- 22. Retrieve all breakdowns handled by engineer with ID 1.
SELECT * FROM Breakdowns WHERE Engineer_ID = 1;

-- 23. List all members who are younger than 35 years.
SELECT * FROM Members WHERE Member_Age < 35;

-- 24. Find members who live in either Phoenix or Houston.
SELECT * FROM Members WHERE Member_Location IN ('Phoenix', 'Houston');

-- 25. Retrieve vehicles where the model is either 'Civic' or 'Mustang'.
SELECT * FROM Vehicles WHERE Vehicle_Model IN ('Civic', 'Mustang');

-- 26. List members whose first name contains the letter 'a'.
SELECT * FROM Members WHERE First_Name LIKE '%a%';

-- 27. Retrieve breakdowns that occurred between August 1, 2024, and August 31, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date BETWEEN '2024-08-01' AND '2024-08-31';
-- 27 with different dates
SELECT * FROM Breakdowns WHERE Breakdown_Date BETWEEN '2024-11-01' AND '2024-11-30';

-- 28. Find members whose age is not between 20 and 40 years.
SELECT * FROM Members WHERE Member_Age NOT BETWEEN 20 AND 40;

-- 29. List breakdowns that occurred after October 1, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date > '2024-10-01';

-- 30. Retrieve the top 3 oldest members from the Member table.
SELECT * FROM Members ORDER BY Member_Age DESC LIMIT 3;

-- Medium Tasks

-- 1. Count the number of breakdowns for each vehicle.
SELECT Vehicle_Registration, COUNT(*) AS 'Breakdowns' FROM Breakdowns GROUP BY Vehicle_Registration;

-- 2. Find members who own more than one vehicle.
SELECT Members.Member_ID, Members.First_Name, Members.Last_Name, Vehicles.Vehicle_Registration, Vehicles.Vehicle_Make, Vehicles.Vehicle_Model FROM Members INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID WHERE Members.Member_ID IN (
SELECT Members.Member_ID
    FROM Members
    INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID
    GROUP BY Members.Member_ID
    HAVING COUNT(Vehicles.Vehicle_Registration) > 1
);

-- 3. Retrieve the total number of breakdowns handled by each engineer.
SELECT Engineer_ID, COUNT(*) AS 'Total Breakdowns' FROM Breakdowns GROUP BY Engineer_ID;

-- 4. Group breakdowns by location and sort them by the total number of breakdowns in each location.
SELECT Breakdown_Location, COUNT(*) AS Breakdown_Count FROM Breakdowns GROUP BY Breakdown_Location ORDER BY Breakdown_Count DESC;

-- 5. List vehicles owned by members who are younger than 30 years.
SELECT * FROM Vehicles INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID WHERE Members.Member_Age < 30;

-- 6. Retrieve all breakdowns and sort them by time in descending order.
SELECT * FROM Breakdowns ORDER BY Breakdown_Time DESC;

-- 7. Find all breakdowns for vehicles owned by members who live in New York.
SELECT * FROM Breakdowns INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration = Vehicles.Vehicle_Registration INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID WHERE Members.Member_Location = 'New York';

-- 8. Retrieve members who do not own any vehicles.
SELECT * FROM Members LEFT JOIN Vehicles ON Members.Member_ID=Vehicles.Member_ID WHERE Vehicles.Member_ID IS NULL;

-- 9. Find breakdowns that occurred in the same city where the vehicle owner resides.
SELECT Breakdowns.Breakdown_ID, Breakdowns.Vehicle_Registration, Breakdowns.Engineer_ID, Breakdowns.Breakdown_Date, Breakdowns.Breakdown_Location FROM Breakdowns 
	INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration = Vehicles.Vehicle_Registration 
	INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID 
WHERE Members.Member_Location = Breakdowns.Breakdown_Location;

-- 10. Retrieve the total number of breakdowns handled by each engineer during 2024.
SELECT Engineer_ID, COUNT(*) AS 'Total Breakdowns In 2024' FROM Breakdowns WHERE YEAR(Breakdown_Date) = 2024 GROUP BY Engineer_ID;

-- Difficult Tasks

-- 1. Retrieve a list of members along with their vehicles using a join.
SELECT * FROM Members LEFT JOIN Vehicles ON Members.Member_ID=Vehicles.Member_ID;

-- 2. Retrieve breakdown details along with the respective member details using a join.
SELECT Breakdowns.Breakdown_ID, Breakdowns.Vehicle_Registration, Breakdowns.Engineer_ID, Breakdowns.Breakdown_Date, Breakdowns.Breakdown_Time, Breakdowns.Breakdown_Location, Members.Member_ID, Members.First_Name, Members.Last_Name, Members.Member_Location, Members.Member_Age FROM Breakdowns 
	INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration = Vehicles.Vehicle_Registration
	INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID;

-- 3. Find members who own a vehicle but have never experienced a breakdown.
-- results for this changed after deleting 20 and 19 in Task 6
SELECT * FROM Members 
	INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID
	LEFT JOIN Breakdowns ON Vehicles.Vehicle_Registration = Breakdowns.Vehicle_Registration
WHERE Breakdowns.Breakdown_ID IS NULL;

-- 4. Retrieve vehicles along with the count of their breakdowns using a join and group by.
SELECT Vehicles.Vehicle_Registration, Vehicles.Vehicle_Make, Vehicles.Vehicle_Model, COUNT(Breakdowns.Breakdown_ID) AS 'Breakdowns' FROM Vehicles LEFT JOIN Breakdowns ON Vehicles.Vehicle_Registration = Breakdowns.Vehicle_Registration GROUP BY Vehicles.Vehicle_Registration;

-- 5. Find members whose vehicles have broken down more than twice.
SELECT Members.*, Breakdowns.Breakdown_ID, Breakdowns.Breakdown_Date, Breakdowns.Breakdown_Time, Breakdowns.Breakdown_Location FROM Members 
	INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID
	INNER JOIN Breakdowns ON Vehicles.Vehicle_Registration = Breakdowns.Vehicle_Registration
WHERE Members.Member_ID IN (
SELECT Members.Member_ID FROM Members
	INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID
	INNER JOIN Breakdowns ON Vehicles.Vehicle_Registration = Breakdowns.Vehicle_Registration
	GROUP BY Members.Member_ID HAVING COUNT(Breakdowns.Breakdown_ID) > 2
    );

-- 6. Retrieve breakdowns where multiple vehicles broke down on the same day.
SELECT Breakdown_Date, COUNT(*) AS 'No. of Breakdowns' FROM Breakdowns GROUP BY Breakdown_Date HAVING COUNT(*) > 1;

-- 7. Count the total breakdowns handled by each engineer and label those who handled more than 5 breakdowns as 'Expert' and others as 'Beginner' using a CASE expression.
SELECT Engineer_ID, COUNT(*) AS 'Total',
CASE
    WHEN COUNT(*) > 5 THEN 'Expert'
    ELSE 'Beginner'
END AS 'Experience'
	FROM Breakdowns GROUP BY Engineer_ID;

-- 8. List all vehicles that have never had a breakdown using a subquery.
SELECT * FROM Vehicles WHERE Vehicle_Registration NOT IN (SELECT DISTINCT Vehicle_Registration FROM Breakdowns);

-- 9. Find the average age of members whose vehicles have experienced at least one breakdown.
-- rounded to two decimal places just because I think it looks better
SELECT ROUND(AVG(Member_Age), 2) AS 'Average Age' FROM Members INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID WHERE Vehicles.Vehicle_Registration IN (SELECT DISTINCT Vehicle_Registration FROM Breakdowns);

-- 10. Retrieve the top 3 vehicles with the highest number of breakdowns, ordered by breakdown count.
SELECT Vehicle_Registration, COUNT(*) AS 'Breakdowns' FROM Breakdowns GROUP BY Vehicle_Registration ORDER BY Breakdowns DESC LIMIT 3;


-- TASK 5

-- Definitions from W3schools SQL Aggregate Functions
-- AVG() - returns the average value of a numerical column.
-- MAX() - returns the largest value within the selected column.
-- MIN() - returns the smallest value within the selected column.
-- SUM() - returns the total sum of a numerical column.

-- AVG example to show average age of Members
SELECT AVG(Member_Age) FROM Members;
-- MAX example to show oldest Member
SELECT MAX(Member_Age) FROM Members;
-- MIN example to show youngest Member
SELECT MIN(Member_Age) FROM Members;
-- SUM example to show total age of all members
SELECT SUM(Member_Age) FROM Members;


-- TASK 6
-- update engineers
UPDATE Engineers
SET Last_Name = 'Willihams'
WHERE Engineer_ID = '1';

UPDATE Engineers
SET First_Name = 'Sofia'
WHERE Engineer_ID = '3';

UPDATE Engineers
SET Last_Name = 'Woahka'
WHERE Engineer_ID = '4';

-- check updates
SELECT * FROM Engineers;

-- delete from breakdowns
DELETE FROM Breakdowns WHERE Breakdown_ID = '20';
DELETE FROM Breakdowns WHERE Breakdown_ID = '19';

-- check updates
SELECT * FROM Breakdowns;
