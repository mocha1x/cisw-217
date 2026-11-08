-- 1
CREATE DATABASE week12_lab;

CREATE TABLE genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50) NOT NULL UNIQUE,
	description VARCHAR(255)
);

CREATE TABLE games (
	game_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	developer VARCHAR(100),
	release_year INT,
	price NUMERIC(6,2),
	genre_id INT REFERENCES genres (genre_id)
);

-- 2
INSERT INTO genres (genre_name, description) VALUES
	('FPS', 'First-person shooters'),
	('Horror', 'Games built around fear and suspense'),
	('MOBA', 'Team-based arena battle games'),
	('Racing', 'Driving and racing games');

INSERT INTO games (title, developer, release_year, price, genre_id) VALUES
	('Counter-Strike 2', 'Valve', 2023, 0.00, 1),
	('Rainbow Six Siege', 'Ubisoft', 2015, 0.00, 1),
	('Phasmophobia', 'Kinetic Games', 2020, 19.99, 2),
	('Dota 2', 'Valve', 2013, 0.00, 3),
	('Forza Horizon 5', 'Playground Games', 2021, 59.99, 4);

-- Foreign key test
INSERT INTO games (title, developer, release_year, price, genre_id)
VALUES ('Minecraft 2', 'Mojang', 2027, 9.99, 99);
-- It fails because no genre has genre_id of 99, so the foreign key blocks it from being added

-- 3
SELECT genres.genre_name,
	games.title,
	games.developer
FROM games
JOIN genres
ON games.genre_id = genres.genre_id;

-- Reflection questions
-- I created a one to many relationship because one genre can have many games, but each game belongs to only one genre
-- SQL would block the delete with a foreign key error because those games would point to a genre that no longer exists
-- Delete test
DELETE FROM genres WHERE genre_name = 'FPS';
-- ERROR:  update or delete on table "genres" violates foreign key constraint "games_genre_id_fkey" on table "games"
-- Key (genre_id)=(1) is still referenced from table "games". 
-- SQL state: 23503
-- Detail: Key (genre_id)=(1) is still referenced from table "games".

-- A foreign key makes sure every game points to a real genre, so the database can't end up with broken links
