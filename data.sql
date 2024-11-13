use MoviBus;
-- BusStop Data
INSERT INTO BusStop (StopName, StopGPS) VALUES
('Stormwind', '51.50853,-0.12574'),
('Orgrimmar', '34.05223,-118.24368'),
('Ironforge', '40.71278,-74.00594'),
('Darnassus', '48.85661,2.35222'),
('Thunder Bluff', '35.6895,139.69171');

-- Passanger Data
INSERT INTO Passanger (ID, Email, FirstName, LastName) VALUES
(1, 'thrall@horde.com', 'Thrall', 'Doomhammer'),
(2, 'jaina@alliance.com', 'Jaina', 'Proudmoore'),
(3, 'sylvanas@horde.com', 'Sylvanas', 'Windrunner'),
(4, 'anduin@alliance.com', 'Anduin', 'Wrynn'),
(5, 'baine@horde.com', 'Baine', 'Bloodhoof');

-- BusLine Data
INSERT INTO BusLine (LineName, FinalDestination) VALUES
('Alliance Express', 'Stormwind'),
('Horde Express', 'Orgrimmar'),
('Mountain Pass', 'Ironforge'),
('Elven Path', 'Darnassus'),
('Great Lift', 'Thunder Bluff');

-- BusRide Data
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passanger_ID, Line_FinalDestination, Line_Name) VALUES
('2024-11-01', '08:00:00', '02:00:00', '51.50853,-0.12574', '34.05223,-118.24368', 1, 'Orgrimmar', 'Horde Express'),
('2024-11-02', '09:00:00', '01:30:00', '40.71278,-74.00594', '51.50853,-0.12574', 2, 'Stormwind', 'Alliance Express'),
('2024-11-03', '10:00:00', '01:45:00', '34.05223,-118.24368', '35.6895,139.69171', 3, 'Thunder Bluff', 'Great Lift'),
('2024-11-04', '11:00:00', '02:15:00', '48.85661,2.35222', '40.71278,-74.00594', 4, 'Ironforge', 'Mountain Pass'),
('2024-11-05', '12:00:00', '01:00:00', '35.6895,139.69171', '48.85661,2.35222', 5, 'Darnassus', 'Elven Path');

-- Serves Data
INSERT INTO Serves (StopNr, Stop_GPS, Line_FinalDestination, Line_Name) VALUES
(1, '51.50853,-0.12574', 'Stormwind', 'Alliance Express'),
(2, '34.05223,-118.24368', 'Orgrimmar', 'Horde Express'),
(3, '40.71278,-74.00594', 'Ironforge', 'Mountain Pass'),
(4, '48.85661,2.35222', 'Darnassus', 'Elven Path'),
(5, '35.6895,139.69171', 'Thunder Bluff', 'Great Lift');

-- Address Data
INSERT INTO Address (Passanger_ID, ZIP, StreeName, CivicNumber, City, Country) VALUES
(1, 1234, 'Grommash Hold', '1', 'Orgrimmar', 'Durotar'),
(2, 5678, 'Mage Quarter', '2', 'Stormwind', 'Elwynn Forest'),
(3, 9101, 'Royal District', '3', 'Undercity', 'Tirisfal Glades'),
(4, 1121, 'Cathedral Square', '4', 'Stormwind', 'Elwynn Forest'),
(5, 3141, 'Elder Rise', '5', 'Thunder Bluff', 'Mulgore');

-- PhoneNr Data
INSERT INTO PhoneNr (Passanger_ID, PhoneNr) VALUES
(1, '+1-555-THRALL'),
(2, '+1-555-JAINA'),
(3, '+1-555-SYLVANAS'),
(4, '+1-555-ANDUIN'),
(5, '+1-555-BAINE');
