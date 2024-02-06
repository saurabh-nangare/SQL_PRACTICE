select * from events;

select gold as name, count(*) as total from events 
where gold not in (select silver from events union all select bronze from events)
group by gold;

select * from events;