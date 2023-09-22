select 
    * 
from {{ source('nba_stats', 'nba_14_15_raw') }}