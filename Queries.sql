/* Ouery that finds the top 3 consultants that have the highest aggregated score*/

SELECT CST_FNAME AS ConsultantName, SUM(Score) AS AggregatedScore
FROM Consultants JOIN consultants_expertise USING(CST_IDNO) JOIN expertise_details USING(EXP_NO)
GROUP BY ConsultantName/*sum up score for each consultant*/
ORDER BY AggregatedScore DESC/*sets the rows: highest score consultant in the first row and lowest in the last row*/
LIMIT 3;/*limit the number of rows to 3*/
/* the query returns: ConsultantName, AggregatedScore
                      Joseph        ,130
                      Michale       ,120
                      Jhon          ,110              */



