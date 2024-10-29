--------------------
-- task11
--------------------
-- Задание: 11 (Serge I: 2002-11-02)
-- Найдите среднюю скорость ПК.
--------------------
SELECT AVG(speed) AS avg_price
FROM PC
--------------------
-- task12
--------------------
-- Задание: 12 (Serge I: 2002-11-02)
-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
--------------------
SELECT AVG(speed) AS avg_price
FROM Laptop
WHERE price > 1000
--------------------
-- task13
--------------------
-- Задание: 13 (Serge I: 2002-11-02)
-- Найдите среднюю скорость ПК, выпущенных производителем A.
--------------------
SELECT AVG(speed) AS avg_speed
FROM PC
WHERE model IN (
    SELECT DISTINCT model
    FROM Product
    WHERE maker = 'A'
)
--------------------
-- task14
--------------------
-- Задание: 14 (Serge I: 2002-11-05)
-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
--------------------
SELECT s.class, s.name, c.country
FROM Ships s
INNER JOIN Classes c ON c.class = s.class
WHERE numGuns >= 10
--------------------
-- task15
--------------------
-- Задание: 15 (Serge I: 2003-02-03)
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
--------------------
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(model) >= 2
