-- ارتباط میان مواد مصرف‌شده و بازده شیفت‌ها
SELECT 
    [نوع ماده],
    SUM([وزن]) AS [مواد مصرف شده],
    (SELECT AVG([بازده شیفت]) 
     FROM ShiftReport 
     WHERE [شناسه واحد] = m.[شناسه واحد]) AS [میانگین بازده]
FROM MaterialFlow AS m
WHERE [تاریخ] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY [نوع ماده], [شناسه واحد]
ORDER BY [مواد مصرف شده] DESC;
