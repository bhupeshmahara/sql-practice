/*
Company Asked - Facebook
Difficulty - Easy

Assume you're given two tables containing data about Facebook Pages and
their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes.
The output should be sorted in ascending order based on the page IDs.
*/

-- Approach 1:

SELECT page_id FROM pages
WHERE NOT EXISTS (
SELECT 1 FROM page_likes AS likes
WHERE likes.page_id = pages.page_id);

-- Approach 2:

SELECT page_id FROM pages
EXCEPT SELECT page_id FROM page_likes
ORDER BY page_id;
