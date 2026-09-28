-- Q6. Monthly change in warehouse stock by material type (six-month window)
SELECT
    CONCAT(YEAR(StockDate), '-', RIGHT('0' + CAST(MONTH(StockDate) AS NVARCHAR(2)), 2)) AS [Month],
    MaterialType,
    SUM(Quantity) AS TotalStock
FROM WarehouseStock
WHERE StockDate BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY YEAR(StockDate), MONTH(StockDate), MaterialType
ORDER BY [Month], TotalStock DESC;
