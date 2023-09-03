/*
Company Asked - Facebook
Difficulty - Easy

Given a table of Facebook posts, for each user who posted at least twice in 2021,
write a query to find the number of days between each user’s first post of the year
and last post of the year in the year 2021. Output the user and number of the days
between each user's first and last post.
*/

SELECT user_id,
EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) AS difference
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) != 0
