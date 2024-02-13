create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

select * from holidays;
select * from tickets;


with holiday_dates as (
select ticket_id, create_date, resolved_date, count(holiday_date) number_of_holidays
from tickets
left JOIN holidays
on (holidays.holiday_date  BETWEEN tickets.create_date and tickets.resolved_date) and DATENAME(DW,holiday_date) not in('Sunday','Saturday')
group by ticket_id, create_date, resolved_date
)
select t.*,datediff(day, t.create_date, t.resolved_date) total_days,
DATEDIFF(WEEK,t.create_date,t.resolved_date) week_diff,
(datediff(day, t.create_date, t.resolved_date) - 
2* DATEDIFF(WEEK,t.create_date,t.resolved_date) -
hd.number_of_holidays
) as actual_dates_required
from tickets t 
join holiday_dates hd
on t.ticket_id = hd.ticket_id;



SELECT * 
from tickets t 
left join holidays h 
on h.holiday_date BETWEEN create_date and resolved_date 
and  DATENAME(dw,h.holiday_date) not in ('Saturday','Sunday');