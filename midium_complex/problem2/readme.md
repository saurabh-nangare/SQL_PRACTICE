we have to find out how many customers are new for a perticular day and how many are old cutomers visited on that day
input --> 

order_id	customer_id	order_date	order_amount
1	100	2022-01-01	2000
2	200	2022-01-01	2500
3	300	2022-01-01	2100
4	100	2022-01-02	2000
5	400	2022-01-02	2200
6	500	2022-01-02	2700
7	100	2022-01-03	3000
8	400	2022-01-03	1000
9	600	2022-01-03	3000

output --> 


order_date	first_visit_flag	repeat_visit_flag
2022-01-01	3	0
2022-01-02	2	1
2022-01-03	1	2


