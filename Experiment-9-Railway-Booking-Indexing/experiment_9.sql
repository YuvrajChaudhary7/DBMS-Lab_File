
CREATE DATABASE IF NOT EXISTS RailwayLab;
USE RailwayLab;

DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Train;

-- Create Train Table
CREATE TABLE Train (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100),
    source_station VARCHAR(100),
    destination_station VARCHAR(100),
    departure_time TIME
) ENGINE = InnoDB;

-- Create Passenger Table
CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
) ENGINE = InnoDB;

-- Create Booking Table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    journey_date DATE,
    seat_number INT,
    booking_status VARCHAR(20),
    fare DECIMAL(10,2),
    FOREIGN KEY (passenger_id)
        REFERENCES Passenger(passenger_id),
    FOREIGN KEY (train_id)
        REFERENCES Train(train_id)
) ENGINE = InnoDB;

-- Insert Train Records
INSERT INTO Train VALUES
(101, 'Rajdhani Express', 'Delhi', 'Mumbai', '16:30:00'),
(102, 'Shatabdi Express', 'Delhi', 'Bhopal', '06:00:00'),
(103, 'Duronto Express', 'Mumbai', 'Kolkata', '17:45:00'),
(104, 'Gatimaan Express', 'Delhi', 'Agra', '08:10:00'),
(105, 'Vande Bharat', 'Lucknow', 'Delhi', '15:20:00');

-- Insert Passenger Records
INSERT INTO Passenger VALUES
(1, 'Aman', 21, 'Male'),
(2, 'Riya', 22, 'Female'),
(3, 'Karan', 25, 'Male'),
(4, 'Priya', 20, 'Female'),
(5, 'Rahul', 24, 'Male');

-- Insert Booking Records
INSERT INTO Booking VALUES
(1001, 1, 101, '2026-12-01', 12, 'Confirmed', 1500.00),
(1002, 2, 102, '2026-12-02', 15, 'Confirmed', 900.00),
(1003, 3, 103, '2026-12-03', 18, 'Pending', 1800.00),
(1004, 4, 104, '2026-12-04', 20, 'Confirmed', 750.00),
(1005, 5, 105, '2026-12-05', 25, 'Cancelled', 1200.00),
(1006, 1, 103, '2026-12-06', 30, 'Confirmed', 1800.00),
(1007, 2, 101, '2026-12-07', 32, 'Pending', 1500.00),
(1008, 3, 105, '2026-12-08', 35, 'Confirmed', 1200.00);

-- Display Tables
SELECT * FROM Train;
SELECT * FROM Passenger;
SELECT * FROM Booking;

-- Query 1: Find bookings by status
-- Before indexing
EXPLAIN
SELECT * FROM Booking
WHERE booking_status = 'Confirmed';

-- Query 2: Find bookings by journey date
-- Before indexing
EXPLAIN
SELECT * FROM Booking
WHERE journey_date = '2026-12-01';

-- Query 3: Find bookings for a passenger on a date
-- Before indexing
EXPLAIN
SELECT * FROM Booking
WHERE passenger_id = 1
AND journey_date = '2026-12-06';

-- Create Indexes
CREATE INDEX idx_booking_status
ON Booking(booking_status);

CREATE INDEX idx_journey_date
ON Booking(journey_date);

CREATE INDEX idx_passenger_date
ON Booking(passenger_id, journey_date);

-- Display Indexes
SHOW INDEX FROM Booking;

-- Query 1: After indexing
EXPLAIN
SELECT * FROM Booking
WHERE booking_status = 'Confirmed';

-- Query 2: After indexing
EXPLAIN
SELECT * FROM Booking
WHERE journey_date = '2026-12-01';

-- Query 3: After indexing
EXPLAIN
SELECT * FROM Booking
WHERE passenger_id = 1
AND journey_date = '2026-12-06';

-- Join Query
SELECT
    b.booking_id,
    p.passenger_name,
    t.train_name,
    t.source_station,
    t.destination_station,
    b.journey_date,
    b.seat_number,
    b.booking_status,
    b.fare
FROM Booking b
JOIN Passenger p
    ON b.passenger_id = p.passenger_id
JOIN Train t
    ON b.train_id = t.train_id;

-- Count Confirmed Bookings
SELECT COUNT(*) AS confirmed_bookings
FROM Booking
WHERE booking_status = 'Confirmed';

-- Find Total Revenue from Confirmed Bookings
SELECT SUM(fare) AS total_revenue
FROM Booking
WHERE booking_status = 'Confirmed';

-- Display Final Index Information
SHOW INDEX FROM Booking;
