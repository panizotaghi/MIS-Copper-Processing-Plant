-- شناسایی محصولاتی که تولید آن‌ها روند افزایشی دارد
SELECT 
    [نام محصول],
    [تاریخ],
    [تعداد],
    [تغییرات]
FROM (
    SELECT 
        [نام محصول],
        [تاریخ],
        [تعداد],
        [تعداد] - LAG([تعداد]) OVER (PARTITION BY [نام محصول] ORDER BY [تاریخ]) AS [تغییرات]
    FROM ProductFlow
    WHERE [تاریخ] BETWEEN '2025-01-01' AND '2025-06-01'
) AS SubQuery
WHERE [تغییرات] > 0
ORDER BY [نام محصول], [تاریخ];
