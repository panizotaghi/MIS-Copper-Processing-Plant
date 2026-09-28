-- تحلیل هزینه و وزن محموله‌ها به تفکیک مقصد و ماه
SELECT 
    [مقصد],
    FORMAT([تاریخ ارسال], 'yyyy-MM') AS [ماه],
    SUM([وزن خشک]) AS [کل وزن],
    COUNT(*) AS [تعداد محموله]
FROM Shipment
WHERE [تاریخ ارسال] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY [مقصد], FORMAT([تاریخ ارسال], 'yyyy-MM')
ORDER BY [ماه], [کل وزن] DESC;
