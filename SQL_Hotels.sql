-- Creating a view for combining 2018 to 2020 Hotel Data
CREATE VIEW vwhotels AS 
	SELECT *
	FROM dbo.['2018']
	UNION
	SELECT *
	FROM dbo.['2019']
	UNION
	SELECT *
	FROM dbo.['2020']

-- Retrieve the yearly revenue per hotel type with the revenue in US notation
SELECT
	arrival_date_year,
	hotel,
	FORMAT(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr), 'C', 'en-us') yearlyRevenue
FROM dbo.vwhotels
GROUP BY arrival_date_year, hotel

-- Join the discount and meal data to the combined hotel data
SELECT *
FROM dbo.vwhotels v
LEFT JOIN dbo.market_segment ms ON v.market_segment = ms.market_segment
LEFT JOIN dbo.meal_cost mc ON v.meal = mc.meal



-- Scratch works
SELECT * FROM vwhotels
SELECT * FROM dbo.market_segment
SELECT * FROM dbo.meal_cost