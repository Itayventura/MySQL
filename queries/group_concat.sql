SELECT Continent, COUNT(*),
  GROUP_CONCAT(Name ORDER BY Population DESC)
FROM `Country` GROUP BY Continent