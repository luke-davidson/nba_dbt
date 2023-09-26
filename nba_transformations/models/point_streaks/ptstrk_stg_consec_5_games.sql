select 
    season,
    player_full_name,
    player_team,
    game_date as game_1, 
    pts as pts_1,
    lead(game_date, 1) over (partition by season, player_full_name order by game_date asc) as game_2,
    lead(pts, 1) over (partition by season, player_full_name order by game_date asc) as pts_2,
    lead(game_date, 2) over (partition by season, player_full_name order by game_date asc) as game_3,
    lead(pts, 2) over (partition by season, player_full_name order by game_date asc) as pts_3,
    lead(game_date, 3) over (partition by season, player_full_name order by game_date asc) as game_4,
    lead(pts, 3) over (partition by season, player_full_name order by game_date asc) as pts_4,
    lead(game_date, 4) over (partition by season, player_full_name order by game_date asc) as game_5,
    lead(pts, 4) over (partition by season, player_full_name order by game_date asc) as pts_5
from {{ ref('raw_stg_regseason_data') }}