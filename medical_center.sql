-- Drop the database if it already exists
DROP DATABASE IF EXISTS medical_center;

-- Create the database
CREATE DATABASE medical_center;

-- Connect to the newly created database
\c medical_center;

-- Creating the Patients table
CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL
);

-- Creating the Doctors table
CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    phone_number VARCHAR NOT NULL
);

-- Creating the Cases table
CREATE TABLE Cases (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES Patients(id),
    doctor_id INTEGER NOT NULL REFERENCES Doctors(id),
    date DATE NOT NULL
);

-- Creating the Diagnostics table
CREATE TABLE Diagnostics (
    id SERIAL PRIMARY KEY,
    case_id INTEGER NOT NULL REFERENCES Cases(id),
    results TEXT NOT NULL
);
