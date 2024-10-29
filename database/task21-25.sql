--------------------
-- task21
--------------------
-- Задание: 21 (Serge I: 2003-02-13)
-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого
-- есть модели в таблице PC.
-- Вывести: maker, максимальная цена.
--------------------
SELECT maker, MAX(price)
FROM PC pc
INNER JOIN Product pr ON pr.model = pc.model
GROUP BY maker
--------------------
-- task22
--------------------
-- Задание: 22 (Serge I: 2003-02-13)
-- Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю
-- цену ПК с такой же скоростью. Вывести: speed, средняя цена.
--------------------
SELECT speed, AVG(price) avg_price
FROM PC
WHERE speed > 600
GROUP BY speed
--------------------
-- task23
--------------------
-- Задание: 23 (Serge I: 2003-02-14)
-- Найдите производителей, которые производили бы как ПК
-- со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
--------------------
SELECT DISTINCT maker
FROM PC pc
INNER JOIN Product pr ON pr.model = pc.model
WHERE pc.speed >= 750
INTERSECT
SELECT DISTINCT maker
FROM Laptop lp
INNER JOIN Product pr ON pr.model = lp.model
WHERE lp.speed >= 750
--------------------
-- task24
--------------------
-- Задание: 24 (Serge I: 2003-02-03)
-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей
-- имеющейся в базе данных продукции.
--------------------
WITH prices AS (
    SELECT model, price
    FROM PC
    UNION
    SELECT model, price
    FROM Laptop
    UNION
    SELECT model, price
    FROM Printer
)
SELECT model
FROM prices
WHERE price = (
    SELECT MAX(price)
    FROM prices
)
--------------------
-- task25
--------------------
-- Задание: 25 (Serge I: 2003-02-14)
-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом
-- RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем
-- RAM. Вывести: Maker
--------------------
SELECT DISTINCT maker
FROM Product
WHERE model IN (
SELECT TOP 1 WITH TIES model
FROM PC
WHERE ram = (
    SELECT MIN(ram)
    FROM PC
)
ORDER BY speed DESC
) AND maker IN (
    SELECT DISTINCT maker
    FROM Product
    WHERE type = 'Printer'
)