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
/*For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the toys table so that you can return the COUNT of the toys

people table schema
id
name
toys table schema
id
name
people_id
You should return all people fields as well as the toy count as "toy_count".*/
SELECT
    people.*,
    COUNT(toys.id) AS toy_count
FROM
    people
LEFT JOIN
    toys ON people.id = toys.people_id
GROUP BY
    people.id;
/* You will need to create SELECT statement in conjunction with LIKE.
Please list people which have first_name with at least 6 character long
names table schema
id
first_name
last_name
results table schema
first_name
last_name */
SELECT first_name,last_name FROM names WHERE first_name LIKE '______%'
/* Complete the SQL query started in the PREPARE statement. The query must accept a single integer parameter that specifies the number of stars in the first line. The placeholder $1 should be used for this parameter. */
prepare draw_pattern(int) as
SELECT REPEAT('*', n) AS star_pattern
FROM generate_series($1, 1, -1) AS n;
/*
For this challenge you need to create a simple SELECT statement that will return all columns from the products table, and join to the companies table so that you can return the company name.

products table schema
id
name
isbn
company_id
price
companies table schema
id
name
You should return all product fields as well as the company name as "company_name". */
SELECT products.*, companies.name AS company_name from products
JOIN companies ON products.company_id = companies.id;
/* Using our monsters table with the following schema:
monsters table schema
id
name
legs
arms
characteristics
return the following table:
** output schema**
name
characteristics
Where the name is the original string repeated three times (do not add any spaces), and the characteristics are the original strings in reverse (e.g. 'abc, def, ghi' becomes 'ihg ,fed ,cba').
*/
SELECT CONCAT(name, name, name) AS name,  REVERSE(characteristics) AS characteristics FROM monsters
/*
Given a demographics table in the following format:

** demographics table schema **

id
name
birthday
race
you need to return the same table where all text fields (name & race) are changed to the bit length of the string.
*/
SELECT
  id,
  BIT_LENGTH(name) AS name,
  BIT_LENGTH(race) AS race,
  birthday
FROM
  demographics;
/*
Here's an example of what the data table might look like:

customer_id |    date    | product
------------+------------+----------
      1     | 31-08-2023 | Orange
      1     | 31-08-2023 | Orange
      3     | 31-08-2023 | Apple
      1     | 24-09-2023 | Apple
      4     | 25-09-2023 | Orange
The result should be:

    date     | num_new_customers |
-------------+--------------------
 31-08-2023  | 2                 |
 25-09-2023  | 1                 |
Resultant query should be ordered by date in ascending order

GLHF!
*/
SELECT
  date,
  COUNT(DISTINCT customer_id) AS num_new_customers
FROM (
  SELECT
    customer_id,
    MIN(date) AS date
  FROM
    customer_purchases
  GROUP BY
    customer_id
) AS first_purchase
GROUP BY
  date
ORDER BY
  date;
/*
For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

people table schema
id
name
age
select table schema
age [group by]
people_count (people count)
NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.
*/
SELECT COUNT(id) as people_count, age FROM people GROUP BY age;
/*
Given a table of random numbers as follows:

numbers table schema
id
number1
number2
Your job is to return table with similar structure and headings, where if the sum of a column is odd, the column shows the minimum value for that column, and when the sum is even, it shows the max value. You must use a case statement.

output table schema
number1
number2
*/
SELECT
  CASE WHEN SUM(number1) % 2 = 1 THEN MIN(number1) ELSE MAX(number1) END AS number1,
  CASE WHEN SUM(number2) % 2 = 1 THEN MIN(number2) ELSE MAX(number2) END AS number2
FROM
  numbers;
/* For this challenge you need to create a simple DISTINCT statement, you want to find all the unique ages. */
SELECT DISTINCT age FROM people;
/* Given the following table 'decimals':

decimals table schema
id
number1
number2
Return a table with a single column result which is the output of number1 raised to the power of number2.
*/
SELECT POWER(number1 , number2) AS result FROM decimals;
/*
Using only SQL, write a query that returns all rows in the custid, custname, and custstate columns from the customers table.

Table Description for customers:
Column	Data Type	Size	Sample
custid	integer	8	4
custname	string	50	Anakin Skywalker
custstate	string	50	Tatooine
custard	string	50	R2-D2
*/
SELECT custid,custname,custstate FROM customers;

/*
We have two tables: customers and loans.

customers table:

id (integer): The primary key for the table.
age (integer): The age of the customer.
loans table:

id (integer): The primary key for the table.
customer_id (integer): A foreign key referencing id in the customers table.
loan_status (string): The status of the loan, either 'paid' or 'unpaid'.
loan_amount (float): The amount of the loan.
Write a SQL query that returns a list of all customers who have IDs between 1 and 10. For each customer, the query should return their ID (as customer_id) and their loan eligibility based on the following criteria:

If the customer is 18 to 65 years old (inclusive) and all their loans are paid or they don't have any loans, they should be considered eligible for a loan, and the query should return 'loan can be given'.
Otherwise, the query should return 'loan cannot be given'.
The results should be sorted by customer_id in descending order.

GLHF!
*/

SELECT
    c.id AS customer_id,
    CASE
        WHEN c.age BETWEEN 18 AND 65
            AND NOT EXISTS (SELECT 1 FROM loans WHERE customer_id = c.id AND loan_status = 'unpaid')
        THEN 'loan can be given'
        ELSE 'loan cannot be given'
    END AS loan_eligibility
FROM
    customers c
WHERE
    c.id BETWEEN 1 AND 10
ORDER BY
    customer_id DESC;
/* Given a demographics table in the following format:

** demographics table schema **

id
name
birthday
race
you need to return a table that shows a count of each race represented, ordered by the count in descending order as:

** output table schema **

race
count
*/
SELECT race, COUNT(*) AS count
FROM demographics
GROUP BY race
ORDER BY count DESC;
/*
You have reached a conclusion that you waste to much time because you have to many different warehouse to visit each week.

You have to find out how many different type of products you buy from each producer. If you take only few items from some of them you will stop going there to save the gasoline:)

In the results show producer and count_products_types which you buy from him.

Order the result by count_products_types (DESC) then by producer (ASC) in case there are duplicate amounts,
*/
products table schema
id
name
price
stock
producer
results table schema
count_products_types
producer
/*
Given a table of random numbers as follows:

** numbers table schema **

id
number1
number2
number3
number4
number5
Your job is to return a table in the following format, where each value is the number of bytes in the string representation of the number.

** output table schema **

octnum1
octnum2
octnum3
octnum4
octnum5
See expected results for more clarity if required.

*/
 SELECT
  OCTET_LENGTH(CAST(number1 AS CHAR)) AS octnum1,
  OCTET_LENGTH(CAST(number2 AS CHAR)) AS octnum2,
  OCTET_LENGTH(CAST(number3 AS CHAR)) AS octnum3,
  OCTET_LENGTH(CAST(number4 AS CHAR)) AS octnum4,
  OCTET_LENGTH(CAST(number5 AS CHAR)) AS octnum5
FROM numbers;
/*
Given the following table 'decimals':

decimals table schema
id
number1
number2
Return a table with two columns (abs, log) where the values in abs are the absolute values of number1 and the values in log are values from number2 in logarithm to base 64.
*/
SELECT
  ABS(number1) AS abs,
  LOG(64,number2) AS log
FROM decimals;
/*  Write function RemoveExclamationMarks which removes all exclamation marks from a given string. */
SELECT 
    s,
    REPLACE(s, '!', '') AS res
FROM 
    removeexclamationmarks;
