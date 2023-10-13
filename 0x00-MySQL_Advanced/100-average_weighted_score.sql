-- creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_weight DE-- Initialize variables to store the total score and total weight
    SET total_score = 0;
    SET total_weight = 0;

    -- Calculate the weighted average for the user
    INSERT INTO user_weighted_scores (user_id, average_weighted_score)
    SELECT
        user_id,
        SUM(score * weight) / SUM(weight)
    FROM
        scores
    WHERE
        user_id = user_id;

    -- Commit the transaction
    COMMIT;
END$$

DELIMITER ;

