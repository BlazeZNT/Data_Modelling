-- Drop the database if it already exists
DROP DATABASE IF EXISTS craglist;

-- Create the database
CREATE DATABASE craglist;

-- Connect to the newly created database
\c craglist;

-- Create the Post_region table
CREATE TABLE Post_region (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region INTEGER REFERENCES Post_region(id)
);

-- Create the Categories table
CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

-- Create the Posts table
CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES Users(id),
    location TEXT,
    post_region_id INTEGER REFERENCES Post_region(id),
    category_id INTEGER REFERENCES Categories(id)
);
