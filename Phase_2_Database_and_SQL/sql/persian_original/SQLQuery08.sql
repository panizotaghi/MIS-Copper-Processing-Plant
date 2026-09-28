-- تحلیل مصرف انرژی به تفکیک ماه و نوع انرژی
SELECT 
    CONCAT(YEAR([تاریخ مصرف]), '-', RIGHT('0' + CAST(MONTH([تاریخ مصرف]) AS NVARCHAR(2)), 2)) AS [ماه],
    [نوع انرژی],
    SUM([مقدار مصرف]) AS [مجموع_مصرف]
FROM EnergyUsage
WHERE [تاریخ مصرف] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY YEAR([تاریخ مصرف]), MONTH([تاریخ مصرف]), [نوع انرژی]
ORDER BY [ماه], [نوع انرژی];
