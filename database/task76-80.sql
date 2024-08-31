--------------------
-- task76
--------------------
-- Задание: 76 (Serge I: 2003-08-28)
-- Определить время, проведенное в полетах, для пассажиров, летавших всегда на разных местах. Вывод: имя пассажира, время в
-- минутах.
-- Что-то не так, нужно погуглить, хотя решение близко
--------------------
SELECT name, minutes
FROM Passenger
INNER JOIN
(
    SELECT ID_psg, ABS(SUM(DATEDIFF(mi, time_in, time_out))) AS minutes
    FROM Trip
    INNER JOIN Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no
    GROUP BY ID_psg
    HAVING ID_psg IN (
        SELECT ID_psg
        FROM Pass_in_trip
        GROUP BY ID_psg
        HAVING COUNT(DISTINCT place) = COUNT(place)
    )
) AS t2 ON t2.ID_psg = Passenger.ID_psg
--------------------
-- task77
--------------------
-- Задание: 77 (Serge I: 2003-04-09)
-- Определить дни, когда было выполнено максимальное число рейсов из
-- Ростова ('Rostov'). Вывод: число рейсов, дата.
--------------------
SELECT TOP 1 WITH TIES *
FROM (
    SELECT COUNT(DISTINCT Pass_in_trip.trip_no) AS count, date
    FROM Pass_in_trip
    JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no AND town_from = 'Rostov'
    GROUP BY Pass_in_trip.trip_no, date
) AS temp
ORDER BY 1 DESC
--------------------
-- task78
--------------------
-- Задание: 78 (Serge I: 2005-01-19)
-- Для каждого сражения определить первый и последний день
-- месяца,
-- в котором оно состоялось.
-- Вывод: сражение, первый день месяца, последний
-- день месяца.
--
-- Замечание: даты представить без времени в формате "yyyy-mm-dd".
--------------------
SELECT
    name,
    DATEFROMPARTS(DATEPART(yyyy, date), DATEPART(mm, date), 1) AS firstD,
    DATEADD(dd, -1, DATEFROMPARTS(DATEPART(yyyy, DATEADD(mm, 1, date)), DATEPART(mm, DATEADD(mm, 1, date)), 1)) AS lastD
FROM Battles
--------------------
-- task79
--------------------
-- Задание: 79 (Serge I: 2003-04-29)
-- Определить пассажиров, которые больше других времени провели в полетах.
-- Вывод: имя пассажира, общее время в минутах, проведенное в полетах
--------------------

--------------------
-- task80
--------------------
-- Задание: 80 (Baser: 2011-11-11)
-- Найти производителей любой компьютерной техники, у которых нет моделей ПК, не представленных в таблице PC.
--------------------
SELECT DISTINCT maker
FROM Product
EXCEPT
SELECT maker
FROM Product
    WHERE type = 'PC' AND model NOT IN (
    SELECT model
    FROM PC
)