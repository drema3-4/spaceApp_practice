--------------------
-- task1
--------------------
-- Задание: 1 (Serge I: 2002-09-30)
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
--------------------
SELECT model, speed, hd
FROM PC
WHERE price < 500
--------------------
-- task2
--------------------
-- Задание: 2 (Serge I: 2002-09-21)
-- Найдите производителей принтеров. Вывести: maker
--------------------
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'
--------------------
-- task3
--------------------
-- Задание: 3 (Serge I: 2002-09-30)
-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
--------------------
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000
--------------------
-- task4
--------------------
-- Задание: 4 (Serge I: 2002-09-21)
-- Найдите все записи таблицы Printer для цветных принтеров.
--------------------
SELECT *
FROM Printer
WHERE color = 'y'
--------------------
-- task5
--------------------
-- Задание: 5 (Serge I: 2002-09-30)
-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
--------------------
SELECT model, speed, hd
FROM PC
WHERE price < 600 AND (cd = '12x' OR cd = '24x')