/* average fare amount varies between different vendors */
select VendorID, AVG(fare_amount) from cab-data-devashri.cab_data_analysis_de.fact_table
GROUP BY VendorID;

/* average tip amount for each payment type */
select b.payment_type_name, AVG(a.tip_amount) from cab-data-devashri.cab_data_analysis_de.fact_table a 
join cab-data-devashri.cab_data_analysis_de.payment_type_dim b
ON a.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

/* top 10 pickup locations based on the number of trips */
SELECT pl.pickup_latitude,pl.pickup_longitude, COUNT(ft.pickup_location_id) AS trip_count FROM `cab-data-devashri.cab_data_analysis_de.fact_table` ft
JOIN  `cab-data-devashri.cab_data_analysis_de.pickup_location_dim` pl
ON ft.pickup_location_id = pl.pickup_location_id
GROUP BY pl.pickup_latitude, pl.pickup_longitude
ORDER BY trip_count DESC LIMIT 10;

/* the total number of trips grouped by passenger count */
SELECT b.passenger_count, COUNT(*) AS total_trips
FROM `cab-data-devashri.cab_data_analysis_de.fact_table` a
JOIN `cab-data-devashri.cab_data_analysis_de.passenger_count_dim` b
ON a.passenger_count_id = b.passenger_count_id
GROUP BY b.passenger_count
ORDER BY total_trips DESC;

/* the average fare amount by hour of the day */
SELECT d.pick_hour AS hour_of_day,AVG(f.fare_amount) AS average_fare_amount
FROM `cab-data-devashri.cab_data_analysis_de.fact_table` f
JOIN `cab-data-devashri.cab_data_analysis_de.datetime_dim` d
ON f.datetime_id = d.datetime_id
GROUP BY d.pick_hour
ORDER BY d.pick_hour;



