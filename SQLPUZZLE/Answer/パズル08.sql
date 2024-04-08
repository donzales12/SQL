SELECT COALESCE(MIN(printer_name),
        SELECT MIN(printer_name)
        FROM PrinterControl AS P2
        WHERE user_id IS NULL))
FROM PrinterControl as P1
WHERE user_id = 'celko';