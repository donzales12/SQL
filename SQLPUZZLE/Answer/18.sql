DELETE FROM Consumers
 WHERE fam IS NULL      
   AND (SELECT COUNT(*)
          FROM Consumers AS C1
         WHERE C1.address = Consumers.address) > 1;
