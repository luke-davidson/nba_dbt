select 
    * ,
    2015 as season
from {{ source('nba_stats', 'nba_14_15_raw') }}