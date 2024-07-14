-- Drop the database if it already exists
DROP DATABASE IF EXISTS soccerleague;

-- Create the database
CREATE DATABASE soccerleague;

-- Connect to the newly created database
\c soccerleague;

-- Create the Team table
CREATE TABLE Team (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER
);

-- Create the Players table
CREATE TABLE Players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES Team(id)
);

-- Create the Season table
CREATE TABLE Season (
    id SERIAL PRIMARY KEY,
    season_no INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create the Referees table
CREATE TABLE Referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the Games table
CREATE TABLE Games (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES Team(id),
    team2_id INTEGER REFERENCES Team(id),
    refree_id INTEGER REFERENCES Referees(id),
    season_id INTEGER REFERENCES Season(id)
);

-- Create the Scores table
CREATE TABLE Scores (
    id SERIAL PRIMARY KEY,
    games_id INTEGER REFERENCES Games(id),
    player_id INTEGER REFERENCES Players(id)
);
