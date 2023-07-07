select gold, count(1) rnk
from events
where GOLD not in(select SILVER from events)
and gold not in (select BRONZE from events)
group by gold
order by rnk desc;

--OR

select gold , count(1) rnk
from events 
where gold not in (
select silver from events
union 
select bronze from events)
group by gold
order by rnk desc;
