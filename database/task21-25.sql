--------------------
-- task21
--------------------
SELECT DISTINCT maker, MAX(price)
FROM Product
INNER JOIN PC ON Product.model = PC.model
GROUP BY maker
--------------------
-- task22
--------------------
SELECT speed, AVG(price)
FROM PC
WHERE speed > 600
GROUP BY speed
--------------------
-- task23
--------------------
SELECT maker
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE speed >= 750
INTERSECT
SELECT maker
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE speed >= 750
--------------------
-- task24
--------------------
WITH all_products AS (
    SELECT model, pricce
    FROM PC
    UNION
    SELECT model, price
    FROM Laptop
    UNION
    SELECT model, price
    FROM Printer
)
SELECT model
FROM all_products
WHERE price IN (
    SELECT MAX(price) 
    FROM all_products
)
--------------------
-- task25
--------------------
