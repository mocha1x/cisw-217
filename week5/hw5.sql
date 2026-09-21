CREATE DATABASE week5hw;

-- Part 1
CREATE TABLE football (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	team_name varchar(100),
	player_name varchar (100),
	player_position varchar (20)
	jersey_number integer
	signed_date date
);

INSERT INTO football (team_name, player_name, player_position, jersey_number, signed_date)
VALUES
    ('Los Angeles Rams', 'Myles Garrett', 'DE', 95, '2026-06-01'),
    ('Buffalo Bills', 'Josh Allen', 'QB', 17, '2025-03-09'),
    ('Atlanta Falcons', 'Bijan Robinson', 'RB', 7, '2026-08-04'),
    ('Los Angeles Rams', 'Matthew Stafford', 'QB', 9, '2026-05-21'),
    ('Seattle Seahawks', 'Jaxon Smith-Njigba', 'WR', 11, '2026-03-25');

-- Part 2
ALTER TABLE football
	ADD COLUMN height_inches real,
	ADD COLUMN salary_millions numeric(6,2),
	ADD COLUMN contract_length interval,
	ADD COLUMN is_active boolean;

-- Part 3
UPDATE football
SET height_inches = 76,
    salary_millions = 41.64,
    contract_length = '5 years',
    is_active = FALSE
WHERE player_name = 'Myles Garrett';

UPDATE football
SET height_inches = 77,
    salary_millions = 55.00,
    contract_length = '6 years',
    is_active = TRUE
WHERE player_name = 'Josh Allen';

UPDATE football
SET height_inches = 71,
    salary_millions = 22.25,
    contract_length = '3 years',
    is_active = TRUE
WHERE player_name = 'Bijan Robinson';

UPDATE football
SET height_inches = 75,
    salary_millions = 55.00,
    contract_length = '1 year',
    is_active = TRUE
WHERE player_name = 'Matthew Stafford';

UPDATE football
SET height_inches = 72,
    salary_millions = 42.15,
    contract_length = '4 years',
    is_active = TRUE
WHERE player_name = 'Jaxon Smith-Njigba';

-- Part 4
ALTER TABLE football
RENAME COLUMN salary_millions TO annual_salary_millions;

-- Part 5
SELECT * FROM football;

SELECT player_name, team_name, player_position FROM football;

SELECT player_name, team_name FROM football
WHERE player_position = 'QB';

SELECT player_name, height_inches FROM football
ORDER BY height_inches DESC;

SELECT player_name, annual_salary_millions, contract_length FROM football
WHERE annual_salary_millions > 40
ORDER BY annual_salary_millions DESC;

-- Part 6
-- You can use COPY to import CSV files, and you have control over what is imported and how the data is formatted.
-- You can use math operators when selecting columns of data. This can be useful for something like census data which is used in the book as you can look at a very specific dataset.
-- Can you import other spreadsheet formats like XLS, XML, TSV, or XLSX files?

-- Reflection
-- I found numeric the most useful because I'm able to set the parameters around it, using it for salary, which is useful when looking at how each player is paid.
-- I chose them because they looked the most interesting out of the selection, and I was able to find columns that would match with their use case.
-- ALTER TABLE adds and removes columns, while UPDATE changes the data inside your rows.
