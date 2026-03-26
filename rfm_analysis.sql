SELECT 
    Segment,
    COUNT(DISTINCT "Customer ID") AS Customer_Count,
    ROUND(SUM(Monetary), 2) AS Total_Revenue,
    ROUND(AVG(Monetary), 2) AS Avg_Customer_Revenue,
    ROUND(AVG(Recency), 1) AS Avg_Recency_Days,
    ROUND(AVG(Frequency), 1) AS Avg_Orders,
    ROUND(SUM(Monetary) * 100.0 / (SELECT SUM(Monetary) FROM rfm_segments), 2) AS Revenue_Pct
FROM rfm_segments
GROUP BY Segment
ORDER BY Total_Revenue DESC;