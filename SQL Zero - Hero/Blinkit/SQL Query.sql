select * from blinkit_store;

-- ----------------------------------------------------UPDATE---------------------------------------------------------------------

UPDATE blinkit_store
set "Item_Fat_Content" = 
	CASE
		WHEN "Item_Fat_Content" IN ('LF','low fat') THEN 'Low Fat'
		WHEN "Item_Fat_Content" = 'reg' THEN 'Regular'
		ELSE "Item_Fat_Content"
	END


select distinct "Item_Fat_Content" from blinkit_store;

------------------------------------------------------KPI'S-----------------------------------------------------------------------

-- Total Sales

SELECT CAST(SUM("Total_Sales") / 1000000 AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_store;


-- Average

SELECT ROUND(AVG("Total_Sales")::numeric,2) as Average_Sales FROM blinkit_Store;

-- No of Item


SELECT COUNT(*) AS Number_of_Items FROM blinkit_store;

-- Avg Rating

SELECT ROUND(AVG("Rating")) AS Avg_Rating FROM blinkit_store;


----------------------------------------------------------------------------------------------------------------------------------

-- Total Sales for Low Fat and Regular Fat

SELECT "Item_Fat_Content" AS Item, SUM("Total_Sales") AS Total_Sales FROM blinkit_Store
-- WHERE "Item_Fat_Content" = 'Low Fat'
GROUP BY Item;



-- Establishment Year

SELECT "Outlet_Establishment_Year", SUM("Total_Sales") AS Total_Sales FROM blinkit_Store
GROUP BY
	"Outlet_Establishment_Year"
ORDER BY
	Total_Sales DESC;

-- Total Sales by Fat Content

SELECT "Item_Fat_Content" AS item, SUM("Total_Sales") as Total_Sales,
	ROUND(AVG("Total_Sales")::numeric,2) AS Avg_Sales,
	COUNT(*) AS Number_of_item,
	ROUND(AVG("Rating")) AS Avg_Rating
FROM blinkit_store
GROUP BY
	item;


-- Total Sales By Item type Top 5

SELECT "Item_Type" AS item_type, SUM("Total_Sales") as Total_Sales,
	ROUND(AVG("Total_Sales")::numeric,2) AS Avg_Sales,
	COUNT(*) AS Number_of_item,
	ROUND(AVG("Rating")::numeric,2) AS Avg_Rating
FROM blinkit_store
GROUP BY
	item_type
ORDER BY
	Total_Sales DESC
LIMIT
	5;

-- Fat Content by Outlet for Total Sales

SELECT "Item_Fat_Content" AS item, "Outlet_Location_Type" AS Outlet_Location_Type,
	SUM("Total_Sales") as Total_Sales,
	ROUND(AVG("Total_Sales")::numeric,2) AS Avg_Sales,
	COUNT(*) AS Number_of_item,
	ROUND(AVG("Rating")::numeric,2) AS Avg_Rating
FROM blinkit_store
GROUP BY
	item, Outlet_Location_Type
ORDER BY
	Outlet_Location_Type;


-- Percentage of Sales by Outlet Size

SELECT 
  Outlet_Size, 
  ROUND( ((Total_Sales / (SELECT SUM("Total_Sales") FROM blinkit_store)) * 100)::numeric, 2 ) AS Percentage
FROM (
  SELECT 
    "Outlet_Size" AS Outlet_Size, 
    SUM("Total_Sales") AS Total_Sales 
  FROM blinkit_store
  GROUP BY Outlet_Size
) AS sub
ORDER BY
	Percentage DESC;

-- Sales By Outlet Location

SELECT "Outlet_Location_Type" AS Location_Type,
	SUM("Total_Sales") AS Total_Sales
FROM
	blinkit_Store
GROUP BY Location_Type
ORDER BY
	Location_Type;










































	



















