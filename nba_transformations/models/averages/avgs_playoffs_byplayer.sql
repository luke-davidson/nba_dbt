select 
    season,
    player_full_name as player,
    avg(pts) as avg_pts_ploff,
    avg(mins) as avg_mins_ploff,
    avg(fg) as avg_fg_ploff,
    avg(fga) as avg_fga_ploff,
    avg(_3p) as avg_3p_ploff,
    avg(_3pa) as avg_3pa_ploff,
    avg(ft) as avg_ft_ploff,
    avg(fta) as avg_fta_ploff,
    avg(o_r) as avg_or_ploff,
    avg(d_r) as avg_dr_ploff,
    avg(r) as avg_r_ploff,
    avg(a) as avg_a_ploff,
    avg(pf) as avg_pf_ploff,
    avg(stl) as avg_stl_ploff,
    avg(t_o) as avg_to_ploff,
    avg(bl) as avg_bl_ploff
from {{ ref('raw_stg_playoff_data') }}
group by player_full_name, season
order by avg_pts_ploff desc