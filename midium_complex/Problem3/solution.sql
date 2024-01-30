
select * from flights;

with cte1 as(
select cid,min(fid) first_flight,max(fid) last_flight
from flights
group by cid),
cte2 as
(select fid,origin,destination from flights)
select cte1.cid, a.origin,b.Destination from cte1
join cte2 a
on cte1.first_flight = a.fid 
join cte2  b
on cte1.last_flight = b.fid


