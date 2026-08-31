select salary,first_name from teachers
ORDER by salary desc;

select last_name, school, hire_date from teachers
order by school asc, hire_date desc;

-- we can find unique values by using distinct after select
SELECT DISTINCT school FROM teachers;

-- where allows us to retrieve only rows that meet a criteria
SELECT first_name, last_name, school
FROM teachers
WHERE school = 'Myers Middle School'

-- comparison operators
-- = equal to
-- <> or != not equal to
-- > greater than
-- < less than
-- >= greater than or equal to
-- <= less than or equal to
-- BETWEEN: within a range
-- IN: match one of several values

SELECT first_name, hire_date
FROM teachers
-- find teachers hired before 1/1/2010
WHERE hire_date < '2010-01-01'

-- want to see teachers who make 40k-60k
SELECT first_name, last_name, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 60000

SELECT first_name FROM teachers
WHERE first_name LIKE 'Sam%'
-- % is a wildcard, any number of characters can appear
-- LIKE vs ILIKE
-- LIKE is case sensitive
-- ILIKE is not case sensitive

-- _ matches exactly one character
SELECT first_name FROM teachers
WHERE first_name LIKE '_anet'

-- we use AND when both conditions must be true
SELECT * FROM teachers
WHERE school = 'Myers Middle School' AND salary < 40000

-- A row must satisfy both conditions

-- use OR when either condition can be true
SELECT * FROM teachers
WHERE last_name = 'Cole' OR last_name = 'Bush'

-- using parantheses become important when combining AND and OR
SELECT * from teachers
WHERE school = 'F.D. Roosevelt HS'
AND (salary < 38000 OR salary > 40000)
