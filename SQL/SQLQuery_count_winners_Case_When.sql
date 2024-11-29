SELECT
    COUNT(CASE WHEN cum_return > 0.2 THEN 1 END) AS PositiveCount,
    COUNT(*) AS TotalCount,
    round(100.0 * COUNT(CASE WHEN cum_return > 0.2 THEN 1 END) / COUNT(*), 2) AS PositivePercentage
FROM strategy_table;
