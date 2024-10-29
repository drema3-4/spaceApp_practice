--------------------
-- task26
--------------------
-- Задание: 26 (Serge I: 2003-02-14)
-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A
-- (латинская буква). Вывести: одна общая средняя цена.
--------------------
SELECT AVG(price) avg_price
FROM (
    SELECT pc.model, price
    FROM PC pc
    INNER JOIN Product pr ON pr.model = pc.model
    WHERE maker = 'A'
    UNION ALL
    SELECT lp.model, price
    FROM Laptop lp
    INNER JOIN Product pr ON pr.model = lp.model
    WHERE maker = 'A'
) temp
--------------------
-- task27
--------------------
-- Задание: 27 (Serge I: 2003-02-03)
-- Найдите средний размер диска ПК каждого из тех производителей, которые
-- выпускают и принтеры. Вывести: maker, средний размер HD.
--------------------
SELECT maker, AVG(hd) avg_hd
FROM PC pc
INNER JOIN Product pr ON pr.model = pc.model
WHERE maker IN (
    SELECT DISTINCT maker
    FROM Product
    WHERE type = 'Printer'
)
GROUP BY maker
--------------------
-- task28
--------------------
-- Задание: 28 (Serge I: 2012-05-04)
-- Используя таблицу Product, определить количество производителей, выпускающих
-- по одной модели.
--------------------
SELECT COUNT(*) qnty
FROM (
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(DISTINCT model) = 1
) temp
--------------------
-- task29
--------------------
-- Задание: 29 (Serge I: 2003-02-14)
-- В предположении, что приход и расход денег на каждом пункте приема
-- фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)],
-- написать запрос с выходными данными (пункт, дата, приход, расход).
-- Использовать таблицы Income_o и Outcome_o.
--------------------
SELECT point, date, SUM(inc) inc, SUM(out) out
FROM (
    SELECT i.point, i.date, i.inc, NULL out
    FROM Income_o i
    UNION ALL
    SELECT o.point, o.date, NULL inc, o.out
    FROM Outcome_o o
) temp
GROUP BY point, date
--------------------
-- task30
--------------------
-- Задание: 30 (Serge I: 2003-02-14)
-- В предположении, что приход и расход денег на каждом пункте приема
-- фиксируется произвольное число раз (первичным ключом в таблицах является
-- столбец code), требуется получить таблицу, в которой каждому пункту за каждую
-- дату выполнения операций будет соответствовать одна строка.
-- Вывод: point, date, суммарный расход пункта за день (out), суммарный приход
-- пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
--------------------
SELECT point, date, SUM(out) outcome, SUM(inc) income
FROM (
    SELECT point, date, NULL out, inc
    FROM Income
    UNION ALL
    SELECT point, date, out, NULL inc
    FROM Outcome
) temp
GROUP BY point, date