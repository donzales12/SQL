
CREATE TABLE Badges
(badge_nbr INTEGER NOT NULL PRIMARY KEY,
 emp_id INTEGER NOT NULL,
 issued_date DATE NOT NULL,
 badge_status CHAR(1) NOT NULL
    CHECK (badge_status IN ('A', 'I')));

Update badges bp
set badge_status = 'A'
WHERE issued_date = (SELECT max(issued_date)
                       FROM   badges bc
                       WHERE bc.emp_id = bp.emp_id);

SELECT *
from Badges
where badge_status = 'A';