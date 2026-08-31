-- Part A
-- Query 1
create database PracticeDB

-- Query 2
create table Video_Games (
	id serial primary key,
	name varchar(100),
	genre varchar(50),
  metacritic_score INT,
	release_date date
);

-- Query 3
INSERT INTO Video_Games (name, genre, metacritic_score, release_date)
VALUES ('Counter-Strike 2','FPS',82,'2023-09-27'),
('Rocket League','Arcade',85,'2015-07-07'),
('League of Legends','MOBA',78,'2009-10-27');

-- Query 4 with error
INSERT INTO Video_Games (name, genre, metacritic_score, release_date)
VALUES ('Call of Duty: Modern Warfare 4',0,'FPS''2026-10-23')
-- ERROR:  INSERT has more target columns than expressions
-- LINE 6: ... INTO Video_Games (name, genre, metacritic_score, release_da...
                                                                ^ 

-- SQL state: 42601
-- Character: 269

-- Part B
-- I didn't know that you could order by column names. For example in the text it says you can run the command ORDER BY salary DESC; to descend from highest to lowest.
-- Using operators to sort data seems like it can get confusing and become less intuitive, would it not be easier to just use the GUI to do that?
