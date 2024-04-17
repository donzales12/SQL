
CREATE TABLE Personnel
(emp_id INTEGER NOT NULL PRIMARY KEY,
 emp_name CHAR(20) NOT NULL,
 mech_type CHAR(10) NOT NULL
    CHECK (mech_type IN ('Primary', 'Assistant')),
    UNIQUE (emp_id, mech_type));