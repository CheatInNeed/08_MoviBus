use MoviBus;
######################################################################
#######################SQL Data Modifications#########################
######################################################################
Select * from BusRide;

INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) VALUES
('2024-11-08', '08:00:00', '00:30:00', 'GPS001', 'GPS002', 1, 'Stormwind', 'Line A');

UPDATE BusRide
SET Passenger_ID = 3
WHERE RideDate = '2024-11-01';

DELETE FROM BusRide
WHERE RideDate = '2024-11-03';

Select * from BusRide;

######################################################################
###########################SQL Data Queries###########################
######################################################################

#Show the ID of the passengers who took a ride from the first stop of the line taken.

select Passenger_ID from BusRide inner join Serves on Serves.Line_FinalDestination = BusRide.Line_FinalDestination
where StopNr = 1;



#Show the name of the bus stop served my most lines.

select Occurrences.StopName, Occurrences.Stop_GPS, max(Occurrences.CountStops)
from
(select BusStop.StopName, BusStop.StopGPS, Serves.Stop_GPS, Count(*) as CountStops from BusStop
inner join Serves
ON BusStop.StopGPS = Serves.Stop_GPS
GROUP BY Serves.Stop_GPS
) as Occurrences;



#For each line, show the ID of the passenger who took the ride that lasted longer.

select Line_Name, Passenger_ID, Max(Duration) from BusRide
GROUP BY Line_Name;


#Show the ID of the passengers who never took a bus line more than once per day.

Select Passenger_ID from BusRide
GROUP by Passenger_ID
HAVING count(RideDate) = Count(DISTINCT RideDate, Passenger_ID);



#Show the name of the bus stops that are never used, that is, they are neither the
#start nor the end stop for any ride.

Select BusStop.StopName, BusStop.StopGPS from BusRide
inner join BusStop
where BusStop.StopGPS not in (select StartGPS from BusRide) and 
BusStop.StopGPS not in (select EndGPS from BusRide)
GROUP BY BusStop.StopGPS;


######################################################################
#########################SQL PROGRAMMING##############################
######################################################################

# A function that, given two stops, returns how many lines serve both stops.

DROP FUNCTION IF EXISTS LinesServingStops;
DELIMITER //
CREATE FUNCTION LinesServingStops(stopOne VARCHAR(30), stopTwo VARCHAR(30))
RETURNS INT
BEGIN
	RETURN (
        SELECT COUNT(DISTINCT serves1.Line_Name, serves1.Line_FinalDestination) FROM Serves serves1
        INNER JOIN Serves serves2 ON serves1.Line_Name = serves2.Line_Name AND serves1.Line_FinalDestination = serves2.Line_FinalDestination
        WHERE serves1.Stop_GPS = stopOne AND serves2.Stop_GPS = stopTwo
    );
END//
DELIMITER ;

SELECT LinesServingStops("GPS003", "GPS004") as LinesServingStops;

select * from Serves;

/*
A procedure that, given a line and a stop, adds the stop to that line (after
the last stop) if not already served by that line.
*/

DROP PROCEDURE IF EXISTS AddStop;
DELIMITER //
CREATE PROCEDURE AddStop
(IN LineName VARCHAR(30), IN FinalDestination VARCHAR(30), IN NewStopGPS VARCHAR(30))
BEGIN
	DECLARE LastStopNr INT;
    SET LastStopNr = 0;
    
	IF NOT EXISTS (SELECT * FROM Serves where
    Stop_GPS = NewStopGPS AND
    Line_FinalDestination = FinalDestination AND
    Line_Name = LineName) THEN
    
		SET LastStopNr = (Select Max(StopNr) 
        From Serves 
        WHERE Line_Name = LineName AND Line_FinalDestination = FinalDestination);
        
        INSERT INTO Serves (StopNr, Stop_GPS, Line_FinalDestination, Line_Name) 
		VALUES (LastStopNr + 1, NewStopGPS, FinalDestination, LineName);
	END IF;
END//
DELIMITER ;

CALL AddStop('Line A', 'Stormwind', 'GPS007');

CALL AddStop('Line A', 'Stormwind', 'GPS004');

Select * from Serves;

/*
A trigger that prevents inserting a ride starting and ending at the same stop,
or at a stop not served by that line.
*/

DROP TRIGGER IF EXISTS InsertRide;
DELIMITER //
CREATE TRIGGER InsertRide
BEFORE INSERT ON BusRide FOR EACH ROW
BEGIN
	
	IF(NEW.StartGPS = NEW.EndGPS) THEN
		SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO = 1525, MESSAGE_TEXT = 'Invalid Start/Stop';
	END IF;
    
    IF NOT EXISTS (SELECT * FROM Serves 
    where Stop_GPS = New.StartGPS AND
    Line_FinalDestination = NEW.Line_FinalDestination AND
    Line_Name = NEW.Line_Name) THEN
    		SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO = 1525, MESSAGE_TEXT = 'Stop is not served by that line';
    END IF;
    
    IF NOT EXISTS (SELECT * FROM Serves 
    where Stop_GPS = New.EndGPS AND
    Line_FinalDestination = NEW.Line_FinalDestination AND
    Line_Name = NEW.Line_Name) THEN
    		SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO = 1525, MESSAGE_TEXT = 'Stop is not served by that line';
    END IF;
    
END//
DELIMITER ;	
-- Doesn't work 
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) 
VALUES ('2024-11-04', '12:00:00', '00:30:00', 'GPS001', 'GPS001', 1, 'Stormwind', 'Line A');

-- Doesn't work 
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) 
VALUES ('2024-11-04', '12:00:00', '00:30:00', 'GPS006', 'GPS002', 1, 'Stormwind', 'Line A');

-- Doesn't work 
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) 
VALUES ('2024-11-04', '12:00:00', '00:30:00', 'GPS001', 'GPS006', 1, 'Stormwind', 'Line A');

-- Works
INSERT INTO BusRide (RideDate, StartTime, Duration, StartGPS, EndGPS, Passenger_ID, Line_FinalDestination, Line_Name) 
VALUES ('2024-11-04', '12:00:00', '00:30:00', 'GPS001', 'GPS002', 1, 'Stormwind', 'Line A');