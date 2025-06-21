CREATE DATABASE uber;
USE uber;

CREATE TABLE uber_data (
    request_id INT,
    pickup_point VARCHAR(100),
	driver_id INT,
	status VARCHAR(50),
    request_timestamp DATETIME,
    Drop_timestamp DATETIME,
    Request_date DATE,
    Request_hour INT,
    Request_day VARCHAR(100),
    Request_hour_timeslot VARCHAR(100),
    Drop_date DATE,
    Drop_hour INT,
    Drop_day VARCHAR(50),
    Drop_hour_timeslot VARCHAR(100)
    );
    
SELECT * FROM uber_data;
   
SELECT Pickup_point, COUNT(*) AS total_requests
FROM uber_data
GROUP BY Pickup_point;

SELECT Status, COUNT(*) AS total
FROM uber_data
GROUP BY Status;

SELECT 
  HOUR(Request_timestamp) AS hour,
  COUNT(*) AS total_requests
FROM uber_data
GROUP BY hour
ORDER BY hour;


SELECT
    HOUR(Request_timestamp) AS hour,
    COUNT(*) AS total_requests,
    SUM(CASE WHEN Status = 'Trip Completed' THEN 1 ELSE 0 END) AS completed,
    SUM(CASE WHEN Status IN ('No Cars Available', 'Cancelled') THEN 1 ELSE 0 END) AS unfulfilled
FROM uber_data
GROUP BY hour
ORDER BY hour;

SELECT Pickup_point,
    COUNT(*) AS total_requests,
    SUM(CASE WHEN Status = 'No Cars Available' THEN 1 ELSE 0 END) AS gaps
FROM uber_data
GROUP BY Pickup_point
ORDER BY gaps DESC;

SELECT
    AVG(TIMESTAMPDIFF(MINUTE, Request_timestamp, Drop_timestamp)) AS avg_trip_minutes
FROM uber_data
WHERE Status = 'Trip Completed';
