select 
    * 
from {{ source('nba_stats', 'nba_12_13_raw') }}