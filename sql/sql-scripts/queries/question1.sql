-- Which sales representative has generated the most revenue in the latest year ?
USE AdventureWorks2022;
GO;
-- List tables
-- SELECT TABLE_SCHEMA,
-- 	TABLE_NAME
-- FROM INFORMATION_SCHEMA.TABLES
-- ORDER BY TABLE_SCHEMA;
-- See columns
-- SELECT COLUMN_NAME,
-- 	DATA_TYPE
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_SCHEMA = 'Sales'
-- 	AND TABLE_NAME = 'SalesOrderHeader';
-- Sample rows
-- SELECT TOP 10 *
-- FROM Sales.SalesOrderHeader;
-- FROM Sales.SalesPerson;
-- FROM Sales.Person;
-- 1) Sales Rep with Most Revenue (Latest Year) online
-- SELECT TOP 5 soh.SalesPersonID,
-- CASE
-- WHEN soh.OnlineOrderFlag = 1 THEN 'Online'
-- ELSE p.FirstName + ' ' + p.LastName
-- END SalesPersonName,
-- COUNT (*) AS NumberOfSales,
-- SUM (SubTotal) AS TotalSales
-- FROM Sales.SalesOrderHeader AS soh
-- LEFT JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
-- LEFT JOIN Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID
-- WHERE YEAR (OrderDate) = (
-- SELECT MAX (YEAR (OrderDate))
-- FROM Sales.SalesOrderHeader
-- )
-- GROUP BY soh.SalesPersonID,
-- p.FirstName,
-- p.Lastname,
-- soh.OnlineOrderFlag
-- ORDER BY TotalSales DESC ;
-- Final query
SELECT TOP 1 P.FirstName + ' ' + P.LastName AS SalesPerson,
	SUM(Soh.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader Soh
	JOIN Sales.SalesPerson Sp ON Soh.SalesPersonID = Sp.BusinessEntityID
	JOIN Person.Person P ON Sp.BusinessEntityID = P.BusinessEntityID
WHERE YEAR(OrderDate) = YEAR(OrderDate))
GROUP BY P.FirstName,
	P.LastName
ORDER BY TotalRevenue DESC;
