-- Query 1
create table teachers(teacher_id bigserial PRIMARY KEY, first_name varchar(25), last_name varchar(50), school varchar(50), hire_date date, salary numeric);

-- Query 2
create table Animal_Types(id bigserial PRIMARY KEY, species varchar(25), habitat varchar(50), diet varchar(50));

-- Query 3
create table Animals(id bigserial, name varchar(25), species_id integer, age integer);

-- Query 4
INSERT INTO Animal_Types (species, habitat, diet)
VALUES ('Cheetah','Flat Savannas','Meat'),
('Giant Panda','Mountain Forests','Bamboo'),
('Penguin','Antarctica','Fish');

-- Query 5
INSERT INTO Animals (name,species_id,age)
VALUES ('Chester the Cheetah',1,5),
('Kung Fu Panda',2,8),
('Mumble the Penguin',3,2)

-- Query 6 Experiment with errors
INSERT INTO Animals (namespecies_id,age)
VALUES ('Chester the Cheetah',1,5),
('Kung Fu Panda',2,8),
('Mumble the Penguin',3,2)
-- ERROR:  column "namespecies_id" of relation "animals" does not exist
-- LINE 1: INSERT INTO Animals (namespecies_id,age)
                                ^ 

-- SQL state: 42703
-- Character: 22

-- This tells us that the error is within our values and that what we tried to input data into does not exist.
