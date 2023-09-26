select 
    game_date,
    player_full_name,
    player_team
from {{ ref('raw_stg_union_all_data') }}
where 
    player_full_name = 'LeBron James' and 
    mins > 0