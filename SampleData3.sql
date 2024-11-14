Use MoviBus;

-- Insert data into BusStop
INSERT INTO BusStop (StopName, StopGPS) VALUES
('Stormwind', '53.5461,9.9937'),
('Orgrimmar', '53.5511,9.9937'),
('Ironforge', '53.5581,9.9937'),
('Thunder Bluff', '53.5631,9.9937'),
('Darnassus', '53.5681,9.9937'),
('Undercity', '53.5731,9.9937'),
('Test', '56.38');


-- Insert data into Passenger
INSERT INTO Passenger (ID, Email, FirstName, LastName) VALUES
(1, 'arthas@example.com', 'Arthas', 'Menethil'),
(2, 'jaina@example.com', 'Jaina', 'Proudmoore'),
(3, 'thrall@example.com', 'Thrall', 'Doomhammer'),
(4, 'sylvanas@example.com', 'Sylvanas', 'Windrunner'),
(5, 'anduin@example.com', 'Anduin', 'Wrynn');

-- Insert data into BusLine
INSERT INTO BusLine (LineName, FinalDestination) VALUES
('Line A', 'Stormwind'),
('Line B', 'Orgrimmar'),
('Line C', 'Ironforge'),
('Line D', 'Thunder Bluff');

-- Insert data into BusRide
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) VALUES
('2024-11-01', '08:00:00', '00:30:00', '53.5461,9.9937', '53.5511,9.9937', 1, 'Stormwind', 'Line A'),
('2024-11-01', '09:00:00', '00:45:00', '53.5511,9.9937', '53.5581,9.9937', 2, 'Orgrimmar', 'Line B'),
('2024-11-01', '10:00:00', '00:20:00', '53.5581,9.9937', '53.5631,9.9937', 3, 'Ironforge', 'Line C'),
('2024-11-02', '08:00:00', '00:30:00', '53.5461,9.9937', '53.5511,9.9937', 1, 'Stormwind', 'Line A'),
('2024-11-02', '09:00:00', '00:45:00', '53.5511,9.9937', '53.5581,9.9937', 2, 'Orgrimmar', 'Line B'),
('2024-11-02', '10:00:00', '00:50:00', '53.5581,9.9937', '53.5631,9.9937', 4, 'Ironforge', 'Line C'),
('2024-11-03', '08:00:00', '00:30:00', '53.5461,9.9937', '53.5511,9.9937', 5, 'Stormwind', 'Line A');

-- Insert data into Serves
INSERT INTO Serves (StopNr, Stop_GPS, Line_FinalDestination, Line_Name) VALUES
(1, '53.5461,9.9937', 'Stormwind', 'Line A'),
(2, '53.5511,9.9937', 'Stormwind', 'Line A'),
(3, '53.5581,9.9937', 'Stormwind', 'Line A'),

(4, '53.5461,9.9937', 'Orgrimmar', 'Line B'),
(5, '53.5511,9.9937', 'Orgrimmar', 'Line B'),
(6, '53.5581,9.9937', 'Orgrimmar', 'Line B'),

(7, '53.5461,9.9937', 'Ironforge', 'Line C'),
(8, '53.5511,9.9937', 'Ironforge', 'Line C'),
(9, '53.5581,9.9937', 'Ironforge', 'Line C'),

(10, '53.5631,9.9937', 'Thunder Bluff', 'Line D'),
(11, '53.5681,9.9937', 'Thunder Bluff', 'Line D'),
(12, '53.5731,9.9937', 'Thunder Bluff', 'Line D');

-- Insert data into Address
INSERT INTO Address (Passenger_ID, ZIP, StreeName, CivicNumber, City, Country) VALUES
(1, 1000, 'King\'s Road', '1A', 'Stormwind', 'Azeroth'),
(2, 1001, 'Mage Quarter', '2B', 'Stormwind', 'Azeroth'),
(3, 1002, 'Valley of Wisdom', '3C', 'Orgrimmar', 'Azeroth'),
(4, 1003, 'Undercity', '4D', 'Tirisfal Glades', 'Azeroth'),
(5, 1004, 'Cathedral Square', '5E', 'Stormwind', 'Azeroth');

-- Insert data into PhoneNr
INSERT INTO PhoneNr (Passenger_ID, PhoneNr) VALUES
(1, '1234567890'),
(2, '0987654321'),
(3, '1122334455'),
(4, '5566778899'),
(5, '6677889900');