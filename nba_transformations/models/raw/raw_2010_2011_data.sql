select 
    * ,
    2011 as season
from {{ source('nba_stats', 'nba_10_11_raw') }}