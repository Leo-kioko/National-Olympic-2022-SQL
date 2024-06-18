SELECT * FROM olympics.noc_2022_medals;


SELECT Country, Total_gold
from olympics.noc_2022_medals
order by Total_gold DESC;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Total_gold>0 or Total_silver>0 or Total_bronze>0;

SELECT Country,
(Summer_total_medals + Winter_total_medals) AS Total_medals
from olympics.noc_2022_medals
order by Total_medals desc;

SELECT Country, Total_silver
from olympics.noc_2022_medals
order by Total_silver desc
limit 1;

SELECT Country, avg(Total_bronze) AS Average_bronze_medals
from olympics.noc_2022_medals
group by Country
order by Average_bronze_medals DESC;

SELECT Country, Summer_total_medals, Winter_total_medals
from olympics.noc_2022_medals
where Winter_total_medals>0 and Summer_total_medals>0;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Winter_total_medals>0 and Summer_total_medals>0;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Total_gold>10;

SELECT Total_gold, Total_silver, Total_bronze, (Total_gold + Total_silver + Total_bronze) AS Total_medals
from olympics.noc_2022_medals
order by Total_medals desc;

SELECT SUM(Total_gold + Total_silver + Total_bronze) AS Total_medals
from olympics.noc_2022_medals;

ALTER TABLE olympics.noc_2022_medals
ADD COLUMN Total_medals INT;

UPDATE olympics.noc_2022_medals
SET Total_medals = Total_gold + Total_silver + Total_bronze;



SELECT * FROM olympics.noc_2022_medals;

SELECT Country, Total_medals
from olympics.noc_2022_medals
where Total_medals IN(
SELECT Total_medals
from olympics.noc_2022_medals
group by Total_medals
having count(*)>1
)
order by Total_medals DESC;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Total_gold=0 and Total_silver>0 and Total_bronze>0;

SELECT MAX(Total_medals) AS Most_medals
from olympics.noc_2022_medals;

SELECT Country, MIN(Total_medals) AS Least_medals
from olympics.noc_2022_medals
group by Country
order by Least_medals asc;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Total_silver>Total_gold;

SELECT
(SELECT count(distinct Country)
from olympics.noc_2022_medals
where Total_gold>0) *100.0/
(SELECT count(distinct Country) from olympics.noc_2022_medals) 
AS Percentage_Countries_With_Gold;

SELECT Country, Total_gold, Total_medals,
(Total_gold/Total_medals *1.0) AS Gold_to_Total_Ratio
from olympics.noc_2022_medals
order by Gold_to_Total_Ratio desc
limit 1;

SELECT count(distinct Country)
from olympics.noc_2022_medals
where Winter_total_medals>0;


SELECT AVG(Total_medals) AS Median_Total_Medals
FROM (
    SELECT Country, 
           Total_medals,
           @rownum := @rownum + 1 AS THERANK,
           @total_rows := @rownum
    FROM olympics.noc_2022_medals,
    (SELECT @rownum := 0) r
    ORDER BY Total_medals
) AS ranked
WHERE THERANK IN (FLOOR(@total_rows / 2) + 1, CEIL(@total_rows / 2));



SELECT * FROM olympics.noc_2022_medals;

SELECT Country, Total_medals
from olympics.noc_2022_medals
where Total_medals %2 <> 0 
order by Total_medals desc;

SELECT count(distinct Country) AS Countries_Equal_Medals
from olympics.noc_2022_medals
where Total_gold = Total_silver 
and Total_silver = Total_bronze;

SELECT Country, Total_medals
from olympics.noc_2022_medals
where Total_medals>(
SELECT avg(Total_medals)
from olympics.noc_2022_medals
)
order by Total_medals desc;

SELECT avg(Total_medals)
from olympics.noc_2022_medals;
