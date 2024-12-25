create database ola;
use ola;

# 1. Retrieve all successful bookings:
create view successful_bookings as
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';


#2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM bookings 
GROUP BY Vehicle_Type;
select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view canceled_rides_by_customers as
SELECT count(*) 
FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';
select * from canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides 
DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_P_C_issues as
SELECT COUNT(*) 
FROM bookings 
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_driver_rating as
SELECT MAX(Driver_Ratings) as max_rating, 
MIN(Driver_Ratings) as min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
create view UPI_Payments as
SELECT * 
FROM bookings 
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
create view AVG_Cust_rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view total_successful_value as
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'Yes';
