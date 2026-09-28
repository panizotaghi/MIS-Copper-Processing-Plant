-- شناسایی روند تغییرات نتایج آزمایش‌های شیمیایی موفق
SELECT 
    FORMAT([تاریخ آزمایش], 'yyyy-MM') AS [ماه],
    COUNT(*) AS [آزمایش موفق],
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY FORMAT([تاریخ آزمایش], 'yyyy-MM')) AS [تغییرات موفقیت]
FROM ChemicalAnalysis
WHERE [نتیجه آزمایش (موفق=0 یا ناموفق=1)] = N'False' AND [تاریخ آزمایش] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY FORMAT([تاریخ آزمایش], 'yyyy-MM')
ORDER BY [ماه];
