--------------------
-- task66
--------------------
SELECT date, MAX(c)
FROM (
    SELECT date, COUNT(DISTINCT Trip.trip_no)
    FROM Trip
    INNER JOIN Pass_in_trip ON Trip.trip_no = Pass_in_trip.trip_no
    WHERE town_from = 'Rostov' AND date >= '2003-04-01' AND date <= '2003-04-07'
    GROUP BY date
    UNION ALL
    SELECT '2003-04-01', 0
    UNION ALL
    SELECT '2003-04-02', 0
    UNION ALL
    SELECT '2003-04-03', 0
    UNION ALL
    SELECT '2003-04-04', 0
    UNION ALL
    SELECT '2003-04-05', 0
    UNION ALL
    SELECT '2003-04-06', 0
    UNION ALL
    SELECT '2003-04-07', 0
) AS temp
GROUP BY date
--------------------
-- task67
--------------------
SELECT COUNT(*)
FROM (
    SELECT TOP(1) WITH TIES COUNT(*) AS c, town_from, town_to
    FROM Trip
    GROUP BY town_from, town_to
    ORDER BY c DESC
) AS temp
--------------------
-- task68
--------------------
SELECT COUNT(*)
FROM (
SELECT TOP(1) WITH TIES SUM(cnt) AS cnt, town_from, town_to
FROM (
SELECT COUNT(trip_no) AS cnt, town_from, town_to
FROM Trip
WHERE town_from >= town_to
GROUP BY town_from, town_to
UNION ALL
SELECT COUNT(trip_no) AS cnt, town_to, town_from
FROM Trip
WHERE town_from < town_to
GROUP BY town_from, town_to
) AS temp1
GROUP BY town_from, town_to
ORDER BY cnt DESC
) AS temp2
--------------------
-- task69
--------------------

--------------------
-- task70
--------------------
SELECT DISTINCT battle
FROM Outcomes
LEFT JOIN Ships ON Ships.name = Outcomes.ship
LEFT JOIN Classes ON Classes.class = Outcomes.ship OR Classes.class = Ships.class
WHERE Classes.country IS NOT NULL
GROUP BY Classes.country, Outcomes.battle
HAVING COUNT(Outcomes.ship) >= 3