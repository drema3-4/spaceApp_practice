--------------------
-- task6
--------------------
-- Задание: 6 (Serge I: 2002-10-28)
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких
-- ПК-блокнотов. Вывод: производитель, скорость.
--------------------
SELECT DISTINCT maker, speed
FROM Product
INNER JOIN Laptop ON Laptop.model = Product.model
WHERE hd >= 10
--------------------
-- task7
--------------------
-- Задание: 7 (Serge I: 2002-11-02)
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
--------------------
SELECT model, price
FROM PC
WHERE model IN (
    SELECT model
    FROM Product
    WHERE maker = 'B'
)
UNION
SELECT model, price
FROM Laptop
WHERE model IN (
    SELECT model
    FROM Product
    WHERE maker = 'B'
)
UNION
SELECT model, price
FROM Printer
WHERE model IN (
    SELECT model
    FROM Product
    WHERE maker = 'B'
)
--------------------
-- task8
--------------------
-- Задание: 8 (Serge I: 2003-02-03)
-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
--------------------
SELECT DISTINCT maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT DISTINCT maker
FROM Product
WHERE type = 'Laptop'
--------------------
-- task9
--------------------
-- Задание: 9 (Serge I: 2002-11-02)
-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
--------------------
SELECT DISTINCT maker
FROM Product
WHERE model IN (
    SELECT model
    FROM PC
    WHERE speed >= 450
)
--------------------
-- task10
--------------------
-- Задание: 10 (Serge I: 2002-09-23)
-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
--------------------
SELECT TOP 1 WITH TIES model, price
FROM Printer
ORDER BY price DESC