-- ارتباط بین شاخص‌های بازیابی و بازده شیفت‌ها
SELECT 
    s.[واحد گزارش],
    AVG(s.[بازده شیفت]) AS [میانگین بازده],
    AVG(r.[درصد بازیابی]) AS [میانگین بازیابی]
FROM ShiftReport AS s
JOIN RecoveryIndicators AS r ON s.[واحد گزارش] = r.[شناسه شاخص]
WHERE s.[تاریخ گزارش] BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY s.[واحد گزارش]
ORDER BY [میانگین بازیابی] DESC, [میانگین بازده] DESC;
