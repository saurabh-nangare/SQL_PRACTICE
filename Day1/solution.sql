SELECT [a].[TRADE_ID],
[a].[Trade_Timestamp],
[a].[Trade_Stock],
[a].[Quantity],
[a].[Price],
ABS(a.Price-b.Price)/b.price * 100 
FROM Trade_tbl a 
INNER JOIN Trade_tbl b
on a.TRADE_ID < b.TRADE_ID
AND  DATEDIFF(SECOND,a.Trade_Timestamp,b.Trade_Timestamp) < 10
AND ABS(a.Price-b.Price)/b.Price * 100 > 10
ORDER BY a.TRADE_ID DESC;
