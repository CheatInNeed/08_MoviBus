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
    
    