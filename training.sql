"SELECT people with age 50 or higher"
SELECT * FROM people WHERE age > 50 ORDER BY age DESC;
"In your application, there is a section for adults only. You need to get a list of names and ages of users from the users table, who are 18 years old or older."
SELECT * FROM users WHERE age >=18
"Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US."
SELECT * FROM travelers WHERE country NOT IN ('Canada', 'Mexico','USA');
"you need to return the same table where all letters are lowercase in the race column."
UPDATE demographics
SET race = LOWER(race);
SELECT * FROM demographics;
"For this challenge you need to create a simple SUM statement that will sum all the ages."
SELECT SUM(age) AS age_sum FROM people;
"For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people."
SELECT MIN(age) as age_min, MAX(age) as age_max FROM people;
"Your task is to sort the information in the provided table 'companies' by number of employees (high to low). Returned table should be in the same format as provided:"
SELECT * FROM companies ORDER BY employees DESC;
"Return a table with two columns (number1, number2), the value in number1 should be rounded down and the value in number2 should be rounded up."
SELECT FLOOR(number1) AS number1,
 CEILING(number2) AS number2 FROM decimals;
"Return a table with one column (mod) which is the output of number1 modulus number2."
SELECT number1 % number2 AS mod FROM decimals;
"The monsters in the provided table have too many characteristics, they really only need one each. Your job is to trim the characteristics down so that each monster only has one. If there is only one already, provide that. If there are multiple, provide only the first one (don't leave any commas in there)."
SELECT id, name, SPLIT_PART(characteristics, ',', 1) AS characteristic
FROM monsters
ORDER BY id
"Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students."
 SELECT name,age,semester,mentor, tuition_received FROM students WHERE tuition_received= FALSE;
"Please use SELECT statement and IN to filter out other origins. In the results show how many products are from United States of America and Canada respectively.Order by number of products, descending."
SELECT country, COUNT(*) AS products FROM products WHERE country IN ('United States of America', 'Canada') GROUP BY country ORDER BY products DESC;





