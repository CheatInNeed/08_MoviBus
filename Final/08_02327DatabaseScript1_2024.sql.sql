drop database if exists MoviBus;
create database MoviBus;
use MoviBus;

DROP TABLE IF EXISTS BusStop;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS BusLine;
DROP TABLE IF EXISTS BusRide;
DROP TABLE IF EXISTS Serves;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS PhoneNr;

CREATE TABLE BusStop
	(StopName		VARCHAR(30)NOT NULL,
	 StopGPS		VARCHAR(30),
	 PRIMARY KEY(StopGPS)
	);
    
CREATE TABLE Passenger
	(ID				INT(10), 
	 Email			VARCHAR(30) NOT NULL, 
	 FirstName 		VARCHAR(30) NOT NULL,
	 LastName		VARCHAR(30) NOT NULL,
	 PRIMARY KEY(ID)
	);
    
CREATE TABLE BusLine
	(LineName				VARCHAR(30),
	 FinalDestination		VARCHAR(30),
	 PRIMARY KEY(FinalDestination, LineName)
	);
    
CREATE TABLE BusRide
	(RideDate				DATE,
	 StartTime				TIME,
	 Duration				TIME NOT NULL,
	 StartGPS				VARCHAR(30) NOT NULL,
	 EndGPS					VARCHAR(30) NOT NULL,
	 Passenger_ID			INT(10),
	 Line_FinalDestination	VARCHAR(30),
	 Line_Name				VARCHAR(30),
	 PRIMARY KEY(RideDate, StartTime, Passenger_ID),
     
     FOREIGN KEY(Line_FinalDestination, Line_Name) REFERENCES BusLine(FinalDestination,LineName) ON DELETE SET NULL,
	 FOREIGN KEY(Passenger_ID) REFERENCES Passenger(ID) ON DELETE CASCADE
	);


CREATE TABLE Serves
    (StopNr                 INT(10), 
     Stop_GPS               VARCHAR(30),
     Line_FinalDestination  VARCHAR(30),
     Line_Name              VARCHAR(30), 
     PRIMARY KEY(Line_Name, Line_FinalDestination, StopNr),

     FOREIGN KEY(Stop_GPS) REFERENCES BusStop(StopGPS) ON DELETE SET NULL,
     FOREIGN KEY(Line_FinalDestination, Line_Name) REFERENCES BusLine(FinalDestination, LineName)
    );


CREATE TABLE Address
	(Passenger_ID		INT(10),
	 ZIP				INT(4) NOT NULL,
	 StreeName			VARCHAR(30) NOT NULL,
	 CivicNumber		VARCHAR(30) NOT NULL,
	 City				VARCHAR(30) NOT NULL,
	 Country			VARCHAR(30) NOT NULL,
	 PRIMARY KEY(Passenger_ID),
     
     FOREIGN KEY(Passenger_ID) REFERENCES Passenger(ID) ON DELETE CASCADE
	);
    
CREATE TABLE PhoneNr
	(Passenger_ID		INT(10),
	 PhoneNr			VARCHAR(30),
	 PRIMARY KEY(PhoneNr),
     FOREIGN KEY(Passenger_ID) REFERENCES Passenger(ID) ON DELETE CASCADE
	);
    
INSERT INTO BusStop (StopName, StopGPS) VALUES
('Stormwind', 'GPS001'),
('Orgrimmar', 'GPS002'),
('Ironforge', 'GPS003'),
('Thunder Bluff', 'GPS004'),
('Darnassus', 'GPS005'),
('Undercity', 'GPS006'),
('Test', 'GPS007');

INSERT INTO Passenger (ID, Email, FirstName, LastName) VALUES
(1, 'arthas@example.com', 'Arthas', 'Menethil'),
(2, 'jaina@example.com', 'Jaina', 'Proudmoore'),
(3, 'thrall@example.com', 'Thrall', 'Doomhammer'),
(4, 'sylvanas@example.com', 'Sylvanas', 'Windrunner'),
(5, 'anduin@example.com', 'Anduin', 'Wrynn');

INSERT INTO BusLine (LineName, FinalDestination) VALUES
('Line A', 'Stormwind'),
('Line B', 'Orgrimmar'),
('Line C', 'Ironforge'),
('Line D', 'Thunder Bluff');

INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) VALUES
('2024-11-01', '08:00:00', '00:30:00', 'GPS001', 'GPS002', 1, 'Stormwind', 'Line A'),
('2024-11-01', '09:00:00', '00:45:00', 'GPS002', 'GPS003', 2, 'Orgrimmar', 'Line B'),
('2024-11-01', '10:00:00', '00:20:00', 'GPS003', 'GPS004', 3, 'Ironforge', 'Line C'),
('2024-11-02', '08:00:00', '00:30:00', 'GPS001', 'GPS002', 1, 'Stormwind', 'Line A'),
('2024-11-02', '09:00:00', '00:45:00', 'GPS002', 'GPS003', 2, 'Orgrimmar', 'Line B'),
('2024-11-02', '10:00:00', '00:50:00', 'GPS003', 'GPS004', 4, 'Ironforge', 'Line C'),
('2024-11-03', '08:00:00', '00:30:00', 'GPS001', 'GPS002', 5, 'Stormwind', 'Line A');

INSERT INTO Serves (StopNr, Stop_GPS, Line_FinalDestination, Line_Name) VALUES
(1, 'GPS001', 'Stormwind', 'Line A'),
(2, 'GPS002', 'Stormwind', 'Line A'),
(3, 'GPS003', 'Stormwind', 'Line A'),

(4, 'GPS001', 'Orgrimmar', 'Line B'),
(5, 'GPS002', 'Orgrimmar', 'Line B'),
(6, 'GPS003', 'Orgrimmar', 'Line B'),

(7, 'GPS001', 'Ironforge', 'Line C'),
(8, 'GPS002', 'Ironforge', 'Line C'),
(9, 'GPS003', 'Ironforge', 'Line C'),

(10, 'GPS004', 'Thunder Bluff', 'Line D'),
(11, 'GPS005', 'Thunder Bluff', 'Line D'),
(12, 'GPS006', 'Thunder Bluff', 'Line D');

INSERT INTO Address (Passenger_ID, ZIP, StreeName, CivicNumber, City, Country) VALUES
(1, 1000, 'King\'s Road', '1A', 'Stormwind', 'Azeroth'),
(2, 1001, 'Mage Quarter', '2B', 'Stormwind', 'Azeroth'),
(3, 1002, 'Valley of Wisdom', '3C', 'Orgrimmar', 'Azeroth'),
(4, 1003, 'Undercity', '4D', 'Tirisfal Glades', 'Azeroth'),
(5, 1004, 'Cathedral Square', '5E', 'Stormwind', 'Azeroth');

INSERT INTO PhoneNr (Passenger_ID, PhoneNr) VALUES
(1, '1234567890'),
(2, '0987654321'),
(3, '1122334455'),
(4, '5566778899'),
(5, '6677889900');




    