-- 1. Doimiy jadval yaratish
SELECT 
    [CustomerID],
    [StoreID],
    [AccountNumber],
    Sales.SalesTerritory.[TerritoryID],
    Sales.SalesTerritory.[Name],
    Sales.SalesTerritory.[CountryRegionCode],
    Sales.SalesTerritory.[Group],
    Sales.SalesTerritory.[SalesYTD],
    Sales.SalesTerritory.[SalesLastYear],
    Sales.SalesTerritory.[CostYTD],
    Sales.SalesTerritory.[CostLastYear]
INTO dbo.YangiJadval1
FROM Sales.Customer
INNER JOIN Sales.SalesTerritory 
    ON Sales.Customer.TerritoryID = Sales.SalesTerritory.TerritoryID;

-- 2. Natijani yangi jadvalga saqlash (ustunlar mos ravishda keltirilgan)
SELECT TOP (1000)
    YJ.[CustomerID],
    YJ.[StoreID],
    YJ.[AccountNumber],
    YJ.[TerritoryID],
    YJ.[Name],
    YJ.[CountryRegionCode],
    YJ.[Group],
    YJ.[SalesYTD],
    YJ.[SalesLastYear],
    YJ.[CostYTD],
    YJ.[CostLastYear],
    SP.[TerritoryID] AS SalesPersonTerritoryID, -- agar ustun nomlari mos kelsa, alias qo'shiladi
    SP.[SalesQuota],
    SP.[Bonus],
    SP.[CommissionPct],
    SP.[SalesYTD] AS SalesPersonSalesYTD,
    SP.[SalesLastYear] AS SalesPersonSalesLastYear
INTO dbo.NatijaJadval -- Yangi jadvalga natijalarni saqlash
FROM [AdventureWorks2022].[dbo].[YangiJadval1] AS YJ
INNER JOIN [AdventureWorks2022].[Sales].[SalesPerson] AS SP
  ON SP.TerritoryID = YJ.TerritoryID;

-- 3. NatijaJadvaldagi ma'lumotlarni ko'rish (tekshirish uchun)
SELECT * 
FROM dbo.NatijaJadval;