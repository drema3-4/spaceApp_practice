--------------------
-- task16
--------------------
SELECT DISTINCT a.model, b.model, a.speed, a.ram
FROM PC as a, PC as b
WHERE a.speed = b.speed AND a.ram = b.ram AND a.model > b.model
ORDER BY a.model DESC
--------------------
-- task17
--------------------
SELECT DISTINCT 'Laptop', model, speed
FROM Laptop
WHERE speed < (
    SELECT MIN(speed)
    FROM PC
)
--------------------
-- task18
--------------------
SELECT DISTINCT maker, price
FROM Product
INNER JOIN Printer ON Product.model = Printer.model
WHERE color = 'y' AND price = (
    SELECT MIN(price)
    FROM Printer
    WHERE color = 'y'
)
--------------------
-- task19
--------------------
SELECT maker, AVG(screen)
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
GROUP BY maker
--------------------
-- task20
--------------------
SELECT DISTINCT maker, COUNT(model)
FROM Product
WHERE type = 'PC'
GROUP BY maker
WHERE COUNT(model) >= 3