with plyrs_on_champ as (
    select * from {{ ref('cnm_stg_champ_players') }}
),
add_avg_mins as (
    select 
        poc.*,
        ars.avg_mins_reg
    from plyrs_on_champ as poc
    left join {{ ref('avgs_regseason') }} as ars
    on poc.player_full_name = ars.player and poc.season = ars.season
),
final as (
    select 
        *
    from add_avg_mins as aam 
    where avg_mins_reg < 5
    order by season asc
)
select * from final