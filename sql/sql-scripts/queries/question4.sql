-- What is the total number of orders placed each month in the latest year ?
USE AdventureWorks2022
GO;
-- SELECT DISTINCT MONTH(OrderDate)
-- FROM Sales.SalesOrderHeader
-- WHERE YEAR(OrderDate) = 2014
-- ORDER BY 1;
SELECT YEAR (soh.OrderDate) AS OrderYear,
	DATENAME (MONTH, soh.OrderDate) AS OrderMonth,
	COUNT (*) AS TotalOrders
FROM Sales.SalesOrderHeader AS soh
WHERE YEAR (OrderDate) = (
		SELECT MAX (YEAR (OrderDate))
		FROM Sales.SalesOrderHeader
	)
GROUP BY YEAR (soh.OrderDate),
	-- MONTH (soh.OrderDate),
	DATENAME (MONTH, soh.OrderDate)
ORDER BY YEAR (soh.OrderDate) DESC
	-- MONTH (soh.OrderDate)
	;
