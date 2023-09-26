with did_bron_play as (
    select * from {{ ref('bb_stg_did_bron_play') }}
),
opposing_player_data as (
    select * from {{ ref('bb_stg_players_vs_bron_at_home') }}
),
counts as (
    select
        season,
        player,
        count(*) as total_times_played_bron_away,
        count(case when opd.pts > opd.avg_pts_reg then 1 end) as over_avg
    from opposing_player_data as opd
    group by season, player
),
final as (
    select 
        season,
        player,
        round(over_avg*100/total_times_played_bron_away, 2) as percent
    from counts
)
select 
    season,
    player
from final
where percent = 100
order by season asc