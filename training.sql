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
SELECT FLOOR(number1) as number1,
 CEILING(number2) as number2 FROM decimals;
"Return a table with one column (mod) which is the output of number1 modulus number2."
SELECT number1 % number2 AS mod FROM decimals;










