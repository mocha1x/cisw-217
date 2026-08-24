select current_timestamp,current_database(),version(),'Hello, SQL!' as message;

create database analysis;

# CREATE DATABASE analysis; to create a database
# Date format should be YYYY-MM-DD
# To make a table in analysis database:
CREATE TABLE teachers (
  id bigserial,
  first_name varchar(25),
  last_name varchar(50),
  school varchar(50),
  hire_date date,
  salary numeric
);
# Semicolons are important in SQL because it signals the end of a command
# I might use names, email addresses, and dates to show if someone signed up to a website
