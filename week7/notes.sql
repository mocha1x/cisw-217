-- Create a table that stores information about video games
CREATE TABLE games (
    -- Automatically generates a unique ID for each game
    game_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Stores the name of the game
    title varchar(100) NOT NULL,

    -- Stores the genre of the game
    genre varchar(50),

    -- Stores the price with 2 decimal places
    price numeric(6,2)
);

-- Add three games to the games table
INSERT INTO games (title, genre, price)
VALUES
    ('Elden Ring', 'RPG', 59.99),
    ('Minecraft', 'Sandbox', 29.99),
    ('Helldivers 2', 'Shooter', 39.99);

-- Create a second table that stores game reviews
CREATE TABLE reviews (
    -- Automatically generates a unique ID for each review
    review_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Connects each review to a game in the games table
    game_id integer REFERENCES games(game_id),
	-- REFERENCES table_name(column_name)
	-- An FK (foreign key) is just a PK (primary key) from another table

    -- Stores the review score
    score integer
);

-- How are these two tables connected?
-- These are connected by games.game_id / reviews.game_id

-- Primary key uniquely identifies row
-- Foreign key references a row in another table

-- Think of it as:
-- PK: identifies the record
-- FK: connects to the record

-- Add reviews and connect them to games using game_id
INSERT INTO reviews (game_id, score)
VALUES
    (1, 10), -- Elden Ring
    (2, 9),  -- Minecraft
    (1, 8);  -- Elden Ring

-- why do we use JOINS?
-- a JOIN allows our program to combine related information for us

SELECT * FROM reviews

-- INNER JOIN - gives me rows that have a match in both tables
-- select the game title from games and the score from reviews
SELECT games.title, reviews.score -- table_name.column_name
-- start with games table
FROM games
-- connect reviews table to games table
INNER JOIN reviews
-- match rows where both tables have the same game id
ON games.game_id = reviews.game_id;
-- this line tells Postgre HOW the 2 tables are related
-- ON games.game_id = reviews.game_id;

-- Postgre asks:
-- does this game_id match this game_id?

-- LEFT JOIN keeps everything from the left table
-- select game title and its review score
SELECT games.title, reviews.score
FROM games
LEFT JOIN reviews
ON games.game_id = reviews.game_id;
-- Helldivers appears now because we used LEFT JOIN, as a LEFT JOIN keeps everything from the left table
-- INNER JOIN = Only matching rows
-- LEFT JOIN = Everything from the left
--				+ matches from the right

-- NULL tells us there was no matching review

-- Table ALIASES
-- Typing full table names gets annoying and time consuming
-- We create aliases for the table names

-- g is now games, r is now reviews
SELECT g.title, r.score
-- give games the alias of g
FROM games as g
-- give reviews alias of r
INNER JOIN reviews as r
-- connect to tables via PK/FK
on g.game_id = r.game_id
WHERE r.score >= 9
ORDER BY r.score ASC;

-- how to create table named games
CREATE TABLE students(student_id integer PRIMARY KEY, student_name varchar(100), major text);

-- how to insert data into table
INSERT INTO students (student_id,student_name,major)
VALUES
(401265, 'Sebastian', 'Networking'),
(401567, 'Marcus', 'Networking');

-- query that selects every column and every row
SELECT * FROM students;
-- * pulls everything from table

-- only want to see certain columns
SELECT student_name, major
FROM students;

-- only want to see students who are in the Networking program
SELECT student_name, major
FROM students
WHERE major = 'Networking';

-- what if i had 2 conditions that had to be true
SELECT student_name, major
FROM students
WHERE major = 'Networking'
AND student_id = 401265;

-- if we wanted to sort even more
-- use ORDER BY
-- ASC is lowest to highest
-- DESC is high to low

-- FUNCTIONS
-- perform calculations over multiple rows
-- count how many students exist
SELECT COUNT(*)
FROM students;

-- average tuition cost
SELECT AVG(tuition_cost)
FROM students;

-- highest tuition cost
SELECT MAX(tuition_cost)
FROM students;

-- COUNT() = count
-- SUM() = Total
-- AVG() = Average
-- MIN() = Minimum
-- MAX() = Maximum

-- how to update/alter table
-- change the major of the student with the id of 102 to cyber
UPDATE students
-- update changes existing data
-- set the new value
SET major='Cybersecurity'
-- only change the specific row
WHERE student_id = 102;

-- ALTER TABLE changes the table itself, creating a column
-- modify the structure of the students table
ALTER TABLE students
-- add a column
ADD COLUMN tuition_cost numeric(10,2);

-- NULL means the value is missing or unknown
-- NOT NULL requires a value, add NOT NULL after the data type (ColumnName, data type, not null)
student_name varchar(100) NOT NULL
