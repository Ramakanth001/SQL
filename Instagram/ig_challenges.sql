-- 1. Finding 5 oldest users in our application
select *
from users
ORDER BY created_at
limit 5;

-- Find the day of the week on which maximum registrations happened
-- Method:1 Here we are limiting with 2 so that if there is more than one day which has equak max registrations, we will know
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- or
SELECT dayname(u.created_at) AS day, COUNT(*) AS user_count
FROM users u
GROUP BY dayname(u.created_at)
HAVING COUNT(*) = (
    SELECT MAX(user_count)
    FROM (
        SELECT COUNT(*) AS user_count
        FROM users
        GROUP BY dayname(created_at)
    ) AS subquery
)
ORDER BY user_count DESC;

-- Make a list of inactive users who didn't post a single photo
select users.id as user_id, username as inactive_user
from users
LEFT join photos
	ON users.id = photos.user_id
WHERE photos.user_id is NULL;

-- Who got most likes on a single photo
SELECT *
from photos
JOIN (
	select photo_id, count(*) as likes_count
	from likes
	GROUP BY photo_id
	ORDER BY likes_count desc
    LIMIT 1
    ) as sub_query;

-- User who got Max likes for a given photo
select  
	users.id, 
    users.username, 
    photo_id, 
    count(*) AS max_likes
from photos
JOIN likes
	on photos.id = likes.photo_id
JOIN users
	on users.id = photos.user_id
GROUP BY photo_id
ORDER BY count(*) desc
LIMIT 1;

select user_id, count(*) as number_of_posts
from photos
group by user_id
ORDER BY number_of_posts desc;

-- Avergage post per user
select 
	(select count(*) from photos) / (select count(*) from users)
    AS average;

-- Top 5 hashtags
select tags.tag_name, tag_id, count(*) as count
from photo_tags
join tags
on tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY count desc
LIMIT 5;

-- Identify bots --> users who liked every single photo on the site
select user_id, users.username, count(*) as total_likes
from likes
join users
ON likes.user_id = users.id
GROUP BY user_id
HAVING total_likes = (select count(*) from photos)
;



