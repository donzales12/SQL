CREATE TABLE Foobar
(all_alpha VARCHAR(6) NOT NULL 
    CHECK (all_alpha SIMILAR TO '[a-zA-Z]+') );