select 
    * ,
    2013 as season
from {{ source('nba_stats', 'nba_12_13_raw') }}