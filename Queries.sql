use MoviBus;

######################################################################
###########################SQL Data Queries###########################
######################################################################

#Show the ID of the passengers who took a ride from the first stop of the line taken.

#QUERIE HERE




#Show the name of the bus stop served my most lines.

select Occurrences.StopName, Occurrences.Stop_GPS, max(Occurrences.CountStops)
from
(select BusStop.StopName, BusStop.StopGPS, Serves.Stop_GPS, Count(*) as CountStops from BusStop
inner join Serves
ON BusStop.StopGPS = Serves.Stop_GPS
GROUP BY Serves.Stop_GPS
) as Occurrences;



#For each line, show the ID of the passenger who took the ride that lasted longer.

#QUERIE HERE




#Show the ID of the passengers who never took a bus line more than once per day.

#QUERIE HERE



#Show the name of the bus stops that are never used, that is, they are neither the
#start nor the end stop for any ride.

Select BusStop.StopName, BusStop.StopGPS from BusRide
inner join BusStop
where BusStop.StopGPS not in (select StartGPS from BusRide) and 
BusStop.StopGPS not in (select EndGPS from BusRide)
GROUP BY BusStop.StopGPS;
