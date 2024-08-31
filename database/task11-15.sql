--------------------
-- task11
--------------------
SELECT AVG(speed)
FROM PC
--------------------
-- task12
--------------------
SELECT AVG(speed)
FROM Laptop
WHERE price > 1000
--------------------
-- task13
--------------------
SELECT AVG(speed)
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE maker = 'A'
--------------------
-- task14
--------------------
SELECT Ships.class, name, country
FROM Classes
INNER JOIN Ships ON Classes.class = Ships.class
WHERE numGuns >= 10
--------------------
-- task15
--------------------
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(HD) >= 2