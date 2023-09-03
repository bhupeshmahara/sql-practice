/*
Company Asked - TikTok
Difficulty - Easy

Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text.
New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message
confirmation to activate their account.

Write a query to display the user IDs of those who did not confirm their sign-up on the first day,
but confirmed on the second day.

Definition: action_date refers to the date when users activated their accounts and confirmed their sign-up
through text messages.
*/

-- Approach 1: Using PostgreSQL

SELECT USER_ID FROM emails e
LEFT JOIN texts t ON e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed'
AND DATE(e.signup_date) + 1 = t.action_date

SELECT e.user_id
FROM emails AS e
RIGHT JOIN texts AS t
ON e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed'
AND EXTRACT(DAY FROM action_date) = EXTRACT(DAY FROM signup_date) + 1

-- Approach 2: Using SQL

SELECT e.user_id
FROM emails e
INNER JOIN texts t ON e.email_id = t.email_id
WHERE t.action_date = e.signup_date + INTERVAL '1 day'
AND t.signup_action = 'Confirmed'

SELECT e.user_id
FROM emails e
INNER JOIN texts t ON e.user_id = t.user_id
WHERE DATEDIFF(day, signup_date, action_date) = 1
AND t.signup_action = 'Confirmed'
