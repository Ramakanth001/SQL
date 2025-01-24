-- List the triggers
SHOW TRIGGERS;

-- Delete a trigger
DROP TRIGGER trigger_name;

-- Trigger to check that one peron can't follow themselves
DELIMITER $$
CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.followee_id
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$
DELIMITER ;

-- Tracking unfollowing meta data
DELIMITER $$
CREATE TRIGGER unfollow
     AFTER DELETE ON follows FOR EACH ROW
     BEGIN
         INSERT INTO unfollow(follower_id, followee_id)
         VALUES (OLD.follower_id, OLD.followee_id);
     END$$
DELIMITER ;
