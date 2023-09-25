select 
    season,
    player_full_name as player,
    avg(pts) as avg_pts_reg,
    avg(mins) as avg_mins_reg,
    avg(fg) as avg_fg_reg,
    avg(fga) as avg_fga_reg,
    avg(_3p) as avg_3p_reg,
    avg(_3pa) as avg_3pa_reg,
    avg(ft) as avg_ft_reg,
    avg(fta) as avg_fta_reg,
    avg(o_r) as avg_or_reg,
    avg(d_r) as avg_dr_reg,
    avg(r) as avg_r_reg,
    avg(a) as avg_a_reg,
    avg(pf) as avg_pf_reg,
    avg(stl) as avg_stl_reg,
    avg(t_o) as avg_to_reg,
    avg(bl) as avg_bl_reg
from {{ ref('raw_stg_regseason_data') }}
group by player_full_name, season
order by avg_pts_reg desc