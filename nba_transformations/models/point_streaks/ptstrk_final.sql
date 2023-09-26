with stg as (
    select 
        season,
        player_full_name as player,
        pts_1 + coalesce(pts_2, 0) + coalesce(pts_3, 0) + coalesce(pts_4, 0) + coalesce(pts_5, 0) as pt_streak,
        game_1,
        pts_1,
        game_2,
        pts_2,
        game_3,
        pts_3,
        game_4,
        pts_4,
        game_5,
        pts_5
    from {{ ref('ptstrk_stg_consec_5_games') }}
),
final as (
    select 
        dense_rank() over (order by pt_streak desc) as rank,
        case when pts_2 is null then 0 else 1 end +
        case when pts_3 is null then 0 else 1 end + 
        case when pts_4 is null then 0 else 1 end + 
        case when pts_5 is null then 0 else 1 end + 1 as num_games,
        *
    from stg
    order by pt_streak desc
)
select * from final