-- تغییرات موجودی مواد اولیه در انبار به تفکیک ماه
SELECT 
    CONCAT(YEAR([تاریخ انبارداری]), '-', RIGHT('0' + CAST(MONTH([تاریخ انبارداری]) AS NVARCHAR(2)), 2)) AS [ماه],
    [نوع ماده],
    SUM([مقدار]) AS [مجموع موجودی]
FROM WarehouseStock
WHERE [تاریخ انبارداری] BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY YEAR([تاریخ انبارداری]), MONTH([تاریخ انبارداری]), [نوع ماده]
ORDER BY [ماه], [مجموع موجودی] DESC;
