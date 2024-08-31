--------------------
-- task41
--------------------
SELECT maker, CASE WHEN MAX(CASE WHEN price IS NULL THEN 1 ELSE 0 END) = 0 THEN MAX(price) END price
FROM (
    SELECT maker, price
    From Product
    INNER JOIN PC ON Product.model = PC.model
    UNION
    SELECT maker, price
    FROM Product
    INNER JOIN Laptop ON Product.model = Laptop.model
    UNION
    SELECT maker, price
    FROM Product
    INNER JOIN Printer ON Product.model = Printer.model
) AS un
GROUP BY maker
--------------------
-- task42
--------------------
SELECT DISTINCT ship, battle
FROM Outcomes
WHERE result = 'sunk'
--------------------
-- task43
--------------------
SELECT name
FROM Battles
WHERE year(date) NOT IN (
    SELECT launched AS date
    FROM Ships
    WHERE launched IS NOT NULL
)
--------------------
-- task44
--------------------
SELECT name
FROM Ships
WHERE name LIKE('R%')
UNION
SELECT ship as name
FROM Outcomes
WHERE ship LIKE('R%')
--------------------
-- task45
--------------------
SELECT name
FROM Ships
WHERE name LIKE('% % %')
UNION
SELECT ship AS name
FROM Outcomes
WHERE ship LIKE('% % %')