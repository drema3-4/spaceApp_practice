--------------------
-- task71
--------------------
-- Задание: 71 (Serge I: 2008-02-23)
-- Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
--------------------
SELECT DISTINCT maker
FROM Product
WHERE type = 'PC' AND maker NOT IN (
    SELECT DISTINCT maker
    FROM Product
    WHERE type = 'PC' AND model NOT IN (
        SELECT model
        FROM PC
    )
)
--------------------
-- task72
--------------------
-- Задание: 72 (Serge I: 2003-04-29)
-- Среди тех, кто пользуется услугами только какой-нибудь одной компании, определить имена разных пассажиров, летавших чаще
-- других.
-- Вывести: имя пассажира и число полетов.
--------------------
SELECT TOP 1 WITH TIES name, cnt
FROM Passenger
INNER JOIN
(
    SELECT ID_psg, MAX(cnt) AS cnt
    FROM (
        SELECT Pass_in_trip.ID_psg, Trip.ID_comp, COUNT(*) AS cnt
        FROM Pass_in_trip
        INNER JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
        GROUP BY Pass_in_trip.ID_psg, Trip.ID_comp
    ) AS t1
    GROUP BY ID_psg
    HAVING COUNT(*) = 1
) AS t2 ON t2.ID_psg = Passenger.ID_psg
ORDER BY cnt DESC
--------------------
-- task73
--------------------
-- Задание: 73 (Serge I: 2009-04-17)
-- Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
-- Вывод: страна, сражение
--------------------
SELECT DISTINCT country, name
FROM Battles, Classes
EXCEPT
SELECT country, battle
FROM Outcomes
LEFT JOIN Ships ON Ships.name = Outcomes.ship
LEFT JOIN Classes ON Outcomes.ship = Classes.class OR Ships.class = Classes.class
WHERE country IS NOT NULL
GROUP BY country, battle
--------------------
-- task74
--------------------
-- Задание: 74 (dorin_larsen: 2007-03-23)
-- Вывести все классы кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех
-- имеющихся в БД стран.
-- Вывод: страна, класс
--------------------
SELECT country, class
FROM Classes
WHERE UPPER(country) = 'RUSSIA' AND EXISTS (
    SELECT country, class
    FROM Classes
    WHERE UPPER(country) = 'RUSSIA'
)
UNION ALL
SELECT country, class
FROM Classes
WHERE NOT EXISTS (
    SELECT country, class
    FROM Classes
    WHERE UPPER(country) = 'RUSSIA'
)
--------------------
-- task75
--------------------
-- Задание: 75 (Serge I: 2020-01-31)
-- Для тех производителей, у которых есть продукты с известной ценой хотя бы в одной из таблиц Laptop, PC, Printer найти
-- максимальные цены на каждый из типов продукции.
-- Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, максимальная цена на принтеры.
-- Для отсутствующих продуктов/цен использовать NULL.
--------------------
SELECT maker, MAX(Laptop.price) AS laptop, MAX(PC.price) AS pc, MAX(Printer.price) AS printer
FROM Product
LEFT JOIN Laptop ON Laptop.model = Product.model
LEFT JOIN PC ON PC.model = Product.model
LEFT JOIN Printer ON Printer.model = Product.model
WHERE maker IN (
        SELECT maker
        FROM Product
        WHERE model IN (
        SELECT model
        FROM Laptop
        WHERE price IS NOT NULL
        UNION ALL
        SELECT model
        FROM PC
        WHERE price IS NOT NULL
        UNION ALL
        SELECT model
        FROM Printer
        WHERE price IS NOT NULL
    )
)
GROUP BY maker