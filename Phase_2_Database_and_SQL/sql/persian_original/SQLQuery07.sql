-- تحلیل میانگین بازده واحدهای فرآیند به تفکیک ماه
SELECT 
    CONCAT(YEAR([تاریخ گزارش]), '-', RIGHT('0' + CAST(MONTH([تاریخ گزارش]) AS NVARCHAR(2)), 2)) AS [ماه],
    [واحد گزارش],
    AVG([بازده شیفت]) AS [میانگین بازده]
FROM ShiftReport
WHERE [تاریخ گزارش] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY YEAR([تاریخ گزارش]), MONTH([تاریخ گزارش]), [واحد گزارش]
ORDER BY [ماه], [میانگین بازده] DESC;
