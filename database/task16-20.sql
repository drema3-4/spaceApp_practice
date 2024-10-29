--------------------
-- task16
--------------------
-- Задание: 16 (Serge I: 2003-02-03)
-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая
-- пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода:
-- модель с большим номером, модель с меньшим номером, скорость и RAM.
--------------------
SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM PC p1, PC p2
WHERE p1.model > p2.model AND p1.speed = p2.speed AND p1.ram = p2.ram
--------------------
-- task17
--------------------
-- Задание: 17 (Serge I: 2003-02-03)
-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
-- Вывести: type, model, speed
--------------------
SELECT DISTINCT 'Laptop' type, model, speed
FROM Laptop
WHERE speed < (
    SELECT MIN(speed)
    FROM PC
)
--------------------
-- task18
--------------------
-- Задание: 18 (Serge I: 2003-02-03)
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
--------------------
SELECT DISTINCT maker, price
FROM Product p
INNER JOIN Printer pr ON pr.model = p.model
WHERE color = 'y' AND price = (
    SELECT MIN(price)
    FROM Printer
    WHERE color = 'y'
)
--------------------
-- task19
--------------------
-- Задание: 19 (Serge I: 2003-02-13)
-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний
-- размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.
--------------------
SELECT maker, AVG(screen) AS avg_screen
FROM Laptop l
INNER JOIN Product p ON p.model = l.model
GROUP BY maker
--------------------
-- task20
--------------------
-- Задание: 20 (Serge I: 2003-02-13)
-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК.
-- Вывести: Maker, число моделей ПК.
--------------------
SELECT maker, COUNT(model) AS qnty_models
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(DISTINCT model) >= 3