-- CANNOT USE SUBQUERY IN CHECK CONSTRAINT
-- USE WITH CHECK OPTION to block unforgiven insert

CREATE TABLE Hotel
(room_nbr INTEGER NOT NULL,
 arrival_date DATE NOT NULL,
 departure_date DATE NOT NULL,
 guest_name CHAR(30) NOT NULL,
    PRIMARY KEY (room_nbr, arrival_date),
    CHECK (departure_date >= arrival_date),
    CHECK (NOT EXISTS
            (SELECT *
             FROM hotel as h1, hotel as h2
             WHERE h1.room_nbr=h2.room_nbr
             AND   h1.arrival_date between h2.arrival_date
                                   and h2.departure_date)));
                                   
 