Input table --> 
input table has the info about the product sales 


| product_id | period_start | period_end | average_daily_sales |
|------------|--------------|------------|--------------------|
| 1          | 2019-01-25   | 2019-02-28 | 100.00             |
| 2          | 2018-12-01   | 2020-01-01 | 10.00              |
| 3          | 2019-12-01   | 2020-01-31 | 1.00               |


we want output as the yearly total sales as below

| product_id | years | total   |
|------------|-------|---------|
| 1          | 2019  | 3500.00 |
| 2          | 2018  | 310.00  |
| 2          | 2019  | 3650.00 |
| 2          | 2020  | 10.00   |
| 3          | 2019  | 31.00   |
| 3          | 2020  | 30.00   |


approach -->

use recursive cte to get the dates between the min period_start and max period_end date

as you get this then join the sales table with the dates. the  you will get daywise distribbution of data and then you can sum it up.
