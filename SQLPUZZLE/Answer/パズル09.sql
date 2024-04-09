SELECT (R1.seat + 1) AS start,
       (MIN(R2.seat) - 1) AS finish
  FROM Restaurant AS R1
       INNER JOIN
       Restaurant AS R2
    ON R2.seat > R1.seat
 GROUP BY R1.seat
HAVING (R1.seat + 1) < MIN(R2.seat);