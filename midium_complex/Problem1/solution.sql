select * from icc_world_cup;

with cte1 as (
select team_1 , case when team_1 = winner then 1 else 0 end win_flag from icc_world_cup
union all
select team_2, case when team_2 = winner then 1 else 0 end win_flag from icc_world_cup)
select team_1,count(team_1) as total_matches, sum(win_flag) as total_wins
from cte1
group by team_1 order by total_wins desc
;