CREATE TABLE Portfolios
(file_id INTEGER NOT NULL PRIMARY KEY,
 stuff CHAR(15) NOT NULL);

CREATE TABLE Succession
(chain INTEGER NOT NULL,
 next INTEGER DEFAULT 0 NOT NULL CHECK (next >= 0),
 file_id INTEGER NOT NULL REFERENCES Portfolios(file_id),
 suc_date DATE NOT NULL,
 PRIMARY KEY(chain, next));