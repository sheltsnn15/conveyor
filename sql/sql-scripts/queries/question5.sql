-- What is the total number of employees in each department ?
USE AdventureWorks2022
GO;
-- SELECT d.Name as DepartmentName,
-- 	COUNT(
-- 		CASE
-- 			WHEN edh.EndDate IS NULL THEN edh.BusinessEntityID
-- 		END
-- 	) as CurrentEmployeeCount,
-- 	COUNT(
-- 		CASE
-- 			WHEN edh.EndDate IS NOT NULL THEN edh.BusinessEntityID
-- 		END
-- 	) as PastEmployeeCount,
-- 	COUNT(edh.BusinessEntityID) as TotalHistoricalCount
-- FROM HumanResources.EmployeeDepartmentHistory AS edh
-- 	JOIN HumanResources.Department AS d ON d.DepartmentID = edh.DepartmentID
-- GROUP BY d.Name
-- ORDER BY CurrentEmployeeCount DESC;
SELECT d.Name AS DepartmentName,
	COUNT(*) AS EmployeeCount
FROM HumanResources.EmployeeDepartmentHistory AS edh
	JOIN HumanResources.Department AS d ON d.DepartmentID = edh.DepartmentID
-- WHERE edh.EndDate IS NULL
GROUP BY d.Name
ORDER BY EmployeeCount DESC;


