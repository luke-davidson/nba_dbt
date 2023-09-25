select 
    * ,
    2012 as season
from {{ source('nba_stats', 'nba_11_12_raw') }}