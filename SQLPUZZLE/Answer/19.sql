SELECT district_nbr,sales_person,sum(sales_amt)
FROM salesdata
GROUP BY district_nbr,sales_person
order by district_nbr asc, sum(sales_amt) desc;

/*
1	"ラリー       "	150.00
1	"モー        "	5.00
1	"ハーポ       "	4.00
1	"カーリー      "	3.00
2	"ハリー       "	5.00
2	"トム        "	5.00
2	"フレッド      "	5.00
2	"ディック      "	5.00
3	"メルヴィン     "	7.00
3	"アーヴィン     "	5.00
4	"メアリー      "	50.00
4	"サリー       "	40.00
4	"オプラ       "	30.00
4	"ジェニー      "	20.00
4	"ジェシー      "	10.00
*/

SELECT S0.district_nbr, S0.sales_person,
       S0.sales_id, S0.sales_amt
  FROM SalesData AS S1, SalesData AS S0
 WHERE S0.district_nbr = S1.district_nbr
   AND S0.sales_amt <= S1.sales_amt
 GROUP BY S0.district_nbr, S0.sales_person, S0.sales_id,
          S0.sales_amt
HAVING COUNT(*) <= 3;

/*
3	"メルヴィン     "	9	7.00
3	"アーヴィン     "	10	5.00
4	"オプラ       "	14	30.00
1	"ラリー       "	3	50.00
1	"ラリー       "	2	50.00
4	"サリー       "	13	40.00
1	"ラリー       "	1	50.00
4	"メアリー      "	12	50.00
*/

SELECT DISTINCT S1.district_nbr, S1.sales_person
  FROM (SELECT district_nbr, sales_person,
               DENSE_RANK() OVER (PARTITION BY district_nbr
                                  ORDER BY sales_amt DESC)
          FROM SalesData) AS S1 (district_nbr, sales_person,
                                 rank_nbr)
 WHERE S1.rank_nbr <= 3
 ORDER BY district_nbr;
/*
1	"モー        "
1	"ハーポ       "
1	"ラリー       "
2	"ハリー       "
2	"トム        "
2	"ディック      "
2	"フレッド      "
3	"アーヴィン     "
3	"メルヴィン     "
4	"サリー       "
4	"メアリー      "
4	"オプラ       "
*/