# set-2
#------------------------------------------------------------------- 

# 1. Write a query to display the number of tickets as "No_of_Tickets" booked by Kochi Customers. 
# The Query should display the Profile_Id, First_Name, Base_Location and number of tickets booked. 

select  app.profile_id,app.first_name,app.mobile_number,app.email_id,count(ticket_id) as No_of_Tickets
from air_passenger_profile app inner join air_ticket_info ati 
on app.profile_id=ati.profile_id
inner join air_flight af
on ati.flight_id=af.flight_id
where app.address like '%Kochi%' group by app.profile_id
order by app.profile_id;


#------------------------------------------------------------------- 
#2. Write a query to display the flight_id, from_location, to_location, number of Services as "No_of_Services" offered in the month of May.  
#Hint:The number of services can be calculated from the number of scheduled departure dates of the flight 
# Display the records sorted in ascending order based on flight id. 

select af.flight_id,af.from_location,af.to_location, count(afd.flight_departure_date) as No_of_Services
from air_flight af , air_flight_details afd
where MONTHNAME(afd.flight_departure_date) = 'MAY' group by af.flight_id;


#------------------------------------------------------------------- 

#3. Write a query to display profile id,last name,mobile number and email id of passengers whose base location is chennai. 
#Display the records sorted in ascending order based on profile id.

select profile_id,last_name,mobile_number,email_id from air_passenger_profile where address like "%chennai%" order by profile_id;


#------------------------------------------------------------------- 
select * from air_flight;
#4. Write a query to display number of flights between 6.00 AM and 6.00 PM from chennai. Hint Use FLIGHT_COUNT as alias name.

select count(flight_id) as FLIGHT_COUNT from air_flight where departure_time between '6:00:00' and '18:00:00'; 


#------------------------------------------------------------------- 
#5. Write a query to display unique profile id,first name , email id and contact number of passenger(s) who travelled on flight with id 3148. 
#Display the records sorted in ascending order based on first name. 
select distinct app.profile_id,app.first_name,app.email_id from air_passenger_profile app,air_ticket_info ati 
where ati.flight_id=3148 order by app.profile_id;


#------------------------------------------------------------------- 

#6. Write a query to display the flights available in Morning, AfterNoon, Evening & Night. 
#The Query should display the Flight_Id, From_Location, To_Location , Departure_Time, time of service as "Time_of_Service".  
#Time of Service should be calculated as: From 05:00:01 Hrs to 12:00:00 Hrs -  Morning, 12:00:01 to 18:00:00 Hrs 
#-AfterNoon, 18:00:01 to 24:00:00 - Evening and 00:00:01 to 05:00:00 - Night 
#Display the records sorted in ascending order based on flight id. 

select flight_id,from_location,to_location,departure_time,
case  
when departure_time between '05:00:01'  and '12:00:00' then 'Morning'
when departure_time between '12:00:01'  and '18:00:00' then 'AfterNoon'
when departure_time between '18:00:01'  and '24:00:00' then 'Evening'
when departure_time between '00:00:01'  and '05:00:00' then 'Night'
end as Time_of_Service
from air_flight group by flight_id;


#------------------------------------------------------------------- 
#7. Write a query to display flight id,departure date,flight type of all flights. 
#Flight type can be identified based on the following rules : 
#if ticket price is less than 3000 then 'AIR PASSENGER',
#ticket price between 3000 and less than 4000 'AIR BUS' and 
#ticket price between 4000 and greater than 4000 then 'EXECUTIVE PASSENGER'. 
select af.flight_id,afd.flight_departure_date,
case  
when afd.price<3000 then 'AIR PASSENGER'
when afd.price>3000 and afd.price<4000 then 'AIR BUS'
when afd.price>4000 then 'EXECUTIVE PASSENGER '
end as flight_type
from air_flight af , air_flight_details afd;

desc air_flight;


#------------------------------------------------------------------- 
#8.Write a query to display the credit card type and no of credit cards used on the same type.  
#Display the records sorted in ascending order based on credit card type. 
#Hint: Use CARD_COUNT AS Alias name for no of cards

select card_type,count(card_number) as CARD_COUNT from air_credit_card_details group by card_type order by card_type;
#------------------------------------------------------------------- 
#9.Write a Query to display serial no, first name,mobile number,email id of all the passengers 
#who holds email address from gmail.com. 
#The Serial No will be the last three digits of profile ID. 
#Hint: Use SERIAL_NO as Alias name for serial number. 
#Display the records sorted in ascending order based on name.
select right(profile_id,3) as SERIAL_NO,first_name,mobile_number,email_id from air_passenger_profile where email_id like '%gmail.com' order by first_name;

#------------------------------------------------------------------- 
#10
select af.flight_id,af.from_location,af.to_location,count(afd.flight_departure_date) as 
No_of_Services 
from air_flight af join air_flight_details afd on  
af.flight_id=afd.flight_id 
where month(afd.flight_departure_date)='05' 
group by af.flight_id  
having count(afd.flight_departure_date) <= all (select count(afd.flight_departure_date) 
from air_flight af join air_flight_details afd on  af.flight_id=afd.flight_id 
where month(afd.flight_departure_date)='05' 
group by af.flight_id) 
 order by af.flight_id;

#------------------------------------------------------------------- 
#11
select from_location,count(flight_id) as no_of_flights from air_flight group by from_location order by from_location;
#------------------------------------------------------------------- 
#12
select af.flight_id,af.from_location,af.to_location,ati.flight_departure_date,
count(ati.ticket_id) as No_of_Passengers 
from air_flight af join air_ticket_info ati on af.flight_id=ati.flight_id 
group by af.flight_id,ati.flight_departure_date 
order by af.flight_id,ati.flight_departure_date; 
#------------------------------------------------------------------- 
#13

select af.flight_id,afd.flight_departure_date,af.from_location,af.to_location,af.duration 
from air_flight af join air_flight_details afd on af.flight_id=afd.flight_id 
where duration<'1:10:00' 
group by af.flight_id,afd.flight_departure_date  
order by af.flight_id,afd.flight_departure_date; 
#------------------------------------------------------------------- 
#14
select af.flight_id,afd.flight_departure_date,af.from_location,af.to_location,timediff(af.arival_time,af.departure_time)duration
from air_flight af, air_flight_details afd 
where  timediff(af.arival_time,af.departure_time)<'01:10:00' ;
#------------------------------------------------------------------- 
#15
select af.flight_id,af.from_location,af.to_location,
count(afd.flight_departure_date) as No_of_Services, avg(afd.price) as Average_Price 
from air_flight af join air_flight_details afd on af.flight_id=afd.flight_id 
group by af.flight_id 
having avg(afd.price)> (select avg(afd.price) 
			from air_flight_details afd) 
order by afd.price; 