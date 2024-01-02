
SELECT * FROM people WHERE age > 50 ORDER BY age DESC;
"In your application, there is a section for adults only. You need to get a list of names and ages of users from the users table, who are 18 years old or older."
SELECT * FROM users WHERE age >=18
"Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US."
SELECT * FROM travelers WHERE country NOT IN ('Canada', 'Mexico','USA');
"you need to return the same table where all letters are lowercase in the race column."
UPDATE demographics
SET race = LOWER(race);
SELECT *
FROM demographics;
"For this challenge you need to create a simple SUM statement that will sum all the ages."
SELECT SUM(age) AS age_sum FROM people;





