select 
    * ,
    2014 as season
from {{ source('nba_stats', 'nba_13_14_raw') }}