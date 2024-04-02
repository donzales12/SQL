CREATE TABLE FiscalYearTable1
(fiscal_year INTEGER Primary key,
 start_date  DATE NOT NULL UNIQUE,
 end_date    DATE NOT NULL UNIQUE,
 constraint valid_date
     CHECK(start_date<=end_date));

/*
SELECT f1.fiscal_year
   FROM FiscalYearTable1 AS F1
  WHERE <任意の日付データ> BETWEEN F1.start_date AND F1.end_date;

ALTER TABLE テーブル名 ALTER COLUMN カラム名 TYPE データ型
(例) ALTER TABLE t_user ALTER COLUMN user_type TYPE VARCHAR;

SELECT extract(year from request_time) from FiscalYearTable1;
*/