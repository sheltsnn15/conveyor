-- List the top 5 products by total sales amount.
USE AdventureWorks2022
GO;
-- SELECT TOP 10 *
-- FROM Production.Product;
-- FROM Sales.SalesOrderDetail;
SELECT TOP 5 p.ProductID,
	p.Name AS ProductName,
	SUM(sod.OrderQty) AS TotalQtySold,
	CAST(SUM(sod.LineTotal) AS DECIMAL(18, 2)) AS TotalSalesAmt
FROM Sales.SalesOrderDetail AS sod
	JOIN Production.Product AS p ON p.ProductID = sod.ProductID
GROUP BY p.ProductID,
	p.Name
ORDER BY TotalSalesAmt DESC;
