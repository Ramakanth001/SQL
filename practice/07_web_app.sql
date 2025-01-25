-- Find the earliets user
SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date 
FROM users;

-- Find the email of earliest user
select email
from users
order by created_at
LIMIT 1;
-- or
SELECT * 
FROM   users 
WHERE  created_at = (SELECT Min(created_at) 
                     FROM   users); 
                     
-- Month wise users
select monthname(created_at) as month, count(*) as count
from users
GROUP BY month;

-- Yahoo users
select 'yahoo' as provider, count(*) as total_users
from users
where email like '%yahoo%';

-- Different types of mails
select
	CASE
		WHEN email like '%gmail%' THEN 'gmail'
        WHEN email like '%yahoo%' THEN 'yahoo'
        WHEN email like '%hotmail%' THEN 'hotmail'
        ELSE 'others'
	END AS provider,
    COUNT(*) AS mail_count
FROM users
GROUP BY provider
order by mail_count desc;

