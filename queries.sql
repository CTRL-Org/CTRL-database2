:-- queries.sql

-- This file contains SQL queries for the system, grouped by their respective entities.

-- Placeholders (e.g., $1, $2) are used as parameters 

-- USER QUERIES



-- Registration

-- Inserts a new user into the User table, capturing their role, username, email, and other essential details.

INSERT INTO User (Role, Username, Password, Email, PhoneNumber)

VALUES ($1, $2, $3, $4, $5);



-- Login

-- Verifies if a username and password combination exists in the database, allowing access to the system.

SELECT UserID, Role

FROM User

WHERE Username = $1 AND Password = $2;



-- Profile Updates

-- Updates user information such as email, phone number, or password based on their UserID.

-- Update Email

UPDATE User

SET Email = $1

WHERE UserID = $2;



-- Update Phone Number

UPDATE User

SET PhoneNumber = $1

WHERE UserID = $2;



-- Update Password

UPDATE User

SET Password = $1

WHERE UserID = $2;



-- APPOINTMENT QUERIES



-- Add Appointment

-- Inserts a new appointment into the Appointment table, associating it with a patient and provider.

INSERT INTO Appointment (PatientID, DateTime, Reason, Status)

VALUES ($1, $2, $3, $4);



-- Fetch Upcoming Appointments

-- Retrieves a list of future appointments for a given patient.

SELECT AppointmentID, DateTime, Reason, Status

FROM Appointment

WHERE PatientID = $1 AND DateTime > CURRENT_TIMESTAMP

ORDER BY DateTime ASC;



-- HEALTH STATS QUERIES



-- Add Health Stats

-- Inserts new health statistics (e.g., blood pressure, weight) for a patient into the HealthStats table.

INSERT INTO HealthStats (PatientID, DataType, Value, Timestamp)

VALUES ($1, $2, $3, CURRENT_TIMESTAMP);



-- Fetch Patient Stats

-- Retrieves a patient’s health statistics for a given time range.

SELECT StatID, DataType, Value, Timestamp

FROM HealthStats

WHERE PatientID = $1 AND Timestamp BETWEEN $2 AND $3

ORDER BY Timestamp DESC;



