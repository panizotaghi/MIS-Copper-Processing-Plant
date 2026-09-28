-- شناسایی مواد اولیه با بیشترین استفاده در شیفت‌های با بازده بالا
SELECT 
    m.[نوع ماده],
    SUM(m.[وزن]) AS [مجموع مواد مصرفی]
FROM MaterialFlow AS m
JOIN ShiftReport AS s ON m.[شناسه واحد] = s.[واحد گزارش]
WHERE s.[بازده شیفت] > 80 AND m.[تاریخ] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY m.[نوع ماده]
ORDER BY [مجموع مواد مصرفی] DESC;