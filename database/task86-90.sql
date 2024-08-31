--------------------
-- task86
--------------------
-- Задание: 86 (Serge I: 2012-04-20)
-- Для каждого производителя перечислить в алфавитном порядке с разделителем "/" все типы выпускаемой им продукции.
-- Вывод: maker, список типов продукции
--------------------
SELECT maker, STRING_AGG(type, '/')
FROM (
    SELECT DISTINCT maker, type
    FROM Product
) AS t1
GROUP BY maker
--------------------
-- task87
--------------------
-- 
--------------------

--------------------
-- task88
--------------------
-- пока что не правильно, что-то не то
--------------------
SELECT DISTINCT TOP 1 WITH TIES Passenger.name, qnty, Company.name
FROM Passenger
INNER JOIN (
    SELECT ID_psg, COUNT(Pass_in_trip.trip_no) AS qnty
    FROM Pass_in_trip
    INNER JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
    GROUP BY ID_psg
    HAVING COUNT(DISTINCT ID_comp) = 1
) AS t1 ON t1.ID_psg = Passenger.ID_psg
INNER JOIN Pass_in_trip ON Pass_in_trip.ID_psg = Passenger.ID_psg
INNER JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
INNER JOIN Company ON Company.ID_comp = Trip.ID_comp
ORDER BY qnty DESC
--------------------
-- task89
--------------------
-- 
--------------------

--------------------
-- task90
--------------------
-- 
--------------------
