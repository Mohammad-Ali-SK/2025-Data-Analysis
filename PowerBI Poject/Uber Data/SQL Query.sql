-- ✅  Exploratory SQL Analysis on Uber Trip Dataset --

Select  * from uber_data

-- 🟢 Basic SQL Questions (1–7)

-- 1. Retrieve all columns from the table.
SELECT * FROM uber_data

-- 2. Show all trips where the passenger count is greater than 2.

SELECT * FROM uber_data
WHERE
	"passenger_count" >= 2


-- 3. Get the total number of trips.

SELECT COUNT("Trip_ID") FROM uber_data;

-- 4. List all unique vehicle types used.
SELECT
	DISTINCT("Vehicle") AS vehicle_type
FROM uber_data

-- 5. Find trips where fare amount is greater than 20.

SELECT * FROM uber_data
WHERE
	"fare_amount" >= 20;


-- 6. Count the number of trips for each payment type.
SELECT 
	"Payment_type" as Payment_type,
	COUNT("Trip_ID") as Number_of_trips
FROM uber_data
GROUP BY
	Payment_type
ORDER BY Number_of_trips DESC;

-- 7. Find the earliest and latest pickup times.
SELECT 
	MIN("Pickup_Time_Hour") AS earliest_pickup,
	MAX("Pickup_Time_Hour") AS latest_pickup
FROM uber_data;

-- ---

-- 🟡 Intermediate SQL Questions (8–14)

-- 8. Show average trip duration grouped by vehicle type.

SELECT
	"Vehicle" AS vehicle_type,
	ROUND(AVG("Trip_Duration_(min)")) AS avg_trip_duration_min
FROM uber_data
GROUP BY
	vehicle_type;

-- 9. Find total fare amount collected for each PU\_City.

SELECT
	"PU_City" AS pu_city,
	SUM("fare_amount") AS total_fare_amount
FROM uber_data
GROUP BY
	pu_city
ORDER BY
	total_fare_amount DESC;
	
-- 10. List the top 5 most frequent pickup locations.
SELECT
	"PU_Location" AS pu_location,
	COUNT("Trip_ID") AS number_of_trip
FROM uber_data
GROUP BY
	pu_location
ORDER BY
	number_of_trip DESC
LIMIT 5;

-- 11. Get the average surge fee for each payment type.
SELECT
	"Payment_type" AS payment_type,
	ROUND(AVG("Surge_Fee")::NUMERIC,2) AS avg_surge_fee
FROM uber_data
GROUP BY
	payment_type


-- 12. Count how many trips were completed by each vehicle type.
SELECT
	"Vehicle" AS vehicle_type,
	COUNT("Trip_ID") AS num_trip
FROM uber_data
GROUP BY
	vehicle_type
ORDER BY
	num_trip DESC


-- 13. Find trips that started in Manhattan and ended in Queens.
SELECT * FROM uber_data
WHERE
	"PU_City" = 'Manhattan'
	AND
	"DO_City" = 'Queens'

-- 14. Calculate average trip distance per hour of the day.

SELECT
    "Pickup_Time_Hour" AS pickup_hour,
    ROUND(AVG("trip_distance")::NUMERIC,2) AS avg_trip_distance
FROM uber_data
GROUP BY pickup_hour
ORDER BY pickup_hour;


-- ---

-- 🔵 Advanced SQL Questions (15–20)

-- 15. Identify the top 3 pickup-dropoff location pairs with the highest number of trips.
SELECT
    "PU_Location" AS pickup_location,
    "DO_Location" AS dropoff_location,
    COUNT("Trip_ID") AS number_of_trips
FROM uber_data
GROUP BY "PU_Location", "DO_Location"
ORDER BY number_of_trips DESC
LIMIT 3;




-- 16. Show total revenue (fare + surge) per city.
SELECT
    "PU_City" AS pu_city,
    SUM(COALESCE("fare_amount", 0) + COALESCE("Surge_Fee", 0)) AS total_revenue
FROM uber_data
GROUP BY "PU_City";

select * from uber_data

-- 17. Rank payment types by total number of trips.
SELECT
    "Payment_type" AS payment_type,
    COUNT("Trip_ID") AS number_of_trips,
    RANK() OVER (ORDER BY COUNT("Trip_ID") DESC) AS payment_rank
FROM uber_data
GROUP BY "Payment_type"
ORDER BY number_of_trips DESC;

-- 18. Calculate average fare per minute for each vehicle type.
SELECT
    "Vehicle" AS vehicle_type,
    AVG("fare_amount" / NULLIF("Trip_Duration_(min)", 0)) AS avg_fare_per_minute
FROM uber_data
GROUP BY "Vehicle";





