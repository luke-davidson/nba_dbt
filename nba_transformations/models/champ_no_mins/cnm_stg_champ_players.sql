select
    rs.season,
    rs.player_full_name
from {{ ref('raw_stg_regseason_data') }} as rs
join {{ ref('seed_nba_champions') }} as nc
    on rs.season = nc.year and rs.player_team = nc.champion
group by season, player_full_name
