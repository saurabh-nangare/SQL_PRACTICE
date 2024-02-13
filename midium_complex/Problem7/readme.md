we have two tables -->

holidays -

| holiday_date | reason          |
|--------------|-----------------|
| 2022-08-11   | Rakhi           |
| 2022-08-15   | Independence day |


Tickets - 

| ticket_id | create_date | resolved_date |
|-----------|-------------|---------------|
| 1         | 2022-08-01  | 2022-08-03    |
| 2         | 2022-08-01  | 2022-08-12    |
| 3         | 2022-08-01  | 2022-08-16    |



We need to calculate the actual business days taked to resolve the tickets

| ticket_id | create_date | resolved_date | total_days | week_diff | actual_dates_required |
|-----------|-------------|---------------|------------|-----------|-----------------------|
| 1         | 2022-08-01  | 2022-08-03    | 2          | 0         | 2                     |
| 2         | 2022-08-01  | 2022-08-12    | 11         | 1         | 8                     |
| 3         | 2022-08-01  | 2022-08-16    | 15         | 2         | 9                     |
