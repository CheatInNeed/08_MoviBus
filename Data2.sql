use MoviBus;
-- BusStop Data
INSERT INTO BusStop (StopName, StopGPS) VALUES
('Stormwind', '51.50'),
('Orgrimmar', '34.05'),
('Ironforge', '40.71'),
('Darnassus', '48.85'),
('Thunder Bluff', '35.68'),
('UnderCity', '57.38');

-- Passenger Data
INSERT INTO Passenger (ID, Email, FirstName, LastName) VALUES
(1, 'thrall@horde.com', 'Thrall', 'Doomhammer'),
(2, 'jaina@alliance.com', 'Jaina', 'Proudmoore'),
(3, 'sylvanas@horde.com', 'Sylvanas', 'Windrunner'),
(4, 'anduin@alliance.com', 'Anduin', 'Wrynn'),
(5, 'baine@horde.com', 'Baine', 'Bloodhoof');

-- BusLine Data
INSERT INTO BusLine (LineName, FinalDestination) VALUES
('Alliance Express', 'Stormwind'),
('Horde Express', 'Orgrimmar'),
('Panda Express', 'Orgrimmar');

-- BusRide Data
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) VALUES
('2024-11-01', '08:00:00', '02:00:00', '34.05', '35.68', 1, 'Orgrimmar', 'Horde Express'),
('2024-11-01', '10:30:00', '01:30:00', '35.68', '34.05', 1, 'Orgrimmar', 'Horde Express'),
('2024-11-02', '09:00:00', '01:30:00', '40.71', '51.50', 2, 'Stormwind', 'Alliance Express'),
('2024-11-02', '11:00:00', '01:30:00', '51.50', '40.71', 2, 'Stormwind', 'Alliance Express'),
('2024-11-03', '10:00:00', '01:45:00', '34.05', '35.68', 3, 'Orgrimmar', 'Horde Express'),
('2024-11-03', '12:00:00', '01:45:00', '35.68', '34.05', 3, 'Orgrimmar', 'Horde Express'),
('2024-11-04', '11:00:00', '01:30:00', '48.85', '40.71', 4, 'Stormwind', 'Alliance Express'),
('2024-11-04', '14:00:00', '01:30:00', '40.71', '48.85', 4, 'Stormwind', 'Alliance Express'),
('2024-11-05', '12:00:00', '01:00:00', '35.68', '48.85', 5, 'Orgrimmar', 'Panda Express'),
('2024-11-05', '13:30:00', '01:00:00', '48.85', '35.68', 5, 'Orgrimmar', 'Panda Express'),
('2024-11-06', '09:30:00', '01:30:00', '34.05', '35.68', 1, 'Orgrimmar', 'Horde Express'),
('2024-11-06', '11:00:00', '01:30:00', '35.68', '34.05', 1, 'Orgrimmar', 'Horde Express'),
('2024-11-07', '08:00:00', '01:30:00', '40.71', '48.85', 2, 'Stormwind', 'Alliance Express'),
('2024-11-07', '10:00:00', '01:30:00', '48.85', '40.71', 2, 'Stormwind', 'Alliance Express'),
('2024-11-08', '09:00:00', '01:45:00', '34.05', '35.68', 3, 'Orgrimmar', 'Horde Express'),
('2024-11-08', '11:30:00', '01:45:00', '35.68', '34.05', 3, 'Orgrimmar', 'Horde Express'),
('2024-11-09', '10:00:00', '01:30:00', '48.85', '40.71', 4, 'Stormwind', 'Alliance Express'),
('2024-11-09', '13:00:00', '01:30:00', '40.71', '48.85', 4, 'Stormwind', 'Alliance Express'),
('2024-11-10', '11:00:00', '01:00:00', '35.68', '48.85', 5, 'Orgrimmar', 'Panda Express'),
('2024-11-10', '12:30:00', '01:00:00', '48.85', '35.68', 5, 'Orgrimmar', 'Panda Express'),
('2024-11-11', '08:00:00', '01:30:00', '34.05', '35.68', 1, 'Orgrimmar', 'Horde Express');

-- Serves Data
INSERT INTO Serves (StopNr, Stop_GPS, Line_FinalDestination, Line_Name) VALUES
(1, '48.85', 'Stormwind', 'Alliance Express'),
(2, '40.71', 'Stormwind', 'Alliance Express'),
(3, '51.50', 'Stormwind', 'Alliance Express'),
(1, '57.38', 'Orgrimmar', 'Horde Express'),
(2, '35.68', 'Orgrimmar', 'Horde Express'),
(3, '34.05', 'Orgrimmar', 'Horde Express'),
(1, '48.85', 'Orgrimmar', 'Panda Express'),
(2, '40.71', 'Orgrimmar', 'Panda Express'),
(3, '51.50', 'Orgrimmar', 'Panda Express'),
(4, '57.38', 'Orgrimmar', 'Panda Express'),
(5, '35.68', 'Orgrimmar', 'Panda Express'),
(6, '34.05', 'Orgrimmar', 'Panda Express');

-- Address Data
INSERT INTO Address (Passenger_ID, ZIP, StreeName, CivicNumber, City, Country) VALUES
(1, 1234, 'Grommash Hold', '1', 'Orgrimmar', 'Durotar'),
(2, 5678, 'Mage Quarter', '2', 'Stormwind', 'Elwynn Forest'),
(3, 9101, 'Royal District', '3', 'Undercity', 'Tirisfal Glades'),
(4, 1121, 'Cathedral Square', '4', 'Stormwind', 'Elwynn Forest'),
(5, 3141, 'Elder Rise', '5', 'Thunder Bluff', 'Mulgore');

-- PhoneNr Data
INSERT INTO PhoneNr (Passenger_ID, PhoneNr) VALUES
(1, '+1-555-THRALL'),
(2, '+1-555-JAINA'),
(3, '+1-555-SYLVANAS'),
(4, '+1-555-ANDUIN'),
(5, '+1-555-BAINE');
