with regseason_avgs as (
    select * from {{ ref('avgs_regseason_byplayer') }}
),
playoff_avgs as (
    select * from {{ ref('avgs_playoffs_byplayer') }}
),
final as (
    select
        r.*,
        p.avg_pts_ploff,
        p.avg_mins_ploff,
        p.avg_fg_ploff,
        p.avg_fga_ploff,
        p.avg_3p_ploff,
        p.avg_3pa_ploff,
        p.avg_ft_ploff,
        p.avg_fta_ploff,
        p.avg_or_ploff,
        p.avg_dr_ploff,
        p.avg_r_ploff,
        p.avg_a_ploff,
        p.avg_pf_ploff,
        p.avg_stl_ploff,
        p.avg_to_ploff,
        p.avg_bl_ploff
    from regseason_avgs as r
    full join playoff_avgs as p using(player)
    order by player, data_set
)
select * from final