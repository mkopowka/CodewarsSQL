/*SELECT people with age 50 or higher*/
SELECT * FROM people WHERE age > 50 ORDER BY age DESC;
/*In your application, there is a section for adults only. You need to get a list of names and ages of users from the users table, who are 18 years old or older.*/
SELECT * FROM users WHERE age >=18
/*Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US.*/
SELECT * FROM travelers WHERE country NOT IN ('Canada', 'Mexico','USA');
/*you need to return the same table where all letters are lowercase in the race column.*/
UPDATE demographics
SET race = LOWER(race);
SELECT * FROM demographics;
/*For this challenge you need to create a simple SUM statement that will sum all the ages.*/
SELECT SUM(age) AS age_sum FROM people;
/*For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.*/
SELECT MIN(age) as age_min, MAX(age) as age_max FROM people;
/*Your task is to sort the information in the provided table 'companies' by number of employees (high to low). Returned table should be in the same format as provided:*/
SELECT * FROM companies ORDER BY employees DESC;
/*Return a table with two columns (number1, number2), the value in number1 should be rounded down and the value in number2 should be rounded up.*/
SELECT FLOOR(number1) AS number1,
 CEILING(number2) AS number2 FROM decimals;
/*Return a table with one column (mod) which is the output of number1 modulus number2.*/
SELECT number1 % number2 AS mod FROM decimals;
/*The monsters in the provided table have too many characteristics, they really only need one each. Your job is to trim the characteristics down so that each monster only has one. If there is only one already, provide that. If there are multiple, provide only the first one (don't leave any commas in there).*/
SELECT id, name, SPLIT_PART(characteristics, ',', 1) AS characteristic
FROM monsters
ORDER BY id
/*Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students.*/
 SELECT name,age,semester,mentor, tuition_received FROM students WHERE tuition_received= FALSE;
/*Please use SELECT statement and IN to filter out other origins. In the results show how many products are from United States of America and Canada respectively.Order by number of products, descending.*/
SELECT country, COUNT(*) AS products FROM products WHERE country IN ('United States of America', 'Canada') GROUP BY country ORDER BY products DESC;
/*Please use Data Manipulation Language and not Data Definition Language to solve this Kata*/
Select 'hello world!' AS "Greeting"
/* There is truly no magic in the world; the Hogwarts Sorting Hat is SQL-based, its decision-making powers are common operators and prospectIve students are merely data - names, and two columns of qualities.
students
id
name
quality1
quality2
Slytherin are being quite strict this year and will only take students who are evil AND cunning.
Gryffindor will take students who are brave but only if their second quality is NOT evil.
Ravenclaw accepts students who are studious OR intelligent.
Hufflepuff will simply take those who have the quality hufflepuff.
(don't worry, for simplicity's sake 'brave' and 'studious' will only appear in quality1, and 'cunning' and 'intelligent' will only appear in quality2.)
Return the id, name, quality1 and quality2 of all the students who'll be accepted, ordered by ascending id. */
SELECT *
FROM students
WHERE (quality1 = 'evil' AND quality2 = 'cunning')
OR (quality1 = 'brave' AND quality2 <> 'evil')
OR (quality1 = 'studious' OR quality2 = 'intelligent')
OR (quality1 = 'hufflepuff' OR quality2 = 'hufflepuff')
ORDER BY id ASC;
/* You work at a book store. It's the end of the month, and you need to find out the 5 bestselling books at your store. Use a select statement to list names, authors, and number of copies sold of the 5 books which were sold most.
books table schema
name
author
copies_sold*/
SELECT *
FROM books
ORDER BY copies_sold DESC
LIMIT 5;
/*You are given a table numbers with just one column, number. It holds some numbers that are already ordered.
You need to write a query that makes them un-ordered, as in, every possible ordering should appear equally often. */
SELECT number FROM numbers
ORDER BY RANDOM();
/* You are the owner of the Grocery Store. All your products are in the database, that you have created after CodeWars SQL excercises!:)
Today you are going to CompanyA warehouse
You need to check what products are running out of stock, to know which you need buy in a CompanyA warehouse.
Use SELECT to show id, name, stock from products which are only 2 or less item in the stock and are from CompanyA.
Order the results by product id
products table schema
id
name
price
stock
producent
results table schema
id
name
stock*/
SELECT id,name,stock FROM products WHERE stock <=2 AND producent='CompanyA' ORDER BY stock ASC;
