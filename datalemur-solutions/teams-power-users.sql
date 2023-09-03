/*
Company Asked - Microsoft
Difficulty - Easy

Write a query to identify the top 2 Power Users who sent the highest number of
messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along
with the total number of messages they sent. Output the results in descending order
based on the count of the messages.

Assumption: No two users have sent the same number of messages in August 2022.
*/

-- Approach 1: Using PostgreSQL

SELECT sender_id, COUNT(message_id) as message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY message_count DESC
FETCH FIRST 2 ROWS ONLY

-- Approach 2: Using SQL

SELECT sender_id, COUNT(message_id) as message_count
FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2

