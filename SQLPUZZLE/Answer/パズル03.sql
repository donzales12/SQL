CREATE TABLE Procs(
 proc_id INTEGER,
 anest_name VARCHAR(64),
 start_time TIMESTAMP,
 end_time   TIMESTAMP );

INSERT INTO Procs VALUES( 10, 'Baker', '01-07-01 08:00', '01-07-01 11:00');
INSERT INTO Procs VALUES( 20, 'Baker', '01-07-01 09:00', '01-07-01 13:00');
INSERT INTO Procs VALUES( 30, 'Dow'  , '01-07-01 09:00', '01-07-01 15:30'); 
INSERT INTO Procs VALUES( 40, 'Dow'  , '01-07-01 08:00', '01-07-01 13:30'); 
INSERT INTO Procs VALUES( 50, 'Dow'  , '01-07-01 10:00', '01-07-01 11:30'); 
INSERT INTO Procs VALUES( 60, 'Dow'  , '01-07-01 12:30', '01-07-01 13:30'); 
INSERT INTO Procs VALUES( 70, 'Dow'  , '01-07-01 13:30', '01-07-01 14:30'); 
INSERT INTO Procs VALUES( 80, 'Dow'  , '01-07-01 18:00', '01-07-01 19:00');

select proc_id,(
    SELECT COUNT(*) 
    from Procs pc 
    WHERE (pc.start_time<pp.start_time AND pc.end_time>pp.start_time)
           OR (pc.end_time>pp.end_time AND pc.start_time<pp.end_time)
) as max_inst_count
from Procs pp