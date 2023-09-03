/*
Company Asked - Facebook
Difficulty - Easy

Assume you have an events table on Facebook app analytics. Write a query to calculate the
click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:
- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
- To avoid integer division, multiply the CTR by 100.0, not 100.
*/

-- Approach 1:

SELECT app_id,
ROUND(100.0 *
    sum(case WHEN event_type = 'click' then 1 ELSE 0 END) / 
    sum(case WHEN event_type = 'impression' then 1 ELSE 0 END),2) as ctr
FROM events
WHERE timestamp BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY app_id;

-- Approach 2: Using CTE

WITH CTE AS
(SELECT app_id,
    SUM(CASE WHEN event_type='impression' THEN 1 ELSE 0 END) AS impression,
    SUM(CASE WHEN event_type='click' THEN 1 ELSE 0 END) AS click
FROM events
WHERE EXTRACT(Year FROM timestamp)=2022
GROUP BY app_id
)
SELECT app_id, ROUND(100.0 * click/impression, 2) AS ctr
FROM CTE