-- RULE 1
DELETE FROM Absenteeism
WHERE severity_points >= 40;

-- RULE 2
UPDATE Absenteeism
SET    severity_points = severity_points + 1
WHERE emp_id = 1
    AND NOT (
        EXISTS (
            SELECT absent_date
            FROM Absenteeism
            WHERE emp_id = 1
            AND    absent_date = CURRENT_DATE-1
        ) AND EXISTS (
            SELECT absent_date
            FROM Absenteeism
            WHERE emp_id = 1
            AND    absent_date = CURRENT_DATE-2
        )
 ) ;