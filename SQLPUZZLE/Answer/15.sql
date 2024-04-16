SELECT emp_name,MAX(sal_date) 昇給日,MAX(sal_amt) 現在, '昇給前' 昇給前
FROM Salaries
GROUP BY emp_name;
/*
"ハリー       "	"1996-09-20"	700.00	"昇給前"
"トム        "	"1996-12-20"	900.00	"昇給前"
"ディック      "	"1996-06-20"	500.00	"昇給前"
*/
SELECT  emp_name,
        CASE 
            WHEN COUNT(sal_date)>1 THEN
                MAX(sal_date)
            ELSE NULL    
        END 昇給日,
        MAX(sal_amt) 現在, 
        (SELECT MAX(S2.sal_amt) 
        FROM Salaries S2
        WHERE S2.sal_amt<MAX(S1.sal_amt)) 昇給前
FROM Salaries S1
GROUP BY emp_name;

/*
"ディック      "		500.00	
"トム        "	"1996-12-20"	900.00	800.00
"ハリー       "	"1996-09-20"	700.00	500.00
*/

-- ウィンドウ関数
SELECT emp_name, curr_date, curr_amt, prev_date, prev_amt
  FROM (SELECT emp_name, sal_date AS curr_date,
               sal_amt AS curr_amt,
               MIN(sal_date) OVER (PARTITION BY emp_name
                                   ORDER BY sal_date DESC
                                   ROWS BETWEEN 1 FOLLOWING
                                   AND 1 FOLLOWING) AS prev_date,
               MIN(sal_amt)  OVER (PARTITION BY emp_name
                                   ORDER BY sal_date DESC
                                   ROWS BETWEEN 1 FOLLOWING
                                   AND 1 FOLLOWING) AS prev_amt,
               ROW_NUMBER() OVER (PARTITION BY emp_name
                                  ORDER BY sal_date DESC) AS rn
          FROM Salaries) AS DT
  WHERE rn = 1;

  /*
    "ディック      "	"1996-06-20"	500.00		
    "トム        "	"1996-12-20"	900.00	"1996-10-20"	800.00
    "ハリー       "	"1996-09-20"	700.00	"1996-07-20"	500.00  
  */