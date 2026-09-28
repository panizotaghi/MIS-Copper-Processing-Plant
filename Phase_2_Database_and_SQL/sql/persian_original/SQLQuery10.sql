-- شناسایی فرآیندهایی با بیشترین شاخص بازیابی موفق
SELECT 
    [نوع فرآیند],
    COUNT(*) AS [تعداد موفقیت],
    AVG([درصد بازیابی]) AS [میانگین بازیابی]
FROM RecoveryIndicators
WHERE [شناسه شاخص] IN (
    SELECT [شناسه آزمایش]
    FROM ChemicalAnalysis
    WHERE [نتیجه آزمایش (موفق=0 یا ناموفق=1)] = N'False'
)
GROUP BY [نوع فرآیند]
ORDER BY [تعداد موفقیت] DESC, [میانگین بازیابی] DESC;
