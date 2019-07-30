-- !preview conn=con

SELECT "device",
       "referrer",
       "purchase"
FROM   trade
WHERE  "purchase" == "true"  