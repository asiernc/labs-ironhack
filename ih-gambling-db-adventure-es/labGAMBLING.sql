USE lab2;
-- Pregunta 01:
SELECT Title, FirstName, LastName, DateOfBirth FROM Customer;

-- Pregunta 02:
SELECT COUNT(*) AS 'count', CustomerGroup FROM Customer GROUP BY CustomerGroup;

-- Pregunta 03: 

SELECT
	c.*,
    a.CurrencyCode
FROM Customer c
JOIN Account a ON TRIM(c.AccountLocation) = TRIM(a.AccountLocation) and c.CustId = a.CustId;

-- Pregunta 04:

DESCRIBE Betting;

SELECT
	b.BetDate as Día,
    p.product as Producto,
    SUM(b.Bet_amt) as Total_Apostado
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID and p.CATEGORYID = b.categoryId
GROUP BY b.BetDate, p.Product;

-- Pregunta 05: 
SELECT
	b.BetDate as Día,
    p.product as Producto,
    SUM(b.Bet_amt) as Total_Apostado
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID and p.CATEGORYID = b.categoryId
WHERE b.BetDate >= '1/11/2012' and p.product = 'SportsBook'
GROUP BY b.BetDate, p.Product;

-- Pregunta 06: Como suele suceder, el gerente de producto ha mostrado su nuevo informe a su director y ahora él también quiere una versión
-- diferente de este informe. Esta vez, quiere todos los productos pero divididos por el código de moneda y el grupo de clientes del
-- cliente, en lugar de por día y producto. También le gustaría solo transacciones que ocurrieron después del 1 de diciembre. Por favor,
-- escribe el código SQL que hará esto.

SELECT
    a.CurrencyCode,
    c.CustomerGroup,
    p.Product,
    SUM(b.Bet_amt) AS Total_Apostado
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
JOIN Customer c ON b.CustId = c.CustId
JOIN Account a ON c.CustId = a.CustId AND TRIM(c.AccountLocation) = TRIM(a.AccountLocation)
WHERE b.BetDate > '2012-12-01'
GROUP BY a.CurrencyCode, c.CustomerGroup, p.Product;


-- Pregunta 07: Nuestro equipo VIP ha pedido ver un informe de todos los jugadores independientemente de si han hecho algo en el marco
-- de tiempo completo o no. En nuestro ejemplo, es posible que no todos los jugadores hayan estado activos. Por favor, escribe
-- una consulta SQL que muestre a todos los jugadores Título, Nombre y Apellido y un resumen de su cantidad de apuesta para el
-- período completo de noviembre.

SELECT
    c.Title,
    c.FirstName,
    c.LastName,
    IFNULL(SUM(b.Bet_amt), 0) AS Total_Apostado
FROM Customer c
LEFT JOIN Betting b ON c.CustId = b.CustId AND b.BetDate BETWEEN '2012-11-01' AND '2012-11-30'
GROUP BY c.CustId, c.Title, c.FirstName, c.LastName;


-- Pregunta 08: Nuestros equipos de marketing y CRM quieren medir el número de jugadores que juegan más de un producto. ¿Puedes por favor
-- escribir 2 consultas, una que muestre el número de productos por jugador y otra que muestre jugadores que juegan tanto en Sportsbook
-- como en Vegas?

-- a)
SELECT
    b.CustId,
    COUNT(DISTINCT p.Product) AS Cantidad_Productos
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
GROUP BY b.CustId;

-- b)


-- Pregunta 11: Escribe una consulta que devuelva a los 5 mejores estudiantes basándose en el GPA

SELECT * FROM student ORDER BY GPA LIMIT 5;

-- Escribe una consulta que devuelva el número de estudiantes en cada escuela. (¡una escuela debería estar en la salida incluso si no tiene estudiantes!)

SELECT
    sc.school_name as school_name
    COUNT(s.student_id) as count
FROM school sc
JOIN student s ON s.school_id = sc.school_id
GROUP BY s.school_name;

SELECT student_name, GPA FROM student WHERE school_id=1 ORDER BY GPA DESC LIMIT 3;