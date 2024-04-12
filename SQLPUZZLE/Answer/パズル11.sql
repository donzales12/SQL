SELECT workorder_id
FROM projects
GROUP BY workorder_id
HAVING SUM(CASE  
            WHEN step_nbr=0 and step_status='C' THEN 1
            WHEN step_nbr>0 and step_status='W' THEN 1
           END
        )=COUNT(workorder_id);