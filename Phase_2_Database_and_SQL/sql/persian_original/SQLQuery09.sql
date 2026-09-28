-- تحلیل تغییرات نتایج آزمایش‌ها به تفکیک نوع آزمایش و ماه
SELECT 
    [نوع آزمایش],
    FORMAT([تاریخ آزمایش], 'yyyy-MM') AS [ماه],
    COUNT(*) AS [تعداد_آزمایش],
    SUM(CASE WHEN [نتیجه آزمایش (موفق=0 یا ناموفق=1)] = N'False' THEN 1 ELSE 0 END) AS [آزمایش _موفق],
    SUM(CASE WHEN [نتیجه آزمایش (موفق=0 یا ناموفق=1)] = N'True' THEN 1 ELSE 0 END) AS [آزمایش ناموفق]
FROM ChemicalAnalysis
WHERE [تاریخ آزمایش] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY [نوع آزمایش], FORMAT([تاریخ آزمایش], 'yyyy-MM')
ORDER BY [ماه], [نوع آزمایش];
