--------------------
-- task6
--------------------
-- Задание: 6 (Serge I: 2002-10-28)
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких
-- ПК-блокнотов. Вывод: производитель, скорость.
--------------------
SELECT maker, speed
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE hd >= 10
--------------------
-- task7
--------------------
-- Задание: 7 (Serge I: 2002-11-02)
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
--------------------
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE maker = 'B'
UNION
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE maker = 'B'
UNION
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN Printer ON Product.model = Printer.model
WHERE maker = 'B'
--------------------
-- task8
--------------------
-- Задание: 8 (Serge I: 2003-02-03)
-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
--------------------
SELECT DISTINCT maker
FROM Product
WHERE typr = 'PC'
EXCEPT
SELECT DISTINCT maker
FROM Product
WHERE typr = 'Laptop'
--------------------
-- task9
--------------------
-- Задание: 9 (Serge I: 2002-11-02)
-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
--------------------
SELECT DISTINCT maker
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE speed >= 450
--------------------
-- task10
--------------------
-- Задание: 10 (Serge I: 2002-09-23)
-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
--------------------
SELECT model, price
FROM Printer
WHERE price = (
    SELECT MAX(price)
    FROM Printer
)