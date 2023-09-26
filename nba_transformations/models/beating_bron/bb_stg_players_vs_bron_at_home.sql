with vs_bron_data as (
    select 
        r.*
    from {{ ref('raw_stg_union_all_data') }} as r
    join {{ ref('bb_stg_did_bron_play') }} as dbp 
    on (r.game_date = dbp.game_date and r.opposing_team = dbp.player_team)
    where r.game_loc = 'R' and r.mins > 0
),
final as (
    select 
        vbr.season,
        vbr.data_set,
        vbr.game_date,
        af.player,
        vbr.opposing_team,
        vbr.pts,
        af.avg_pts_reg
    from vs_bron_data as vbr
    left join {{ ref('avgs_final') }} as af 
    on (vbr.player_full_name = af.player and 
        vbr.season = af.season)
)
select * from final