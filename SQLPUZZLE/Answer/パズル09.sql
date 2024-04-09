CREATE VIEW Firstseat (seat)
AS SELECT (seat + 1)
     FROM Restaurant
    WHERE (seat + 1) NOT IN (SELECT seat FROM Restaurant)
      AND (seat + 1) < 1001;

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

CREATE VIEW Lastseat (seat)
AS SELECT (seat - 1)
     FROM Restaurant
    WHERE (seat - 1) NOT IN (SELECT seat FROM Restaurant)
      AND (seat - 1) > 0;

SELECT F1.seat AS start, L1.seat AS finish,
       ((L1.seat - F1.seat) + 1) AS available
  FROM Firstseat AS F1, Lastseat AS L1
 WHERE L1.seat = (SELECT MIN(L2.seat)
                    FROM Lastseat AS L2
                   WHERE F1.seat <= L2.seat);

-- 結合版
SELECT (R1.seat + 1) AS start,
       (MIN(R2.seat) - 1) AS finish
  FROM Restaurant AS R1
       INNER JOIN
       Restaurant AS R2
    ON R2.seat > R1.seat
 GROUP BY R1.seat
HAVING (R1.seat + 1) < MIN(R2.seat);